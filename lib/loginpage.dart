import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homeSeller.dart';
import 'homepg.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String dropDownValue = "Select your category";
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be 6 characters long';
    }
    return null;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User signed in successfully, now check the role (Seller/Buyer)
        if (dropDownValue == "Seller") {
          // Check if the user exists in the seller collection
          QuerySnapshot<Map<String, dynamic>> sellers = await _firestore
              .collection('seller')
              .where('email', isEqualTo: email)
              .get();

          if (sellers.docs.isNotEmpty) {
            // User is a seller, navigate to seller's home page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeSellerPage()),
            );
          } else {
            print('Seller not found in database');
          }
        } else if (dropDownValue == "Buyer") {
          // Check if the user exists in the buyer collection
          QuerySnapshot<Map<String, dynamic>> buyers = await _firestore
              .collection('buyer')
              .where('email', isEqualTo: email)
              .get();

          if (buyers.docs.isNotEmpty) {
            // User is a buyer, navigate to buyer's home page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          } else {
            print('Buyer not found in database');
          }
        }
      } else {
        print('User credentials not found');
      }
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 196, 93),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Image.asset(
                    "lib/assets/image_5.png",
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topCenter,
                  ),
                  SizedBox(height: 20), // Add some space below the image
                  Text(
                    "Welcome to Homemade Harvest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ), // Add spacing between text and dropdown
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color.fromARGB(255, 248, 196, 93),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            validator: validateEmail,
                            onSaved: (newValue) => email = newValue ?? '',
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            obscureText: true,
                            validator: validatePassword,
                            onSaved: (newValue) => password = newValue ?? '',
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              width: 200, // Increased width
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // Form is valid, perform login logic here
                                    signInWithEmailAndPassword(email, password);
                                  }
                                },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 198, 81, 19),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to SellInfoPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "New user ? Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5, // Adjusted position
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 198, 81, 19),
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<String>(
                value: dropDownValue,
                icon: const Icon(Icons.arrow_drop_down),
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: "Select your category",
                    child: Text("Select your category"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Admin",
                    child: Text("Admin"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Seller",
                    child: Text("Seller"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Buyer",
                    child: Text("Buyer"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
