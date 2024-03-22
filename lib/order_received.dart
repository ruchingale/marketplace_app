// import 'package:flutter/material.dart';

// class OrderReceivedPage extends StatefulWidget {
//   const OrderReceivedPage({Key? key}) : super(key: key);

//   @override
//   State<OrderReceivedPage> createState() => _OrderReceivedPageState();
// }

// class _OrderReceivedPageState extends State<OrderReceivedPage> {

//   @override
//   Widget build(BuildContext context) {

//     throw UnimplementedError();
//   }
// }

import 'package:flutter/material.dart';

class OrderReceivedPage extends StatefulWidget {
  const OrderReceivedPage({Key? key}) : super(key: key);

  @override
  State<OrderReceivedPage> createState() => _OrderReceivedPageState();
}

class _OrderReceivedPageState extends State<OrderReceivedPage> {
  late Map<String, dynamic> orderInfo;

  @override
  void initState() {
    super.initState();
    // Fetch seller information (demo data)
    orderInfo = {
      'order_no': '123333',
      'user_email': 'johndoe@example.com',
      'orderName': 'Donuts',
      'Quantity': '3',
      'Price': '1000', // Add shop name
      // Add more fields as needed
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown, // Brown color for AppBar
        title: Text('Order Received'),
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
                      _buildInfoField('Order Number:', orderInfo['order_no']),
                      _buildInfoField('User Email', orderInfo['user_email']),
                      _buildInfoField('Order Name', orderInfo['orderName']),
                      _buildInfoField('Quantity', orderInfo['Quantity']),
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
