import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Profile image
  AssetImage _profileImage = AssetImage('lib/assets/chef.PNG');

  // Function to handle profile image upload
  void _uploadProfileImage() {
    // Placeholder function for handling image upload
    // This function can be replaced with actual image upload logic
    setState(() {
      _profileImage = AssetImage('lib/assets/chef.PNG');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _uploadProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue),
                SizedBox(width: 8.0),
                Text(
                  'User Name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 8.0),
                Text(
                  'User Email:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 8.0),
                Text(
                  'User Address:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              '123 Main St, New York, USA',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                Icon(Icons.restaurant_menu, color: Colors.blue),
                SizedBox(width: 8.0),
                Text(
                  'Recipes Uploaded:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            _buildRecipeItem('Pasta Carbonara'),
            _buildRecipeItem('Chocolate Cake'),
            _buildRecipeItem('Grilled Chicken Salad'),
            _buildRecipeItem('Vegetable Stir-fry'),
            SizedBox(height: 24.0),
            Row(
              children: [
                Icon(Icons.shopping_cart, color: Colors.blue),
                SizedBox(width: 8.0),
                Text(
                  'Items Uploaded:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            _buildItemUploaded('Furniture'),
            _buildItemUploaded('Electronics'),
            _buildItemUploaded('Clothing'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeItem(String recipeName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
      child: Row(
        children: [
          Icon(Icons.arrow_right, color: Colors.blue),
          SizedBox(width: 8.0),
          Text(
            recipeName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildItemUploaded(String itemName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
      child: Row(
        children: [
          Icon(Icons.arrow_right, color: Colors.blue),
          SizedBox(width: 8.0),
          Text(
            itemName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
