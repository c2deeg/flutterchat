import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/errors.dart';
import 'package:flutter/foundation.dart';

import '../Notification/Notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Result> _notificationsList = [];
  int _notificationCount = 0;

  bool get isloading => _isLoading;
  List<Result> get notificationsList => _notificationsList;
  int get notificationCount => _notificationCount;

  NotificationProvider() {
    init();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setNotificationCount(int count) async {
    _notificationCount = count;
    notifyListeners();
  }

  setNotificationList(List<Result> notifications) async {
    _notificationsList = notifications;
    notifyListeners();
  }

  Future<void> getAllNotification() async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();
        final notilListData = await ApiClient.create().getallnotication(token);
        ModelNotifications notifications = ModelNotifications.fromJson(
          notilListData.body,
        );
        if (notifications.result != null) {
          setNotificationList(notifications.result!);
          setNotificationCount(notifications.result!.length);
        } else {
          setNotificationList([]);
          setNotificationCount(0);
        }
      } catch (e) {
        errorToast();
      }
    } else {
      noInternetToast();
    }
  }

  Future<List<String>> deleteNotification(int id) async {
    if (await NetworkService().isConnected()) {
      try {
        final tokenAuth = await AuthenticationService().getToken();
        final fcmData = await ApiClient.create()
            .deleteNotification(id.toString(), tokenAuth);
        if (kDebugMode) {
          print('fcm token for server ${fcmData.body.toString()}');
        }
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
    return [];
  }

  init() async {
    await getAllNotification();
  }
}
