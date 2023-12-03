// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import '../firebase/firebase_methods.dart';

class CoverScreen extends StatefulWidget {
  const CoverScreen({super.key});

  @override
  State<CoverScreen> createState() => _CoverScreenState();
}

class _CoverScreenState extends State<CoverScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    Color(0x3351B6DF),
                    Color(0xFF4178D4),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.064, // 24 / 375
              top: screenHeight * 0.636, // 517 / 812
              child: SizedBox(
                width: screenWidth * 0.872, // 327 / 375
                height: screenHeight * 0.177, // 144 / 812
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello and\nwelcome!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.085, // 32 / 375
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.022), // Adjust padding
                    Opacity(
                      opacity: 0.60,
                      child: Text(
                        'Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.035, // 13 / 375
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.301, // 113 / 375
              top: screenHeight * 0.875, // 711 / 812
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.085, // 32 / 375
                  vertical: screenHeight * 0.02, // 16 / 812
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF52B6DF),
                  borderRadius:
                      BorderRadius.circular(screenWidth * 0.027), // 10 / 375
                ),
                child: InkWell(
                  onTap: () {
                    onNextBtnPress();
                  },
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Let’s Start',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045, // 17 / 375
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onNextBtnPress() async {
    setState(() {
      _isLoading = true;
    });
    await FirebaseMethods().loginBasedOnRole(context);
    setState(() {
      _isLoading = false;
    });
  }
}
