import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.shoppingCart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar & Notification
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search sneakers or brands...',
                            hintStyle: const TextStyle(color: Colors.white54),
                            prefixIcon: const Icon(LucideIcons.search, color: Colors.white),
                            filled: true,
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(LucideIcons.bell, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Filter Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['NIKE', 'ADIDAS', 'NEW BALANCE'].map((brand) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(brand),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Hype Drop Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SNEAKERS HYPE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Hype Drop is Here',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Get 30% OFF only this week',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          child: const Text('Shop Now'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Produk Baris 1
                  Row(
                    children: [
                      _buildProductCard(
                        name: 'Nike P-6000',
                        price: 'IDR 1,200,000',
                        imageAsset: 'assets/images/nike_p6000_blck.jpg',
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        name: 'Adidas Samba',
                        price: 'IDR 1,000,000',
                        imageAsset: 'assets/images/adidas_samba_blck.jpeg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Produk Baris 2
                  Row(
                    children: [
                      _buildProductCard(
                        name: 'Nike SB Dunk Low',
                        price: 'IDR 1,300,000',
                        imageAsset: 'assets/images/nike_sb_dunk_white_gum.jpg',
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        name: 'New Balance 550',
                        price: 'IDR 1,500,000',
                        imageAsset: 'assets/images/nb_550.jpg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Produk Baris 3
                  Row(
                    children: [
                      _buildProductCard(
                        name: 'Adidas Campus 00’s',
                        price: 'IDR 1,400,000',
                        imageAsset: 'assets/images/adidas_campus_core_black.jpg',
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        name: 'Nike Alphafly 3',
                        price: 'IDR 2,000,000',
                        imageAsset: 'assets/images/Nike_alphafly_3_volt_Concord.jpg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String price,
    required String imageAsset,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageAsset,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Best seller 🔥',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 4),
            Text(price, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
