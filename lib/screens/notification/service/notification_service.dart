import 'package:e_commerce_app/screens/notification/model/notifications_model.dart';

class NotificationService {
  Future getNotification() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      NotificationModel(
        title: "30% Special Discount!",
        description: "Special promotion only valid today",
        type: NotificationType.percent,
      ),
      NotificationModel(
        title: "Top Up E-Wallet Succesfsull!",
        description: "You have to top up your e-wallet",
        type: NotificationType.wallet,
      ),
      NotificationModel(
        title: "New Services Available!",
        description: "Now you can track orders in real time",
        type: NotificationType.location,
      ),
      NotificationModel(
        title: "Credit Card Connected!",
        description: "Credt card has been linked!",
        type: NotificationType.creditCart,
      ),
      NotificationModel(
        title: "Account Setup Successful!",
        description: "Your account has been created",
        type: NotificationType.account,
      ),
    ];
  }
}
