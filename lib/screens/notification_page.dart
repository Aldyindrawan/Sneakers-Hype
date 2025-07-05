import 'package:flutter/material.dart';
import 'home_screen.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  final List<Map<String, String>> notifications = const [
    {
      'product': 'Nike Alphafly 3 volt Concord',
      'size': '42',
      'total': 'IDR 3,130,000',
      'status': 'Ordered on 21 June 2025',
      'image': 'assets/images/Nike_alphafly_3_volt_Concord.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Order notifikasi', style: TextStyle(color: Colors.white)),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Your Order Notification',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.white24),
            const SizedBox(height: 8),
            ...notifications.map((notif) {
              return Container(
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
                        notif['image']!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notif['product']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Size: ${notif['size']}', style: TextStyle(color: Colors.white70)),
                          Text('Total: ${notif['total']}', style: TextStyle(color: Colors.white70)),
                          Row(
                            children: [
                              const Text('Status: ',
                                  style: TextStyle(color: Colors.white70)),
                              const Icon(Icons.check_circle, color: Colors.green, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                notif['status']!,
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
