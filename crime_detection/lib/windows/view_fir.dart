import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/criminal_details.dart';
import 'package:crime_detection/windows/detail_fir.dart';
import 'package:crime_detection/windows/fir_details.dart';
import 'package:crime_detection/windows/liscense_details.dart';
import 'package:crime_detection/windows/police_dashboard.dart';
import 'package:flutter/material.dart';

class ViewFIR extends StatefulWidget {
  const ViewFIR({super.key});

  @override
  State<ViewFIR> createState() => _ViewFIRState();
}

class _ViewFIRState extends State<ViewFIR> {
  final fireStore =
      FirebaseFirestore.instance.collection('FirDetails').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF52B6DF),
        title: const Text('View FIRs'),
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
                          snapshot.data!.docs[position]['Detail of Incident']
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[position]['Suspect Name']
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
                              builder: (context) => DetailsOfFIR(
                                addressOfIncident: snapshot
                                    .data!.docs[position]['Address of Incident']
                                    .toString(),
                                age: snapshot
                                    .data!.docs[position]['Age']
                                    .toString(),                                    
                                cnic: snapshot
                                    .data!.docs[position]['CNIC']
                                    .toString(),                                    
                                crimeInformation: snapshot
                                    .data!.docs[position]['Crime Information']
                                    .toString(),                                    
                                dateOfIncident: snapshot
                                    .data!.docs[position]['Date of Incident']
                                    .toString(),                                    
                                detailOfIncident: snapshot
                                    .data!.docs[position]['Detail of Incident']
                                    .toString(),                                    
                                districtOfIncident: snapshot
                                    .data!.docs[position]['District of Incident']
                                    .toString(),                                    
                                firstName: snapshot
                                    .data!.docs[position]['First Name']
                                    .toString(),                                    
                                gender: snapshot
                                    .data!.docs[position]['Gender']
                                    .toString(),                                    
                                id: snapshot
                                    .data!.docs[position]['id']
                                    .toString(),                                    
                                lastName: snapshot
                                    .data!.docs[position]['Last Name']
                                    .toString(),                                    
                                phoneNumber: snapshot
                                    .data!.docs[position]['Phone Number']
                                    .toString(),                                    
                                suspectAddress: snapshot
                                    .data!.docs[position]['Suspect Address']
                                    .toString(),                                    
                                suspectName: snapshot
                                    .data!.docs[position]['Suspect Name']
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
