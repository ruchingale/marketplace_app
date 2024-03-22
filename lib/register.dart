import 'package:culinary_marketplace/loginpage.dart';
import 'package:flutter/material.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      var _passwordController;
      String password = _passwordController.text;
      var _confirmPasswordController;
      String confirmPassword = _confirmPasswordController.text;

      if (password != confirmPassword) {
        // Password and confirm password do not match
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password and confirm password do not match'),
            backgroundColor: Colors.red,
          ),
        );
        return; // Exit the function early
      }

      // Password and confirm password match
      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LoginPage(), // Replace NextPage() with the actual next page widget
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 151, 178),
        body: Stack(
          children: [
            ListView(
              children: [
                Material(
                  color: Color.fromARGB(255, 0, 151, 178),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/images/sweets2.PNG",
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.topCenter,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Create your new Account",
                          style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                182,
                                81,
                                19,
                              ),
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Form(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      251,
                                      255,
                                    ), // Background color
                                    borderRadius: BorderRadius.circular(
                                        15), // Circular border
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Name',
                                        labelStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 3, 3, 3)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid name';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Form(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      251,
                                      255,
                                    ), // Background color
                                    borderRadius: BorderRadius.circular(
                                        15), // Circular border
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Email ID',
                                        labelStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter an email';
                                      }
                                      // Use a regular expression to validate email format
                                      bool validEmail = RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                          .hasMatch(value);
                                      if (!validEmail) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Form(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      251,
                                      255,
                                    ), // Background color
                                    borderRadius: BorderRadius.circular(
                                        15), // Circular border
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Address',
                                        labelStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid name';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Form(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      251,
                                      255,
                                    ), // Background color
                                    borderRadius: BorderRadius.circular(
                                        15), // Circular border
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Form(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      251,
                                      255,
                                    ), // Background color
                                    borderRadius: BorderRadius.circular(
                                        15), // Circular border
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        labelStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => submitForm(context),
                            // () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const LoginPage()), // Navigate to login page
                            //   );
                            // },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 248, 196, 93),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // Circular border
                              ),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
