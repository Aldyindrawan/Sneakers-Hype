import 'package:flutter/material.dart';
import 'new balance_detail.dart';

class NewBalancePage extends StatelessWidget {
  const NewBalancePage({super.key});

  final List<Map<String, String>> newBalanceProducts = const [
    {
      'name': 'New Balance 550',
      'price': 'IDR 1,800,000',
      'size': '40, 41, 42, 43',
      'description': 'New Balance 550 dengan warna klasik dan desain retro.',
      'code': 'NB-550-WH',
      'imageAsset': 'assets/images/nb_550.jpg',
    },
    {
      'name': 'New Balance 2002R',
      'price': 'IDR 2,200,000',
      'size': '38, 39, 40, 41, 42',
      'description': 'New Balance 2002R, desain futuristik dan kenyamanan tinggi.',
      'code': 'NB-2002-R',
      'imageAsset': 'assets/images/new balance 2002R.jpeg',
    },

    {
  'name': 'New Balance Fresh Foam X 1080v13',
  'price': 'IDR 2,450,000',
  'size': '40, 41, 42, 43',
  'description': 'Sepatu lari dengan teknologi Fresh Foam X yang ringan dan responsif.',
  'code': 'NB-FFX-1080V13',
  'imageAsset': 'assets/images/nb_freshfoam_1080v13.jpg',
}

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
        title: const Text('NEW BALANCE Collection', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: newBalanceProducts.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final product = newBalanceProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewBalanceDetailPage(
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
