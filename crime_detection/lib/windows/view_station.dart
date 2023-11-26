import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/criminal_details.dart';
import 'package:crime_detection/windows/officer_added.dart';
import 'package:crime_detection/windows/officer_details.dart';
import 'package:crime_detection/windows/station_details.dart';
import 'package:flutter/material.dart';

class ViewStation extends StatefulWidget {
  const ViewStation({super.key});

  @override
  State<ViewStation> createState() => _ViewStationState();
}

class _ViewStationState extends State<ViewStation> {
  final fireStore =
      FirebaseFirestore.instance.collection('PoliceStation').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF52B6DF),
        title: const Text('View Police Stations'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const SelectCrime()));
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
                          snapshot.data!.docs[position]['Police Station Name']
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[position]['Province'].toString(),
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
                                  builder: (context) => StationDetails(
                                        name: snapshot
                                            .data!
                                            .docs[position]
                                                ['Police Station Name']
                                            .toString(),
                                        branchNumber: snapshot.data!
                                            .docs[position]['Branch Number']
                                            .toString(),
                                        noOfBranches: snapshot
                                            .data!
                                            .docs[position]
                                                ['Number of Branches']
                                            .toString(),
                                        noOfPoliceOfficer: snapshot
                                            .data!
                                            .docs[position]
                                                ['Number of Police Officers']
                                            .toString(),
                                        province: snapshot
                                            .data!.docs[position]['Province']
                                            .toString(),
                                        id: snapshot.data!.docs[position]['id']
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
