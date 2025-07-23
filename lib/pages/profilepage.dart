import 'package:flutter/material.dart';
import '../widgets/profile_item.dart'; // تأكد من المسار حسب مشروعك

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // صورة ومعلومات المستخدم
            Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Wasim Watson',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'wsm1900@gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // عناصر الملف الشخصي كويجيتات منفصلة
            ProfileItem(
              title: 'My orders',
              subtitle: 'Already have 10 orders',
              onTap: () => Navigator.pushNamed(context, '/orders'),
            ),
            ProfileItem(
              title: 'Shipping Addresses',
              subtitle: '03 Addresses',
              onTap: () => Navigator.pushNamed(context, '/shipping'),
            ),
            ProfileItem(
              title: 'Payment Method',
              subtitle: 'You have 2 cards',
              onTap: () => Navigator.pushNamed(context, '/payment'),
            ),
            ProfileItem(
              title: 'My reviews',
              subtitle: 'Reviews for 5 items',
              onTap: () => Navigator.pushNamed(context, '/review'),
            ),
            ProfileItem(
              title: 'Setting',
              subtitle: 'Notification, Password, FAQ, Contact',
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),

      // 🚀 البوتوم نافيكيشن
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/homepage');
              break;
            case 1:
              Navigator.pushNamed(context, '/favorites');
              break;
            case 2:
              Navigator.pushNamed(context, '/notificaton');
              break;
            case 3:
              // بروفايل، ما منعمل شي
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
