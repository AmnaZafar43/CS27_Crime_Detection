import 'package:crime_detection/windows/crime_type.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cover_page.dart';

class ReportCrime extends StatelessWidget {
  const ReportCrime({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Crime'),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CoverScreen()));
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            height: 300,
            color: Color(0xFF52B6DF),
            child: Center(
              child: Text(
                'Visit your nearest police station in case of any problem, we are here for you.\n\nWe are your friends.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latest News',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\nGovernment launches new national hate crime awareness campaign such as investing in law enforcement training and technology, such as forensics, surveillance, and data analysis tools. \n\n',
                  style: TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontSize: 16,
                    // decoration: TextDecoration.underline,
                  ),
                ),
                // SizedBox(height: 0),
                InkWell(
                  onTap: () => launchUrl(Uri.parse(
                      'EgZjaHJvbWUqDAgAEAAYDRixAxiABDIMCAAQABgNGLEDGIAEMgwIARAAGA0YsQMYgAQyDwgCEAAYDRiDARixAxiABDIMCAMQABgNGLEDGIAEMg8IBBAAGA0YgwEYsQMYgAQyCQgFEAAYDRiABDIMCAYQABgNGLEDGIAEMgwIBxAAGA0YsQMYgAQyDwgIEAAYDRiDARixAxiABDIJCAkQABgNGIAE0gEINTY2MmowajeoAgCwAgA')),
                  child: Text(
                    'View Latest News Here.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.red),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 110),
          Container(
            height: 100,
            color: Colors.blue, // Adjust color as needed
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Have you witnessed or been a victim of a crime? Please report it!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectCrime()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 160, 162, 165)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
