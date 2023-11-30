// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/update_criminal.dart';
import 'package:crime_detection/windows/view_criminal.dart';
import 'package:crime_detection/windows/view_liscense.dart';
import 'package:flutter/material.dart';

class LiscenseDetails extends StatefulWidget {
  const LiscenseDetails(
      {super.key,
      required this.address,
      required this.age,
      required this.lastName,
      required this.cnic,
      required this.district,
      required this.firstName,
      required this.phoneNumber,
      required this.id,
      required this.typeOfLiscense,
      required this.purpose,
      required this.typeOfWeapon});
  final String age;
  final String cnic;
  final String address;
  final String district;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String purpose;
  final String typeOfLiscense;
  final String typeOfWeapon;
  final String id;
  @override
  State<LiscenseDetails> createState() => _LiscenseDetailsState();
}

class _LiscenseDetailsState extends State<LiscenseDetails> {
  final fireStore =
      FirebaseFirestore.instance.collection('LiscenseInformation').snapshots();
  CollectionReference ref =
      FirebaseFirestore.instance.collection('LiscenseInformation');
  // bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52B6DF),
          title: const Text('Liscense Details'),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewLiscense()));
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
                const SizedBox(height: 20),
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
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Last Name',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.lastName.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.phoneNumber.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Age',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.age.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'CNIC',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.cnic.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'District',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.district.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Purpose',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.purpose.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Type of Liscense',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.typeOfLiscense.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Type of Weapon',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.typeOfWeapon.toString(),
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
                        builder: (context) => const ViewLiscense(),
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
              ],
            ),
          ),
        ));
  }
}
