import 'dart:developer';

import 'package:e_commerce_app/locator.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:e_commerce_app/screens/notification/model/notifications_model.dart';
import 'package:e_commerce_app/screens/notification/service/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationViewmodel with ChangeNotifier implements NotificationService {
  final _service = locator<NotificationService>();
  List<NotificationModel>? notificationModel;
  NotificationViewmodel() {
    getNotification();
  }

  ViewState _state = ViewState.busy;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  @override
  Future getNotification() async {
    try {
      notificationModel = await _service.getNotification();
      inspect(notificationModel);
      state = ViewState.idle;
    } catch (e) {
      state = ViewState.error;
    }
  }
}
