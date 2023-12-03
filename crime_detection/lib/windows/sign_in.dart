// ignore_for_file: use_build_context_synchronously

import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_methods.dart';
import '../utils/toast.dart';
import 'civilian_dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CoverScreen()));
          },
        ),
        centerTitle: true,
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: s.height * 0.1,
            ),
            const Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  controller: _email,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  controller: _password,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF52B6DF),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Handle sign-up here
                loginButtonPress();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF52B6DF)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Text(
                      'Login',
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
                  'Do not have an account? ',
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
                      text: 'Sign Up',
                      style:
                          TextStyle(color: Colors.blue.shade400, fontSize: 15),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loginButtonPress() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_email.text.isEmpty || _password.text.isEmpty) {
        Utils().showToast(context, 'Text box should not be empty');
      } else {
        await FirebaseMethods().login(
          _email.text,
          _password.text,
        );
      }
      Utils().showToast(
        context,
        'Login successfully',
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CivilianDashboard(),
        ),
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
