class NotificationModel {
  final String title;
  final String description;
  final NotificationType type;

  NotificationModel(
      {required this.title, required this.description, required this.type});
}

enum NotificationType {
  percent,
  wallet,
  location,
  creditCart,
  account,
}
