import 'dart:io';

import 'package:cle_app/api/Model/PushNotificationModel.dart';
import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/providers/dashboard_provider.dart';
import 'package:cle_app/providers/providers.dart';
import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/providers/truck_provider.dart';
import 'package:cle_app/screens/chat/chat.dart';
import 'package:cle_app/screens/chat/chatdetails.dart';
import 'package:cle_app/util/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A Big MEssage just showed up : ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  HttpOverrides.global = new MyHttpOverrides();
  await LocalData().init();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // transparent status bar
  // ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: ((_) => LoginProvider()),
    ),
    ChangeNotifierProvider(
      create: ((_) => TruckProvider()),
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
  PushNotificationModel? _notificationinfo;


  void initState() {
    totolnotificationcounter = 0;
    super.initState();

    FirebaseMessaging.instance
        .getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          '/message',
          arguments: ChatsPage(),
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
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        '/message',
        arguments: ChatsPage(),
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
      print("permission granted");
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationModel notification = PushNotificationModel(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body']);

        setState(() {
          totolnotificationcounter++;
          _notificationinfo = notification;
        });
        if (notification != null) {
          print("checkabout" + notification.body.toString());
        }
        getToken();
      });
    } else {
      print('permission decline');
    }
  }

  late String token;

  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print("checktoken" + token);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiProvider(
        providers: [
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
          Provider(
            create: ((_) => ApiClient.create()),
            dispose: (_, ApiClient client) => client.client.dispose(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          // home: LoginWithBiometricPage(),
          initialRoute: Routes.initialPage,
          navigatorKey: AppRouter.rootNavigator,
          onGenerateRoute: AppRouter.generateRootRoutes,
        ),
      ),
    );
  }
}
