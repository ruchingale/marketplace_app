// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_final_fields

import 'package:flutter/material.dart';

class HomeSellerPage extends StatefulWidget {
  const HomeSellerPage({Key? key}) : super(key: key);

  @override
  State<HomeSellerPage> createState() => _HomeSellerPageState();
}

class _HomeSellerPageState extends State<HomeSellerPage> {
  int completedOrders = 50;
  int pendingOrders = 10;
  int _currentIndex = 0; // Index for bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 196, 93),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "lib/assets/image_5.png",
              fit: BoxFit.scaleDown,
              alignment: Alignment.topCenter,
            ),
            SizedBox(height: 20),
            // First Card: Add Item
            _buildCard(
              icon: Icons.add,
              title: 'Add item',
              onTap: () {
                // Add your logic here for adding an item
              },
            ),
            SizedBox(height: 10),
            // Second Card: Seller Info
            _buildCard(
              icon: Icons.person,
              title: 'Seller info',
              onTap: () {
                // Add your logic here for seller info
              },
            ),
            SizedBox(height: 10),
            // Third Card: Order Received
            _buildCard(
              icon: Icons.shopping_cart,
              title: 'Order received',
              onTap: () {
                // Add your logic here for order received
              },
            ),
            SizedBox(height: 10),
            // Fourth and Fifth Cards: Completed and Pending Orders
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHorizontalCard(
                  title: 'Completed Orders',
                  count: completedOrders,
                  color: Colors.green,
                ),
                _buildHorizontalCard(
                  title: 'Pending Orders',
                  count: pendingOrders,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required IconData icon,
      required String title,
      required Function onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCard(
      {required String title, required int count, required Color color}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
