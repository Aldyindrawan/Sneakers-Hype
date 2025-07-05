import 'package:flutter/material.dart';
import 'home_screen.dart'; // ✅ Import HomeScreen agar bisa navigasi balik

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Nike P-6000',
      'price': 'IDR 1,200,000',
      'image': 'assets/images/nike_p6000_blck.jpg',
    },
    {
      'name': 'Adidas Samba',
      'price': 'IDR 1,000,000',
      'image': 'assets/images/adidas_samba_blck.jpeg',
    },
    {
      'name': 'Nike SB Dunk Low',
      'price': 'IDR 1,300,000',
      'image': 'assets/images/nike_sb_dunk_white_gum.jpg',
    },
    {
      'name': 'New Balance 550',
      'price': 'IDR 1,500,000',
      'image': 'assets/images/nb_550.jpg',
    },
    {
      'name': 'Adidas Campus 00’s',
      'price': 'IDR 1,400,000',
      'image': 'assets/images/adidas_campus_core_black.jpg',
    },
    {
      'name': 'Nike Alphafly 3',
      'price': 'IDR 2,000,000',
      'image': 'assets/images/Nike_alphafly_3_volt_Concord.jpg',
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
        title: const Text('Explore Sneakers', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search sneakers...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),

            // 🧱 Product Grid
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(12)),
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
          ],
        ),
      ),
    );
  }
}
