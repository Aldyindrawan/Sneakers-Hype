import 'package:flutter/material.dart';
import 'nike_detail.dart';

class NikePage extends StatelessWidget {
  const NikePage({super.key});

  final List<Map<String, String>> nikeProducts = const [
    {
      'name': 'Nike P-6000',
      'price': 'IDR 1,200,000',
      'size': '38, 39, 40, 41, 42',
      'description': 'Nike P-6000 dengan gaya sporty dan nyaman untuk sehari-hari.',
      'code': 'NK-P6000-BLK',
      'imageAsset': 'assets/images/nike_p6000_blck.jpg',
    },
    {
      'name': 'Nike SB Dunk Low',
      'price': 'IDR 1,300,000',
      'size': '38, 39, 40, 41, 42, 43',
      'description': 'Sepatu Nike SB Dunk Low klasik, cocok untuk skating & casual.',
      'code': 'NK-SBD-LOW-BLK',
      'imageAsset': 'assets/images/nike_sb_dunk_white_gum.jpg',
    },
    {
      'name': 'Nike Alphafly 3',
      'price': 'IDR 2,000,000',
      'size': '40, 41, 42, 43',
      'description': 'Nike Alphafly 3, sepatu lari tercepat dengan teknologi terbaru.',
      'code': 'NK-ALPHAFLY3-VOLT',
      'imageAsset': 'assets/images/nike_alphafly_3_volt_concord.jpg',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('NIKE Collection', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: nikeProducts.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final product = nikeProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NikeDetailPage(
                    name: product['name']!,
                    price: product['price']!,
                    size: product['size']!,
                    description: product['description']!,
                    code: product['code']!,
                    imageAsset: product['imageAsset']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product['imageAsset']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey,
                        child: const Icon(Icons.broken_image, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product['name']!,
                            style: const TextStyle(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(product['price']!,
                            style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
