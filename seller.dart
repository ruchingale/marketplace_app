import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Sharing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Custom font
      ),
      home: RecipePage(),
    );
  }
}

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String _foodName = '';
  String _duration = '';
  String _instructions = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity, // To cover entire width
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/food.PNG'),
                  fit: BoxFit.cover, // Cover entire container
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Food Name:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 8.0),
                  _buildInputField('Enter Food Name', _foodName, (value) {
                    setState(() {
                      _foodName = value;
                    });
                  }),
                  SizedBox(height: 16.0),
                  Text(
                    'Duration to Cook:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 8.0),
                  _buildInputField('Enter Duration', _duration, (value) {
                    setState(() {
                      _duration = value;
                    });
                  }),
                  SizedBox(height: 16.0),
                  Text(
                    'Instructions:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 8.0),
                  _buildInputField('Enter Instructions', _instructions,
                      (value) {
                    setState(() {
                      _instructions = value;
                    });
                  }),
                  SizedBox(height: 24.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your upload logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          _shareRecipe(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Share Recipe',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareRecipe(BuildContext context) {
    final String text =
        'Check out this delicious recipe for $_foodName:\nDuration to Cook: $_duration\n\nInstructions:\n$_instructions';

    Share.share(text, subject: 'Recipe Sharing: $_foodName');
  }

  Widget _buildInputField(
      String hintText, String value, Function(String) onChanged) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          border: InputBorder.none, // Hide the TextField's default border
        ),
      ),
    );
  }
}
