import 'package:flutter/material.dart';

class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('📦 Shipping Address', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAddressCard(
            name: 'Albert',
            phone: '+62 812 3456 7890',
            address: 'Jl. Merdeka No. 45, Jakarta, Indonesia',
          ),
          const SizedBox(height: 16),
          _buildAddressCard(
            name: 'Office',
            phone: '+62 811 2222 3333',
            address: 'Gedung Startup Lt. 3, Bandung',
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard({
    required String name,
    required String phone,
    required String address,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          const SizedBox(height: 4),
          Text(phone, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(address, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

