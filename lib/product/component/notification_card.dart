import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/screens/notification/model/notifications_model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends Container {
  final NotificationModel model;
  final BuildContext context;
  NotificationCard({Key? key, required this.model, required this.context})
      : super(
          key: key,
          height: 120,
          padding: context.paddingNormal,
          margin: context.paddingLow,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                child: _getNotificationIcon(model.type),
              ),
              title: Text(model.title),
              subtitle: Text(model.description),
            ),
          ),
        );
}

Icon _getNotificationIcon(NotificationType type) {
  switch (type) {
    case NotificationType.percent:
      return const Icon(
        Icons.percent_outlined,
        color: Colors.white,
      );

    case NotificationType.wallet:
      return const Icon(
        Icons.wallet_outlined,
        color: Colors.white,
      );

    case NotificationType.location:
      return const Icon(
        Icons.location_on_outlined,
        color: Colors.white,
      );

    case NotificationType.creditCart:
      return const Icon(
        Icons.credit_card_outlined,
        color: Colors.white,
      );

    case NotificationType.account:
      return const Icon(
        Icons.person_outline,
        color: Colors.white,
      );
  }
}
