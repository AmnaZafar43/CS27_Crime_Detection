import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/crime_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';

class LiscenseInformation extends StatefulWidget {
  const LiscenseInformation({super.key});

  @override
  State<LiscenseInformation> createState() => _LiscenseInformationState();
}

class _LiscenseInformationState extends State<LiscenseInformation> {
  final fireStore =
      FirebaseFirestore.instance.collection('LiscenseInformation');

  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _age = TextEditingController();

  final TextEditingController _cnic = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final TextEditingController _address = TextEditingController();

  final TextEditingController _district = TextEditingController();

  final TextEditingController _typeLiscense = TextEditingController();

  final TextEditingController _typeWeapon = TextEditingController();

  final TextEditingController _purpose = TextEditingController();
  String _dropDownValue = '';
  String _dropDownValue2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF52B6DF),
        title: const Text('Police Station'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SelectCrime()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7)),
              Text(
                'Please fill out the relevant information in each section.',
                style: TextStyle(
                  color: Color(0xFF737373),
                  fontSize: 16,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: Card(
                  color: Colors.grey[400],
                  child: Center(
                    child: Text(
                      'Personal Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'First Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _firstName,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                'Last Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _lastName,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                'Age',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _age,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                'CNIC',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _cnic,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                'Phone Number',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _phone,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
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
                'Address',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _address,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                'District',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _district,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                'Select Type of Liscense',
                style: TextStyle(color: Colors.black),
              ),
              DropdownButton(
                hint: _dropDownValue == null
                    ? Text(
                        'Select type of liscense',
                        style: TextStyle(color: Colors.black),
                      )
                    : Text(
                        _dropDownValue,
                        style: TextStyle(color: Colors.blue),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.blue),
                items: ['Prohibited Liscense', 'Non-Prohibited Liscense'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val.toString();
                    },
                  );
                },
              ),
              SizedBox(height: 15),
              Text(
                'Select Type of Weapon',
                style: TextStyle(color: Colors.black),
              ),
              DropdownButton(
                hint: _dropDownValue2 == null
                    ? Text(
                        'Select type of liscense',
                        style: TextStyle(color: Colors.black),
                      )
                    : Text(
                        _dropDownValue2,
                        style: TextStyle(color: Colors.blue),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.blue),
                items: [
                  'Revolver or Pistol over .46 inches bore',
                  'Rifle 303 and all semi/automatic rifles',
                  'Rifle G-III',
                  'StenGun',
                  'Carbine'
                ].map(
                  (val1) {
                    return DropdownMenuItem<String>(
                      value: val1,
                      child: Text(val1),
                    );
                  },
                ).toList(),
                onChanged: (val1) {
                  setState(
                    () {
                      _dropDownValue2 = val1.toString();
                    },
                  );
                },
              ),
              SizedBox(height: 15),
              Text(
                'Purpose',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _purpose,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
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
              SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFormField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF737373),
              fontSize: 15,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          TextField(
              // Add text field properties
              ),
        ],
      ),
    );
  }
}
