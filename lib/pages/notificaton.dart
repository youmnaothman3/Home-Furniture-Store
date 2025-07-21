import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/model/notification-model.dart';
import 'package:furniturestore/pages/favorites.dart';
import 'package:furniturestore/widgets/notificaton-list.dart';

class NotificatonPage extends StatefulWidget {
  const NotificatonPage({super.key});

  @override
  State<NotificatonPage> createState() => _NotificatonPageState();
}

class _NotificatonPageState extends State<NotificatonPage> {


    int selectedIndex = 2;
void onNavTap(int index){
  
  if (index == selectedIndex) return;
  setState(() {
      selectedIndex = index;
    });

    // التنقل بين الصفحات حسب الإندكس
      if (index == 0) {
      Navigator.pushNamed(context, '/homepage');
    }else if (index == 1) {
      Navigator.pushNamed(context,'/favorites');
    }
     else if (index == 3) {
      Navigator.pushNamed(context,'/profile');
    }
}
  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = [
      NotificationModel(
        title: 'Your order #123456789 has been shipped successfully',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'assets/images/lamp.jpg',
        date: '19:20',
        isNew: true,
      ),
      NotificationModel(
        title: 'Your order #123456789 has been confirmed',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'assets/images/lamp.jpg',
        date: '18:50',
        isNew: false,
      ),
      // أضف المزيد حسب الحاجة
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: NotificationList(notifications: notifications),
      bottomNavigationBar: BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: onNavTap,
    // (index) {
    //   setState(() {
    //     selectedIndex = index;
    //   });
    // },
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: CustomBottomNavIcon(
          assetPath: IconAssets.clarity_home,
          isSelected: selectedIndex == 0,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: CustomBottomNavIcon(
          assetPath: IconAssets.marker,
          isSelected: selectedIndex == 1,
        ),
        label: 'Favorite',
      ),
      BottomNavigationBarItem(
        icon: CustomBottomNavIcon(
          assetPath: IconAssets.bell,
          isSelected: selectedIndex == 2,
        ),
        label: 'Notification',
      ),
      BottomNavigationBarItem(
        icon: CustomBottomNavIcon(
          assetPath: IconAssets.group,
          isSelected: selectedIndex == 3,
        ),
        label: 'Cart',
      ),
    ],
  ),
    );
  }
}