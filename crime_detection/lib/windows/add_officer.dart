import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/crime_type.dart';
import 'package:flutter/material.dart';
import '../utils/toast.dart';

class AddOfficer extends StatefulWidget {
  const AddOfficer({super.key});

  @override
  State<AddOfficer> createState() => _AddOfficerState();
}

class _AddOfficerState extends State<AddOfficer> {
  final fireStore = FirebaseFirestore.instance.collection('PoliceOfficer');

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
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7)),
              const Text(
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
                  child: const Center(
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
              const Text(
                'First Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _firstName,
                style: const TextStyle(color: Colors.black),
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
                'Last Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _lastName,
                style: const TextStyle(color: Colors.black),
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
                'Qualification',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _qualification,
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
              const Text(
                'Post',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _post,
                style: const TextStyle(color: Colors.black),
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
                'District',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _district,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w400,
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
                'Address',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _address,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w400,
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
              SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {
                  try {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    fireStore.doc(id).set({
                      'First Name': _firstName.text.toString(),
                      'Last Name': _lastName.text.toString(),
                      'Age': _age.text.toString(),
                      'Gender': _gender.text.toString(),
                      'Address': _address.text.toString(),
                      'Qualification': _qualification.text.toString(),
                      'Post': _post.text.toString(),
                      'District': _district.text.toString(),
                      'id': id,
                      'createAt': DateTime.now(),
                      'updateAt': DateTime.now(),
                      'active': true,
                    }).then((value) {
                      Utils().showToast(context, 'Successfully Added!!');
                    }).onError((error, stackTrace) {
                      Utils().showToast(context, error.toString());
                    });
                  } catch (e) {
                    Utils().showToast(
                      context,
                      e.toString(),
                    );
                  }
                },
                child: const Text(
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
            style: const TextStyle(
              color: Color(0xFF737373),
              fontSize: 15,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const TextField(
              // Add text field properties
              ),
        ],
      ),
    );
  }
}
