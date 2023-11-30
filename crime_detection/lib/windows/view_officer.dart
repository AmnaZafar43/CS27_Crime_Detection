import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/criminal_details.dart';
import 'package:crime_detection/windows/higher_authority_dashboard.dart';
import 'package:crime_detection/windows/officer_added.dart';
import 'package:crime_detection/windows/officer_details.dart';
import 'package:flutter/material.dart';

class ViewOfficer extends StatefulWidget {
  const ViewOfficer({super.key});

  @override
  State<ViewOfficer> createState() => _ViewOfficerState();
}

class _ViewOfficerState extends State<ViewOfficer> {
  // bool _isLoading = false;
  final fireStore =
      FirebaseFirestore.instance.collection('PoliceOfficer').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF52B6DF),
        title: const Text('View Police Officers'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HigherAuthorityDashboard()));
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
                          snapshot.data!.docs[position]['Post'].toString(),
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        trailing: const Text(
                          ('View Details'),
                          style: TextStyle(
                            color: Color.fromARGB(255, 246, 21, 4),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfficerDetails(
                                        firstName: snapshot
                                            .data!.docs[position]['First Name']
                                            .toString(),
                                        lastName: snapshot
                                            .data!.docs[position]['Last Name']
                                            .toString(),
                                        age: snapshot
                                            .data!.docs[position]['Age']
                                            .toString(),
                                        address: snapshot
                                            .data!.docs[position]['Address']
                                            .toString(),
                                        gender: snapshot
                                            .data!.docs[position]['Gender']
                                            .toString(),
                                        post: snapshot
                                            .data!.docs[position]['Post']
                                            .toString(),
                                        id: snapshot.data!.docs[position]['id']
                                            .toString(),
                                        qualification: snapshot.data!
                                            .docs[position]['Qualification']
                                            .toString(),
                                        district: snapshot
                                            .data!.docs[position]['District']
                                            .toString(),
                                      )));
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
