// ignore_for_file: use_build_context_synchronously

import 'package:crime_detection/Models/firebase_methods.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
 
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 27, 26, 26),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.09), // Vertical spacing
                const Text(
                  'Name',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
                // Your Name
                TextFormField(
                  controller: _name,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xFF64748B),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0x66F1F5F9),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Vertical spacing
                const Text(
                  'Email',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
                // Email
                TextFormField(
                  controller: _email,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xFF64748B),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0x66F1F5F9),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Vertical spacing
                const Text(
                  'Password',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
                // Your Password
                TextFormField(
                  controller: _password,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xFF64748B),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0x66F1F5F9),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Vertical spacing
                const Text(
                  'User Name',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
                // User Name
                TextFormField(
                  controller: _username,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xFF64748B),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0x66F1F5F9),
                  ),
                ),
                // SizedBox(height: screenHeight * 0.03), // Vertical spacing
                const SizedBox(height: 170),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    // Handle sign-up here
                    loginButtonPress();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF52B6DF)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),

                SizedBox(height: screenHeight * 0.03), // Vertical spacing

                // Already have an account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.20,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              color: Colors.blue.shade400, fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginButtonPress() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_email.text.isEmpty ||
          _name.text.isEmpty ||
          _username.text.isEmpty ||
          _password.text.isEmpty) {
        Utils().showToast(context, 'Text box should not be empty');
      } else {
        await FirebaseMethods().signUp(
          _email.text,
          _password.text,
          _name.text,
          _username.text,
          'civilians',
        );
      }
      Utils().showToast(
        context,
        'Register successfully',
      );
    } catch (e) {
      Utils().showToast(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
}
