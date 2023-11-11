import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/give_information.dart';
import 'package:crime_detection/windows/report_crime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';

class SelectCrime extends StatefulWidget {
  const SelectCrime({super.key});

  @override
  State<SelectCrime> createState() => _SelectCrimeState();
}

class _SelectCrimeState extends State<SelectCrime> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Or select';
    var items = [
      'Anti-social behaviour',
      'Bicycle theft',
      'Police Brutality',
      'Criminal damage and arson',
      'Internet scam',
      'Drugs',
      'Posession of weapons',
      'Public order',
      'Robbery',
      'Shoplifting',
      'Theft from a person',
      'Vehicle Crime',
      'Violence and sexual offences'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF52B6DF),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ReportCrime()));
          },
        ),
        centerTitle: true,
        title: Text('Police Station'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Report Crime',
              style: TextStyle(
                color: Color(0xFF52B6DF),
                fontSize: 30,
                fontFamily: 'Abril Fatface',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(1.89),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What type of crime?',
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            // Divider(
            //   color: Colors.black,
            //   height: 20,
            // ),
            // SizedBox(height: 10),
            // DropdownButton(
            //   style: TextStyle(
            //     color: Colors.black,
            //   ),
            //   value: dropdownvalue,
            //   icon: const Icon(Icons.keyboard_arrow_down),
            //   items: items.map((String items) {
            //     return DropdownMenuItem(
            //       value: items,
            //       child: Text(items),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownvalue = newValue!;
            //     });
            //   },
            // ),
            // SizedBox(height: 10),
            SizedBox(height: 15),
            Text(
              'Detail of Incident',
              // textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400,
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
            SizedBox(height: 15),
            Text(
              'Date of Incident',
              // textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400,
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
            SizedBox(height: 15),
            Text(
              'Address of Incident',
              // textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400,
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
            SizedBox(height: 15),
            Text(
              'Time of Incident',
              // textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400,
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
            SizedBox(height: 15),
            Text(
              'Suspect Name',
              // textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400,
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
            SizedBox(height: 15),
            Text(
              'Suspect Address',
              // textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400,
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
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GiveInformation()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF52B6DF)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  child: Text(
                    'Proceed',
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
          ],
        ),
      ),
    );
  }
}
