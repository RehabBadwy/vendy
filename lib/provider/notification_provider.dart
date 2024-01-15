import 'package:flutter/material.dart';
import 'package:vendy_station/data/model/notification_model.dart';

import '../data/repo/base/api_response.dart';
import '../data/repo/notification_repo.dart';

class NotifiactionUserProvider with ChangeNotifier {

  final NotificationRepo? notificationRepo;

  NotifiactionUserProvider({required this.notificationRepo});

  NotificationModel? _notificationModel;
  NotificationModel? get notificationModel => _notificationModel;
  Future<void> getNotificationUser(BuildContext context/*,{bool reload = false}*/,) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await notificationRepo!.getNotification();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _notificationModel = NotificationModel.fromJson(apiResponse.response!.data);
      print(notificationModel!.notifications!.length);
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
}