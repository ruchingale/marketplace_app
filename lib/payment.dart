import 'package:flutter/material.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isHovered = false;

  void _processPayment(BuildContext context) {
    // Simulate payment processing
    // You can add actual payment processing logic here
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to payment success screen after payment processing
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentSuccessScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> foodItems = [
      {'name': 'Butter Chicken', 'price': '200'},
      {'name': 'Biryani', 'price': '150'},
      {'name': 'Palak Paneer', 'price': '180'},
    ];

    int total =
        foodItems.fold(0, (sum, item) => sum + int.parse(item['price']!));

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are about to purchase:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Item'))),
                    TableCell(child: Center(child: Text('Price'))),
                  ],
                ),
                for (var item in foodItems)
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text(item['name']!))),
                      TableCell(
                          child: Center(child: Text('INR ${item['price']}'))),
                    ],
                  ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Total'))),
                    TableCell(child: Center(child: Text('INR $total'))),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _processPayment(context);
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.blue
                        .withOpacity(0.8); // Change button color when hovered
                  }
                  return Colors.blue;
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200), // Animation duration
                  child: Text(
                    _isHovered ? 'Proceed to Payment' : 'Pay Now',
                    key: ValueKey<bool>(
                        _isHovered), // Key to switch between old and new text
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                onEnter: (_) {
                  // Change text when hovered
                  setState(() {
                    _isHovered = true;
                  });
                },
                onExit: (_) {
                  // Change text back when not hovered
                  setState(() {
                    _isHovered = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'lib/assets/1.gif',
              image:
                  'https://i.pinimg.com/originals/0d/e4/1a/0de41a3c5953fba1755ebd416ec109dd.gif', // Replace with your image URL
              height: 150,
            ),
            SizedBox(height: 30),
            Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
