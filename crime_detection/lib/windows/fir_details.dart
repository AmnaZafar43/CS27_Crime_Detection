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
  final TextEditingController _reportDetails = TextEditingController();

  final TextEditingController _detailOfIncident = TextEditingController();

  final TextEditingController _addressOfIncident = TextEditingController();

  final TextEditingController _districtOfIncident = TextEditingController();

  final TextEditingController _suspectName = TextEditingController();

  final TextEditingController _suspectAddress = TextEditingController();
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    void _datePicker() async {
      DateTime? dt = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
      if (dt != null) {
        setState(() {
          dateTime = dt;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF52B6DF),
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
        title: const Text('Police Station'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              const Text(
                'Report crime details',
                style: TextStyle(color: Colors.black),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.89),
                  child: TextField(
                    controller: _reportDetails,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What type of crime?',
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'Detail of Incident',
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _detailOfIncident,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'Date of Incident',
                // textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
              ),
              ElevatedButton(
                // this button calls _datePicker function which shows us calender to pick date
                onPressed: _datePicker,
                child: const Text(
                  // sets decoration like color, font style etc
                  'Pick Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'Address of Incident',
                // textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _addressOfIncident,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor:const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'District of Incident',
                // textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _districtOfIncident,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor:const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'Suspect Name',
                // textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _suspectName,
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
                controller: _suspectAddress,
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
              SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GiveInformation(
                              reportCrime: _districtOfIncident.text.toString(),
                              addressOfIncident: _addressOfIncident.text.toString(),
                              dateOfIncident: dateTime.toString(),
                              detailOfIncident: _detailOfIncident.text.toString(),
                              districtOfIncident: _districtOfIncident.text.toString(),
                              suspectAddress: _suspectAddress.text.toString(),
                              suspectName: _suspectName.text.toString(),
                            )  
                            ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF52B6DF)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    child: const Text(
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
      ),
    );
  }
}
