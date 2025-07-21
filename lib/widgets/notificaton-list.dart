import 'package:flutter/material.dart';
import 'package:furniturestore/model/notification-model.dart';
import 'package:furniturestore/widgets/notificaton-item.dart';


class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return NotificationItem(item: notifications[index]);
      },
    );
  }
}