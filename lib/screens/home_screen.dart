import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'explore_page.dart';
import 'cart_page.dart';
import 'whislist_page.dart';
import 'user_page.dart';
import 'notification_page.dart';
import 'nike_collection.dart';
import 'adidas_collection.dart';
import 'new balance_collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedBrand = '';

  final List<Map<String, String>> allProducts = [
    {
      'brand': 'NIKE',
      'name': 'Nike P-6000',
      'price': 'IDR 1,200,000',
      'image': 'assets/images/nike_p6000_blck.jpg',
    },
    {
      'brand': 'ADIDAS',
      'name': 'Adidas Samba',
      'price': 'IDR 1,000,000',
      'image': 'assets/images/adidas_samba_blck.jpeg',
    },
    {
      'brand': 'NIKE',
      'name': 'Nike SB Dunk Low',
      'price': 'IDR 1,300,000',
      'image': 'assets/images/nike_sb_dunk_white_gum.jpg',
    },
    {
      'brand': 'NEW BALANCE',
      'name': 'New Balance 550',
      'price': 'IDR 1,500,000',
      'image': 'assets/images/nb_550.jpg',
    },
    {
      'brand': 'ADIDAS',
      'name': 'Adidas Campus 00’s',
      'price': 'IDR 1,400,000',
      'image': 'assets/images/adidas_campus_core_black.jpg',
    },
    {
      'brand': 'NIKE',
      'name': 'Nike Alphafly 3',
      'price': 'IDR 2,000,000',
      'image': 'assets/images/Nike_alphafly_3_volt_Concord.jpg',
    },
  ];

  List<Map<String, String>> _filteredProducts() {
    if (_selectedBrand.isEmpty) return allProducts;
    return allProducts
        .where((p) => p['brand']!.toUpperCase() == _selectedBrand.toUpperCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts();

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) return;
          Widget page;
          switch (index) {
            case 1:
              page = const ExplorePage();
              break;
            case 2:
              page = const CartPage();
              break;
            case 3:
              page = const WhislistPage();
              break;
            case 4:
              page = const UserProfilePage();
              break;
            default:
              return;
          }

          Navigator.push(
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
                      IconButton(
                        icon: const Icon(LucideIcons.bell, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationPage()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Filter Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      {'label': 'NIKE', 'page': const NikePage()},
                      {'label': 'ADIDAS', 'page': const AdidasPage()},
                      {'label': 'NEW BALANCE', 'page': const NewBalancePage()},
                    ].map((item) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => item['page'] as Widget),
                          );
                        },
                        child: Text(item['label'] as String),
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
                          style: TextStyle(color: Colors.white70, fontSize: 14),
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

                  // Product Grid (2 columns)
                  for (int i = 0; i < products.length; i += 2)
                    Row(
                      children: [
                        _buildProductCard(
                          name: products[i]['name']!,
                          price: products[i]['price']!,
                          imageAsset: products[i]['image']!,
                        ),
                        const SizedBox(width: 16),
                        if (i + 1 < products.length)
                          _buildProductCard(
                            name: products[i + 1]['name']!,
                            price: products[i + 1]['price']!,
                            imageAsset: products[i + 1]['image']!,
                          )
                        else
                          const Spacer(),
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
