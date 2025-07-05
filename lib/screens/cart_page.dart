import 'package:flutter/material.dart';
import 'home_screen.dart'; // ✅ Tambahkan untuk navigasi balik

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final List<Map<String, dynamic>> cartItems = const [
    {
      'name': 'Nike Alphafly 3',
      'price': 2000000,
      'image': 'assets/images/Nike_alphafly_3_volt_Concord.jpg',
      'qty': 1,
    },
    {
      'name': 'Adidas Samba',
      'price': 1000000,
      'image': 'assets/images/adidas_samba_blck.jpeg',
      'qty': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int total = cartItems.fold(
      0,
      (sum, item) => sum + ((item['price'] as int) * (item['qty'] as int)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Your Cart', style: TextStyle(color: Colors.white)),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image'],
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Qty: ${item['qty']}',
                                style: const TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'IDR ${(item['price'] as int) * (item['qty'] as int)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'IDR $total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Proceeding to checkout...'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Checkout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
