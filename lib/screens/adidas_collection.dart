import 'package:flutter/material.dart';
import 'adidas_detail.dart';

class AdidasPage extends StatelessWidget {
  const AdidasPage({super.key});

  final List<Map<String, String>> adidasProducts = const [
    {
      'name': 'Adidas Campus 00s',
      'price': 'IDR 1,400,000',
      'size': '40, 41, 42, 43',
      'description': 'Adidas Campus 00s nyaman untuk dipakai jalan dan stylish.',
      'code': 'AD-CP-BLK',
      'imageAsset': 'assets/images/adidas_campus_core_black.jpg',
    },
    {
      'name': 'Adidas Samba OG',
      'price': 'IDR 1,600,000',
      'size': '38, 39, 40, 41',
      'description': 'Adidas Samba OG klasik untuk gaya sehari-hari.',
      'code': 'AD-SAM-OG-BLK',
      'imageAsset': 'assets/images/adidas samba black og.jpeg', 
    },
{
  'name': 'Adidas Adizero SL White Blue',
  'price': 'IDR 2,100,000',
  'size': '40, 41, 42, 43',
  'description': 'Adizero SL dengan teknologi ringan untuk performa lari optimal dan tampilan sporty.',
  'code': 'AD-AZ-SL-WHB',
  'imageAsset': 'assets/images/adidas zero evo sl white.jpeg',
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
        title: const Text('ADIDAS Collection', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: adidasProducts.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final product = adidasProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdidasDetailPage(
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
                        Text(product['name']!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(product['price']!, style: const TextStyle(color: Colors.white70)),
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
