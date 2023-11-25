import 'package:cloud_firestore/cloud_firestore.dart';
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
      required this.gender});
  final String age;
  final String firstName;
  final String lastName;
  final String address;
  final String charge;
  final String gender;
  final DateTime date;

  @override
  State<CriminalDetails> createState() => _CriminalDetailsState();
}

class _CriminalDetailsState extends State<CriminalDetails> {
  @override
  Widget build(BuildContext context) {
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
            height: 350,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 228, 228),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.firstName.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            'Last Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.lastName.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            'Gender',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.gender.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            'Age',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.age.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            'Charge',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.charge.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            'Address',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.address.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            'Date of Imprison',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.date.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
