import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'explore_page.dart';
import 'cart_page.dart';
import 'whislist_page.dart';
import 'home_screen.dart';
import 'order histori_page.dart';
import 'shipping address_page.dart';
import 'login_screen.dart'; // ✅ Import halaman login

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('👤 Profil', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        onTap: (index) {
          if (index == 4) return;
          Widget page;
          switch (index) {
            case 0:
              page = const HomeScreen();
              break;
            case 1:
              page = const ExplorePage();
              break;
            case 2:
              page = const CartPage();
              break;
            case 3:
              page = const WhislistPage();
              break;
            default:
              return;
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.shoppingCart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('ALBERT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Albert45@gmail.com',
                            style: TextStyle(color: Colors.white70)),
                        SizedBox(width: 4),
                        Icon(Icons.edit, color: Colors.white54, size: 16),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(color: Colors.white24, height: 32),

          _buildMenuItem(
            icon: LucideIcons.package,
            text: 'Order History',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderHistoryScreen()),
              );
            },
          ),
          _buildMenuItem(
            icon: LucideIcons.home,
            text: 'Shipping Address',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShippingAddressPage()),
              );
            },
          ),
          _buildMenuItem(icon: LucideIcons.settings, text: 'Setting'),

          // ✅ Tombol Logout: Kembali ke halaman login
          _buildMenuItem(
            icon: LucideIcons.logOut,
            text: 'Log Out',
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(text, style: const TextStyle(color: Colors.white)),
          onTap: onTap,
        ),
        const Divider(color: Colors.white24),
      ],
    );
  }
}
