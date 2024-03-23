import 'package:flutter/material.dart';

class AdminPg extends StatefulWidget {
  const AdminPg({Key? key}) : super(key: key);

  @override
  State<AdminPg> createState() => _AdminPgState();
}

class _AdminPgState extends State<AdminPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 196, 93),
      appBar: AppBar(
        title: Text('Welcome Admin'),
        centerTitle: true,
        // Add any other app bar configurations as needed
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.admin_panel_settings, // This is the admin icon
                size: 120,
                color: Colors.brown, // You can customize the color as needed
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for managing users
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  child: Text('Manage Users'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for managing products or data
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  child: Text('Manage Products'),
                ),
              ),
              // Add more buttons or components for other administrative tasks
            ],
          ),
        ),
      ),
    );
  }
}
