import 'dart:io';

import 'package:cle_app/api/Model/push_notification_model.dart';
import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/providers/dashboard_provider.dart';
import 'package:cle_app/providers/expence_provider.dart';
import 'package:cle_app/providers/location_provider.dart';
import 'package:cle_app/providers/map_provider.dart';
import 'package:cle_app/providers/notification_provider.dart';
import 'package:cle_app/providers/providers.dart';
import 'package:cle_app/providers/settings_provider.dart';
import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/providers/truck_provider.dart';
import 'package:cle_app/screens/chat/chat.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/errors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'services/authentication.dart';
import 'services/network_service.dart';
import 'services/secure_storage.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalData().init();
  final token = await SecureStore.getToken();

  if (kDebugMode) {
    print("AuthToken " '${token.toString()}');
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  HttpOverrides.global = MyHttpOverrides();

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if (kDebugMode) {
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');
  //   }

  //   if (message.notification != null) {
  //     if (kDebugMode) {
  //       print('Message also contained a notification: ${message.notification}');
  //     }
  //   }
  // });
  FirebaseMessaging.instance.getToken().then((token) async {
    if (kDebugMode) {
      print('This is Token: ' '$token');
    }
    if (!await AuthenticationService().isAuthenticated()) {
      if (kDebugMode) {
        print('No Error');
      }
      return;
    }
    if (await NetworkService().isConnected()) {
      try {
        final tokenAuth = await AuthenticationService().getToken();
        //   await SecureStore.getUsername();
        //  final AuthUserID = await AuthenticationService().;
        final fcmData = await ApiClient.create().fcmtoken(
            tokenAuth, {"user_id": LocalData().user.id, "fcm_token": "$token"});

        if (kDebugMode) {
          print('fcm token for server ${fcmData.body.toString()}');
        }
        //   Notification =Notfication.fromJson(NotilListData.body,);
        final notifiyList = ApiUtil.interceptResponce(
          fcmData,
        );
        return notifiyList;
      } catch (e) {
        errorToast();
      }
    } else {
      return [];
    }
  });
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: ((_) => LoginProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => DashboardProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => TruckProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => ShipmentProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => LocationProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => MapProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => NotificationProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => ExpenceProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => SettingsProvider()),
    ),
    Provider(
      create: ((_) => ApiClient.create()),
      dispose: (_, ApiClient client) => client.client.dispose(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FirebaseMessaging _messaging;
  late int totolnotificationcounter;
  PushNotificationModel? notificationinfo;

  @override
  void initState() {
    totolnotificationcounter = 0;
    super.initState();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          '/message',
          arguments: const ChatsPage(),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
      }
      Navigator.pushNamed(
        context,
        '/message',
        arguments: const ChatsPage(),
      );
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             icon: '@mipmap/ic_launcher',
    //           ),
    //         ));
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //
    //   print('A New onapended Message event was published');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => ChatsPage()),
    //     );
    //
    // });
    regidternotification();
  }

  void regidternotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print("permission granted");
      }
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationModel notification = PushNotificationModel(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body']);

        setState(() {
          totolnotificationcounter++;
          notificationinfo = notification;
        });
        if (kDebugMode) {
          print("checkabout" + notification.body.toString());
        }
        // getToken();
      });
    } else {
      if (kDebugMode) {
        print('permission decline');
      }
    }
  }

  late String token;
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    if (kDebugMode) {
      print("checktoken" + token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          initialRoute: Routes.initialPage,
          navigatorKey: AppRouter.rootNavigator,
          onGenerateRoute: AppRouter.generateRootRoutes,
        ));
  }
}
