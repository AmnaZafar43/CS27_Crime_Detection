import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/higher_authority_dashboard.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_methods.dart';
import '../utils/toast.dart';

class AddOfficer extends StatefulWidget {
  const AddOfficer({super.key});

  @override
  State<AddOfficer> createState() => _AddOfficerState();
}

class _AddOfficerState extends State<AddOfficer> {
  bool isLoading = false;
  // this create a new collection name police officer to firebase
  final fireStore = FirebaseFirestore.instance.collection('PoliceOfficer');
  // initializing all controllers of text field

  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _age = TextEditingController();

  final TextEditingController _qualification = TextEditingController();

  final TextEditingController _post = TextEditingController();

  final TextEditingController _district = TextEditingController();

  final TextEditingController _gender = TextEditingController();

  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF52B6DF),
        title: const Text('Police Station'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                // the arrow icon will take you back to select crime screen
                MaterialPageRoute(
                    builder: (context) => const HigherAuthorityDashboard()));
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
                  fillColor: const Color(0x66F1F5F9),
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
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                // gender label
                'Gender',
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
                  // style label with color letter spacing and font style
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  // add border to text field
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                // qualification label
                'Qualification',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              // text field to take input
              TextField(
                // this text field takes qualification from user
                controller: _qualification,
                style: const TextStyle(color: Colors.black),
                // decorate the input
                decoration: InputDecoration(
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
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                // post label
                'Post',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this text field takes charge from user
                controller: _post,
                style: const TextStyle(color: Colors.black),
                // add decoration to text with label style, color, font family.
                decoration: InputDecoration(
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
                  fillColor: const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                // label
                'District',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // this field takes district as input
                controller: _district,
                style: const TextStyle(color: Colors.black),
                // sets decoration like color, font style etc
                decoration: InputDecoration(
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
                // label
                'Address',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                // takes input address from user
                controller: _address,
                style: const TextStyle(color: Colors.black),
                // set the decoration of text with padding, color, font etc
                decoration: InputDecoration(
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
                  addButtonPress();
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
          const TextField(),
        ],
      ),
    );
  }

  void addButtonPress() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_firstName.text.isEmpty ||
          _lastName.text.isEmpty ||
          _age.text.isEmpty ||
          _gender.text.isEmpty ||
          _address.text.isEmpty ||
          _post.text.isEmpty ||
          _qualification.text.isEmpty ||
          _district.text.isEmpty) {
        Utils().showToast(context, 'Text box should not be empty');
      } else {
        await FirebaseMethods().addOfficer(
            context,
            _firstName.text,
            _lastName.text,
            _age.text,
            _gender.text,
            _address.text,
            _qualification.text,
            _post.text,
            _district.text);
      }
      // ignore: use_build_context_synchronously
      Utils().showToast(
        context,
        'Add successfully',
      );
    } catch (e) {
      Utils().showToast(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
}
