import 'package:flutter/material.dart';

class SellInfoPage extends StatefulWidget {
  const SellInfoPage({Key? key}) : super(key: key);

  @override
  State<SellInfoPage> createState() => _SellInfoPageState();
}

class _SellInfoPageState extends State<SellInfoPage> {
  late Map<String, dynamic> sellerInfo;

  @override
  void initState() {
    super.initState();
    // Fetch seller information (demo data)
    sellerInfo = {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'address': '123 Main St, City',
      'phone': '123-456-7890',
      'shopName': 'John Doe Shop', // Add shop name
      // Add more fields as needed
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown, // Brown color for AppBar
        title: Text('Seller Information'),
        leading: IconButton(
          // Back button
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Make the card take entire screen width
              child: Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoField('Seller Name', sellerInfo['name']),
                      _buildInfoField('Email', sellerInfo['email']),
                      _buildInfoField('Address', sellerInfo['address']),
                      _buildInfoField('Phone', sellerInfo['phone']),
                      // Add shop name field
                      // Add more fields as needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
