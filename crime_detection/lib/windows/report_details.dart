import 'package:crime_detection/windows/cover_page.dart';
import 'package:flutter/material.dart';

class ReportDetails extends StatelessWidget {
  const ReportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Station'),
        backgroundColor: Color(0xFF52B6DF),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CoverScreen()));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Report Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                height: 1.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'View Cases',
              style: TextStyle(
                color: Color(0xFF292A38),
                fontSize: 20,
                fontFamily: 'Chonburi',
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 30,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Theft Case',
                    style: TextStyle(
                      color: Color(0xFF4D506C),
                      fontSize: 14,
                      fontFamily: 'Aclonica',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date of Crime: 12-09-2023',
                        style: TextStyle(
                          color: Color(0xFF4D506C),
                          fontSize: 10,
                          fontFamily: 'Actor',
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                        ),
                      ),
                      Text(
                        'No of Criminals',
                        style: TextStyle(
                          color: Color(0xFFF24F09),
                          fontSize: 8,
                          fontFamily: 'Actor',
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // View Case action
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF52B6DF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          shadowColor: Color(0x3F000000),
                          elevation: 5,
                        ),
                        child: Text(
                          'View Case',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Actor',
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
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
