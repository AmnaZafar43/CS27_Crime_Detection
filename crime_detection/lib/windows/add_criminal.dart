import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/crime_type.dart';
import 'package:flutter/material.dart';

class AddCriminal extends StatefulWidget {
  AddCriminal({super.key});

  @override
  State<AddCriminal> createState() => _AddCriminalState();
}

class _AddCriminalState extends State<AddCriminal> {
  final fireStore = FirebaseFirestore.instance.collection('criminals');

  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _age = TextEditingController();

  final TextEditingController _gender = TextEditingController();

  final TextEditingController _address = TextEditingController();

  final TextEditingController _charge = TextEditingController();

  final TextEditingController _wanted = TextEditingController();

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
                'Gender',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _gender,
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
                'Charge',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _charge,
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
                'Date of Imprison',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              ElevatedButton(
                onPressed: _datePicker,
                child: Text(
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
              Text(
                'Most Wanted',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _wanted,
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
              SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {
                  try {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    fireStore
                        .doc(id)
                        .set({
                          'First Name': _firstName.text.toString(),
                          'Last Name': _lastName.text.toString(),
                          'Age': _age.text.toString(),
                          'Gender': _gender.text.toString(),
                          'Address': _address.text.toString(),
                          'Charge': _charge.text.toString(),
                          'Date of Imprison' : dateTime.toString(),
                          'Most Wanted': _wanted.text.toString(),
                          'id': id
                        })
                        .then((value) {})
                        .onError((error, stackTrace) {
                          Utils().showToast(context, error.toString());
                        });
                  } catch (e) {
                    Utils().showToast(
                      context,
                      e.toString(),
                    );
                  }
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
