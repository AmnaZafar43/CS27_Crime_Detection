import 'package:crime_detection/windows/report_details.dart';
import 'package:flutter/material.dart';

class LiscenseApplied extends StatelessWidget {
  const LiscenseApplied({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Successfully Applied',
                        style: TextStyle(
                          color: Color(0xFF0F172A),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      Opacity(
                        opacity: 0.8,
                        child: Text(
                          'Your application is successfully registered.You can view your request and furthur details on information section of this portal.Thank you',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReportDetails()),
                        );
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
