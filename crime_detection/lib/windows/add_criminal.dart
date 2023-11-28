import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/crime_type.dart';
import 'package:flutter/material.dart';

class AddCriminal extends StatefulWidget {
  const AddCriminal({super.key});

  @override
  State<AddCriminal> createState() => _AddCriminalState();
}

class _AddCriminalState extends State<AddCriminal> {
// this create a new collection name criminals to firebase
  final fireStore = FirebaseFirestore.instance.collection('criminals');
// initializing all controllers of text field
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
    // this function is used for picking date time
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
        backgroundColor: const Color(0xFF52B6DF),
        // this adds title to top of page
        title: const Text('Police Station'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // the arrow icon will take you back to select crime screen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SelectCrime()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          // column widget is used here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // set padding
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7)),
              const Text(
                // this adds text to top of screen
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
                // sized box is used for proper height, width and alignment
                width: 100.0,
                height: 50.0,
                child: Card(
                  color: Colors.grey[400],
                  child: const Center(
                    child: Text(
                      'Personal Information',
                      // set text alignment
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'First Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this text field takes first name of user
                controller: _firstName,
                style: const TextStyle(color: Colors.black),
                // decoration is used for input decoration
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // adds border to text field
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
                'Last Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this text field takes last name of user
                controller: _lastName,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  // style the label with color and font style
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // set border of text field
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
                // label of age
                'Age',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this text field takes age from user and decorate that input with color, font style etc.
                controller: _age,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // adds border to text field
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
                'Gender',
                // gender label
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this text field takes gender from user
                controller: _gender,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    // style label with color letter spacing and font style
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // add border to text field
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
                // address label
                'Address',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              // text field to take input
              TextField(
                // this text field takes address from user
                controller: _address,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  // decorate the input 
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // set border to text field
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
                // charge label
                'Charge',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this text field takes charge from user
                controller: _charge,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  // add decoration to text with label style, color, font family.
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // add border to text field
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
                // label
                'Date of Imprison',
                textAlign: TextAlign.justify,
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
                // label
                'Most Wanted',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // takes input from user
                controller: _wanted,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  // set the decoration of text with padding, color, font etc
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // sets border to text field
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 75),
              ElevatedButton(
                // this button perfoms main functionality
                onPressed: () {
                  try {
                    // generate unique id
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                        // adds the data to firebase with collection name criminals as above written
                    fireStore
                        .doc(id)
                        .set({
                          // _firstName controller stores the name that is added in the text field
                          'First Name': _firstName.text.toString(),
                          'Last Name': _lastName.text.toString(),
                          'Age': _age.text.toString(),
                          'Gender': _gender.text.toString(),
                          'Address': _address.text.toString(),
                          'Charge': _charge.text.toString(),
                          'Date of Imprison': dateTime.toString(),
                          'Most Wanted': _wanted.text.toString(),
                          'id': id,
                          // createAt,updateAt,active shows the date and time when table is created and active shows the table is active or in use or not.
                          'createAt': DateTime.now(),
                          'updateAt': DateTime.now(),
                          'active': true,
                        })
                        .then((value) {})
                        .onError((error, stackTrace) {
                          // show toast shows the mssg on bottom of screen 
                          Utils().showToast(context, error.toString());
                        });
                  } catch (e) {
                    // throws exception if data not added successfully
                    Utils().showToast(
                      context,
                      e.toString(),
                    );
                  }
                },
                child: const Text(
                  // this is add button text
                  'Add',
                  style: TextStyle(
                    // style the text with color, font etc
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
            style: const TextStyle(
              color: Color(0xFF737373),
              fontSize: 15,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const TextField(
              
              ),
        ],
      ),
    );
  }
}
