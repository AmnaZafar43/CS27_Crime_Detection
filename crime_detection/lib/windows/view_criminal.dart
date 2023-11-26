import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/criminal_details.dart';
import 'package:flutter/material.dart';

class ViewCriminal extends StatefulWidget {
  const ViewCriminal({super.key});

  @override
  State<ViewCriminal> createState() => _ViewCriminalState();
}

class _ViewCriminalState extends State<ViewCriminal> {
  bool _isLoading = false;
  final fireStore =
      FirebaseFirestore.instance.collection('criminals').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF52B6DF),
        title: const Text('View Criminals'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
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
                          snapshot.data!.docs[position]['First Name']
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[position]['Charge'].toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            // backgroundColor: Colors.grey
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
                                  builder: (context) => CriminalDetails(
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
                                        date: DateTime.parse(
                                          snapshot
                                              .data!
                                              .docs[position]
                                                  ['Date of Imprison']
                                              .toString(),
                                        ),
                                        wanted: snapshot
                                            .data!.docs[position]['Most Wanted']
                                            .toString(),
                                        id: snapshot.data!.docs[position]['id']
                                            .toString(),
                                        charge: snapshot
                                            .data!.docs[position]['Charge']
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
