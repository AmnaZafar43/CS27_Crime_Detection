import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/update_criminal.dart';
import 'package:crime_detection/windows/view_criminal.dart';
import 'package:flutter/material.dart';

class CriminalDetails extends StatefulWidget {
  const CriminalDetails(
      {super.key,
      required this.address,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.charge,
      required this.date,
      required this.gender,
      required this.id,
      required this.wanted});
  final String age;
  final String firstName;
  final String lastName;
  final String address;
  final String charge;
  final String gender;
  final DateTime date;
  final String id;
  final String wanted;

  @override
  State<CriminalDetails> createState() => _CriminalDetailsState();
}

class _CriminalDetailsState extends State<CriminalDetails> {
  final fireStore =
      FirebaseFirestore.instance.collection('criminals').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('criminals');
  bool _isLoading = false;
//
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52B6DF),
          title: const Text('Criminal Details'),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewCriminal()));
            },
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: 450,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 228, 228),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'First Name',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.firstName.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Last Name',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.lastName.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Gender',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.gender.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Age',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.age.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Charge',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.charge.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Address',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.address.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Date of Imprison',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.date.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref.doc(widget.id.toString()).delete();
                    Utils().showToast(context, 'Deleted Successfully!!!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewCriminal(),
                      ),
                    );
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateCriminal(
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          age: widget.age,
                          address: widget.address,
                          charge: widget.charge,
                          date: widget.date,
                          gender: widget.gender,
                          id: widget.id,
                          wanted: widget.wanted,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      // height: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
