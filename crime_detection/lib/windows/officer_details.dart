import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/update_officer.dart';
import 'package:crime_detection/windows/view_officer.dart';
import 'package:flutter/material.dart';

class OfficerDetails extends StatefulWidget {
  OfficerDetails(
      {super.key,
      required this.address,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.district,
      required this.post,
      required this.gender,
      required this.id,
      required this.qualification});
  final String age;
  final String firstName;
  final String lastName;
  final String address;
  final String post;
  final String gender;
  final String district;
  final String id;
  final String qualification;

  @override
  State<OfficerDetails> createState() => _OfficerDetailsState();
}

class _OfficerDetailsState extends State<OfficerDetails> {
  final fireStore =
      FirebaseFirestore.instance.collection('PoliceOfficer').snapshots();
  CollectionReference ref =
      FirebaseFirestore.instance.collection('PoliceOfficer');
  // bool _isLoading = false;
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52B6DF),
          title: const Text('Police Officer Details'),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewOfficer()));
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
                      'Qualification',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.qualification.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Post',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.post.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'District',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.district.toString(),
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
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref.doc(widget.id.toString()).delete();
                    Utils().showToast(context, 'Deleted Successfully!!!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewOfficer(),
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
                        builder: (context) => UpdateOfficer(
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          address: widget.address,
                          age: widget.age,
                          district: widget.district,
                          gender: widget.gender,
                          id: widget.id,
                          post: widget.post,
                          qualification: widget.qualification,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
