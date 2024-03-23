import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellInfoPage extends StatefulWidget {
  const SellInfoPage({Key? key}) : super(key: key);

  @override
  State<SellInfoPage> createState() => _SellInfoPageState();
}

class _SellInfoPageState extends State<SellInfoPage> {
  List<Map<String, dynamic>> sellers = []; // Initialize sellers as an empty list

  @override
  void initState() {
    super.initState();
    fetchSellerInfo(); // Fetch seller information from Firestore
  }

  Future<void> fetchSellerInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> sellerSnapshot =
          await FirebaseFirestore.instance.collection('seller').get();

      if (sellerSnapshot.docs.isNotEmpty) {
        setState(() {
          sellers = sellerSnapshot.docs.map((doc) => doc.data()).toList();
        });
      } else {
        print('No seller information found');
      }
    } catch (e) {
      print('Error fetching seller information: $e');
    }
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
            for (var seller in sellers) ...[
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
                        _buildInfoField('Seller Name', seller['name']),
                        _buildInfoField('Email', seller['email']),
                        _buildInfoField('Address', seller['address']),
                        // Add more fields as needed
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
