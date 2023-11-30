import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/update_officer.dart';
import 'package:crime_detection/windows/view_fir.dart';
import 'package:crime_detection/windows/view_officer.dart';
import 'package:crime_detection/windows/view_order.dart';
import 'package:flutter/material.dart';

class DetailsOfFIR extends StatefulWidget {
  DetailsOfFIR({
    super.key,
    required this.addressOfIncident,
    required this.age,
    required this.id,
    required this.cnic,
    required this.crimeInformation,
    required this.dateOfIncident,
    required this.detailOfIncident,
    required this.districtOfIncident,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.phoneNumber,
    required this.suspectAddress,
    required this.suspectName,
  });
  final String districtOfIncident;
  final String firstName;
  final String gender;
  final String lastName;
  final String phoneNumber;
  final String suspectAddress;
  final String suspectName;
  final String detailOfIncident;
  final String dateOfIncident;
  final String crimeInformation;
  final String cnic;
  final String age;
  final String addressOfIncident;
  final String id;
  @override
  State<DetailsOfFIR> createState() => _DetailsOfFIRState();
}

class _DetailsOfFIRState extends State<DetailsOfFIR> {
  final fireStore =
      FirebaseFirestore.instance.collection('FirDetails').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('FirDetails');
  // bool _isLoading = false;
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52B6DF),
          title: const Text('FIR Details'),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewFIR()));
            },
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: 550,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 228, 228),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Detail of Incident',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.detailOfIncident.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'Date of Incident',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.dateOfIncident.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'Crime Information',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.crimeInformation.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'CNIC',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.cnic.toString(),
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
                    'District of Incident',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.districtOfIncident.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'Address of Incident',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.addressOfIncident.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
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
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.phoneNumber.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'Suspect Name',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.suspectName.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'Suspect Address',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.suspectAddress.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () async {
                    await ref.doc(widget.id.toString()).delete();
                    Utils().showToast(context, 'Deleted Successfully!!!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewFIR(),
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
