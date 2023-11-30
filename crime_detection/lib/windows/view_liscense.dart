import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/criminal_details.dart';
import 'package:crime_detection/windows/liscense_details.dart';
import 'package:crime_detection/windows/police_dashboard.dart';
import 'package:flutter/material.dart';

class ViewLiscense extends StatefulWidget {
  const ViewLiscense({super.key});

  @override
  State<ViewLiscense> createState() => _ViewLiscenseState();
}

class _ViewLiscenseState extends State<ViewLiscense> {
  final fireStore =
      FirebaseFirestore.instance.collection('LiscenseInformation').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF52B6DF),
        title: const Text('View Liscenses'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PoliceOfficerDashboard()));
          },
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, position) {
                    return Card(
                      color: Colors.grey.shade400,
                      child: ListTile(
                        title: Text(
                          snapshot.data!.docs[position]['First Name']
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[position]['Type of Weapon']
                              .toString(),
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        trailing: const Text(
                          ('View Details'),
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LiscenseDetails(
                                firstName: snapshot
                                    .data!.docs[position]['First Name']
                                    .toString(),
                                lastName: snapshot
                                    .data!.docs[position]['Last Name']
                                    .toString(),
                                age: snapshot.data!.docs[position]['Age']
                                    .toString(),
                                cnic: snapshot.data!.docs[position]['CNIC']
                                    .toString(),
                                phoneNumber: snapshot
                                    .data!.docs[position]['Phone Number']
                                    .toString(),
                                district: snapshot
                                    .data!.docs[position]['District']
                                    .toString(),
                                address: snapshot
                                    .data!.docs[position]['Address']
                                    .toString(),
                                purpose: snapshot
                                    .data!.docs[position]['Purpose']
                                    .toString(),
                                typeOfLiscense: snapshot
                                    .data!.docs[position]['Type of Liscense']
                                    .toString(),
                                typeOfWeapon: snapshot
                                    .data!.docs[position]['Type of Weapon']
                                    .toString(),
                                id: snapshot.data!.docs[position]['id']
                                    .toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
