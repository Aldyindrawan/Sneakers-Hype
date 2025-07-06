import 'package:flutter/material.dart';
import 'order histori_page.dart'; // Perbaiki nama file jika typo
import 'home_screen.dart'; 

class PaymentPage extends StatefulWidget {
  final String brand;
  final String name;
  final String price;
  final String size;
  final String imageAsset;

  const PaymentPage({
    super.key,
    required this.brand,
    required this.name,
    required this.price,
    required this.size,
    required this.imageAsset,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedMethod;
  String? selectedBank;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final List<String> banks = ['BCA', 'BNI', 'BRI', 'Mandiri'];
  final double shippingCost = 20000;

  double get subtotal {
    return double.tryParse(
          widget.price.replaceAll(RegExp(r'[^0-9]'), ''),
        )?.toDouble() ?? 0.0;
  }

  double get total => subtotal + shippingCost;

  void placeOrder() {
    if (selectedMethod == null ||
        (selectedMethod == 'Virtual Account' && selectedBank == null)) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => OrderHistoryScreen(fromPage: 'payment'), // ✅ Fix here
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imageAsset,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _infoTile('Brand', widget.brand),
            _infoTile('Product', widget.name),
            _infoTile('Price', widget.price),
            _infoTile('Size', widget.size),
            const SizedBox(height: 16),
            _sectionTitle('Your Information'),
            _inputField(nameController, 'Name'),
            _inputField(addressController, 'Address'),
            _inputField(phoneController, 'Phone Number'),
            const SizedBox(height: 16),
            _sectionTitle('Payment Method'),
            _methodSelector('Cash on Delivery'),
            _methodSelector('Virtual Account'),
            if (selectedMethod == 'Virtual Account')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: banks.map((bank) {
                  return RadioListTile<String>(
                    title: Text(bank, style: const TextStyle(color: Colors.white)),
                    value: bank,
                    groupValue: selectedBank,
                    onChanged: (val) {
                      setState(() => selectedBank = val);
                    },
                    activeColor: Colors.white,
                  );
                }).toList(),
              ),
            const SizedBox(height: 16),
            _sectionTitle('Order Summary'),
            _infoTile('Subtotal', 'IDR ${subtotal.toStringAsFixed(0)}'),
            _infoTile('Shipping', 'IDR ${shippingCost.toStringAsFixed(0)}'),
            _infoTile('Total', 'IDR ${total.toStringAsFixed(0)}'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: (selectedMethod == null ||
                  (selectedMethod == 'Virtual Account' && selectedBank == null))
              ? null
              : placeOrder,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // ✅ Warna ungu
            foregroundColor: Colors.white,      // ✅ Tulisan putih
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          child: const Text('Place Order'),
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _inputField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _methodSelector(String method) {
    return ListTile(
      title: Text(method, style: const TextStyle(color: Colors.white)),
      leading: Radio<String>(
        value: method,
        groupValue: selectedMethod,
        onChanged: (val) {
          setState(() {
            selectedMethod = val;
            selectedBank = null;
          });
        },
        activeColor: Colors.white,
      ),
    );
  }
}
