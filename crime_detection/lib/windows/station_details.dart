import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/update_criminal.dart';
import 'package:crime_detection/windows/update_station.dart';
import 'package:crime_detection/windows/view_criminal.dart';
import 'package:crime_detection/windows/view_station.dart';
import 'package:flutter/material.dart';

class StationDetails extends StatefulWidget {
  const StationDetails(
      {super.key,
      required this.branchNumber,
      required this.district,
      required this.numberOfBranches,
      required this.numberOfPoliceOfficers,
      required this.policeStationName,
      required this.province,
      required this.id});
  final String branchNumber;
  final String district;
  final String numberOfBranches;
  final String numberOfPoliceOfficers;
  final String policeStationName;
  final String province;
  final String id;

  @override
  State<StationDetails> createState() => _StationDetailsState();
}

class _StationDetailsState extends State<StationDetails> {
  final fireStore =
      FirebaseFirestore.instance.collection('PoliceStation').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('PoliceStation');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52B6DF),
          title: const Text('Police Station Details'),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewStation()));
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
                      'Police Station Name',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.policeStationName.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Branch Number',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.branchNumber.toString(),
                      style: TextStyle(color: Colors.black),
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
                      'Number of Branches',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.numberOfBranches.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'No of Police Officers',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.numberOfPoliceOfficers.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Province',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.province.toString(),
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
                        builder: (context) => const ViewStation(),
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
                        builder: (context) => UpdateStation(
                          policeStationName: widget.policeStationName,
                          branchNumber: widget.branchNumber,
                          district: widget.district,
                          numberOfBranches: widget.numberOfBranches,
                          numberOfPoliceOfficers: widget.numberOfPoliceOfficers,
                          province: widget.province,
                          id: widget.id,
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
