import 'package:flutter/material.dart';
import 'payment_page.dart'; // ganti jika belum buat

class NewBalanceDetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String size;
  final String description;
  final String code;
  final String imageAsset;

  const NewBalanceDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.size,
    required this.description,
    required this.code,
    required this.imageAsset,
  });

  @override
  State<NewBalanceDetailPage> createState() => _NewBalanceDetailPageState();
}

class _NewBalanceDetailPageState extends State<NewBalanceDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Product Detail', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              widget.imageAsset,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.grey,
                child: const Icon(Icons.broken_image, color: Colors.white, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoBox(widget.name, fontSize: 20, isBold: true),
            _buildInfoBox(widget.price, fontSize: 18, color: Colors.greenAccent),
            _buildInfoBox('Size Chart: ${widget.size}'),
            _buildInfoBox('Deskripsi: ${widget.description}'),
            _buildInfoBox('Kode Produk: ${widget.code}'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white, // ✅ Tulisan jadi putih
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          brand: 'NEW BALANCE',
                          name: widget.name,
                          price: widget.price,
                          size: widget.size,
                          imageAsset: widget.imageAsset,
                        ),
                      ),
                    );
                  },
                  child: const Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String text,
      {double fontSize = 16, bool isBold = false, Color color = Colors.white}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
