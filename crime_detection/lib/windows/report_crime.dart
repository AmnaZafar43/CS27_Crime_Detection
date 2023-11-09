import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'cover_page.dart';

class ReportCrime extends StatelessWidget {
  const ReportCrime({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 300,
            color: Color(0xFF52B6DF),
            child: Center(
              child: Text(
                'Visit your nearest police station in case of any problem, we are here for you.\nWe are your friends.',
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
                  'Latest News\n\nGovernment launches new national hate crime awareness campaign.\n\n',
                  style: TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                    // decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () => launchUrl(Uri.parse(
                      'EgZjaHJvbWUqDAgAEAAYDRixAxiABDIMCAAQABgNGLEDGIAEMgwIARAAGA0YsQMYgAQyDwgCEAAYDRiDARixAxiABDIMCAMQABgNGLEDGIAEMg8IBBAAGA0YgwEYsQMYgAQyCQgFEAAYDRiABDIMCAYQABgNGLEDGIAEMgwIBxAAGA0YsQMYgAQyDwgIEAAYDRiDARixAxiABDIJCAkQABgNGIAE0gEINTY2MmowajeoAgCwAgA')),
                  child: Text(
                    'View Latest News Here.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
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
                Container(
                  width: 120,
                  height: 40,
                  color: Color(0xFFBBBBBB),
                  alignment: Alignment.center,
                  child: Text(
                    'Report a crime',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
