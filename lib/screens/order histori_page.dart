import 'package:flutter/material.dart';
import 'package:sneakers_hype/screens/user_page.dart';
import 'home_screen.dart';
import 'user_page.dart'; // ⬅️ Import halaman profil

class OrderHistoryScreen extends StatelessWidget {
  final String fromPage;

  const OrderHistoryScreen({super.key, this.fromPage = 'profile'});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'image': 'assets/images/nike_p6000_blck.jpg',
        'brand': 'Nike P-6000',
        'date': '01 Juli 2025',
        'size': '42',
        'total': 'IDR 1,200,000',
        'estimation': '3-5 hari kerja',
        'status': 'Sedang Diproses',
      },
      {
        'image': 'assets/images/adidas samba black og.jpeg',
        'brand': 'Adidas Samba',
        'date': '28 Juni 2025',
        'size': '41',
        'total': 'IDR 1,000,000',
        'estimation': '2-4 hari kerja',
        'status': 'Dikirim',
      },
    ];

    return WillPopScope(
      onWillPop: () async {
        if (fromPage == 'payment') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        } else if (fromPage == 'profile') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const UserProfilePage()),
          );
        } else {
          Navigator.pop(context);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Riwayat Pemesanan', style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (fromPage == 'payment') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              } else if (fromPage == 'profile') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const UserProfilePage()),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      order['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order['brand']!,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text('Tanggal: ${order['date']}', style: const TextStyle(color: Colors.white70)),
                        Text('Size: ${order['size']}', style: const TextStyle(color: Colors.white70)),
                        Text('Total Harga: ${order['total']}', style: const TextStyle(color: Colors.white70)),
                        Text('Estimasi: ${order['estimation']}', style: const TextStyle(color: Colors.white70)),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(order['status']!, style: const TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ],
                    ),
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
