import 'package:flutter/material.dart';
import 'home_screen.dart'; // ✅ Tambahkan ini agar bisa kembali ke halaman Home

class WhislistPage extends StatelessWidget {
  const WhislistPage({super.key});

  final List<Map<String, String>> wishlistItems = const [
    {
      'name': 'Nike SB Dunk Low',
      'price': 'IDR 1,300,000',
      'image': 'assets/images/nike_sb_dunk_white_gum.jpg',
    },
    {
      'name': 'Adidas Campus 00’s',
      'price': 'IDR 1,400,000',
      'image': 'assets/images/adidas_campus_core_black.jpg',
    },
    {
      'name': 'New Balance 550',
      'price': 'IDR 1,500,000',
      'image': 'assets/images/nb_550.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text('Your Wishlist', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: wishlistItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = wishlistItems[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      product['image']!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      product['name']!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['price']!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
