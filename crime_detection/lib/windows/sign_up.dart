import 'package:crime_detection/windows/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 27, 26, 26),
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.0,
              ),
            ),
            SizedBox(height: screenHeight * 0.09), // Vertical spacing
            Text(
              'Name',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
            // Your Name
            TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xFF64748B),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0x66F1F5F9),
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Vertical spacing
            Text(
              'Email',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
            // Email
            TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xFF64748B),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0x66F1F5F9),
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Vertical spacing
            Text(
              'Password',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
            // Your Password
            TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xFF64748B),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0x66F1F5F9),
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Vertical spacing
            Text(
              'User Name',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
            // User Name
            TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xFF64748B),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCBD5E1)),
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
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF52B6DF)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              child: Text(
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
                Text(
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
                      style:
                          TextStyle(color: Colors.blue.shade400, fontSize: 15),
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
    );
  }
}
