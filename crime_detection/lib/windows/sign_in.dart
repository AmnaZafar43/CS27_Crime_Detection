import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.height * 0.3,
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
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: TextField(
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
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
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 13),
            const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 120),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Handle sign-up here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF52B6DF)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              child: Text(
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
                Text(
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
                                builder: (context) => const SignUp()),
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
}
