// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    // You can add more complex email validation logic here if needed

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be 6 characters long';
    }

    // You can add more password validation logic here if needed

    return null;
  }

  bool isLoading = false;
 



  //text  controller
final _emailController=TextEditingController();
final _passwordController=TextEditingController();

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
                            controller: _emailController,
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
                            controller: _passwordController,
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
                                    // Form is valid, perform login logic here
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
