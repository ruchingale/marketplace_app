import 'package:flutter/material.dart';
import 'sellInfor.dart';
import 'sellItem.dart';

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
            SizedBox(height: 10),
            // First Card: Add Item
            Text('Welcome',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            Text('HomeChef!!!!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            // Text('ADD YOUR PRODUCTS HERE',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.red,
            //     )),
            SizedBox(height: 20),
            _buildCard(
              icon: Icons.add,
              title: 'Add item',
              onTap: () {
                // Navigate to SellInfoPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputFieldsScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            // Second Card: Seller Info
            _buildCard(
              icon: Icons.person,
              title: 'Seller info',
              onTap: () {
                // Navigate to SellInfoPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellInfoPage()),
                );
              },
            ),
            SizedBox(height: 20),
            // Third Card: Order Received
            _buildCard(
              icon: Icons.shopping_cart,
              title: 'Order received',
              onTap: () {
                // Add your logic here for order received
              },
            ),
            SizedBox(height: 20),
            // Third Card: Order Received
            _buildCard(
              icon: Icons.share,
              title: 'Share Your Recipe',
              onTap: () {
                // Add your logic here for order received
              },
            ),
            SizedBox(height: 20),
            // Fourth and Fifth Cards: Completed and Pending Orders
            SingleChildScrollView(
              // Wrap the Row with SingleChildScrollView
              scrollDirection: Axis.horizontal,
              child: Row(
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
      // width: 150, // No need to specify width
      // height: 100, // No need to specify height
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
        child: Column(
          // Wrap the Row with Column
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
