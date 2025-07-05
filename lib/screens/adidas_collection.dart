import 'package:flutter/material.dart';

class AdidasPage extends StatelessWidget {
  const AdidasPage({super.key});

  final List<Map<String, String>> adidasProducts = const [
    {
      'name': 'Adidas Samba',
      'price': 'IDR 1,000,000',
    },
    {
      'name': 'Adidas Campus 00’s',
      'price': 'IDR 1,400,000',
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
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: adidasProducts.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final product = adidasProducts[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['name']!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 4),
                Text(product['price']!, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          );
        },
      ),
    );
  }
}
