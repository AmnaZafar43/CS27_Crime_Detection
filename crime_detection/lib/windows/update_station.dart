// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/fir_details.dart';
import 'package:flutter/material.dart';

class UpdateStation extends StatefulWidget {
  const UpdateStation(
      {super.key,
      required this.branchNumber,
      required this.numberOfBranches,
      required this.district,
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
  State<UpdateStation> createState() => _UpdateStationState();
}

class _UpdateStationState extends State<UpdateStation> {
  final fireStore = FirebaseFirestore.instance.collection('PoliceStation');
  final TextEditingController _branchNumber = TextEditingController();
  final TextEditingController _district = TextEditingController();
  final TextEditingController _numberOfBranches = TextEditingController();
  final TextEditingController _numberOfPoliceOfficers = TextEditingController();
  final TextEditingController _policeStationName = TextEditingController();
  final TextEditingController _province = TextEditingController();
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    _branchNumber.text = widget.branchNumber;
    _district.text = widget.district;
    _numberOfBranches.text = widget.numberOfBranches;
    _numberOfPoliceOfficers.text = widget.numberOfPoliceOfficers;
    _policeStationName.text = widget.policeStationName;
    _province.text = widget.province;

    void _datePicker() async {
      DateTime? dt = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
      if (dt != null) {
        setState(() {
          dateTime = dt;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF52B6DF),
        title: const Text('Police Station'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7)),
              const Text(
                'Please fill out the relevant information in each section.',
                style: TextStyle(
                  color: Color(0xFF737373),
                  fontSize: 16,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: Card(
                  color: Colors.grey[400],
                  child: const Center(
                    child: Text(
                      'Personal Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'Police Station Name',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _policeStationName,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Number of Police Officers',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _numberOfPoliceOfficers,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Number of Branches',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _numberOfBranches,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Branch Number',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _branchNumber,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'District',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _district,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0x66F1F5F9),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Province',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _province,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color(0x66F1F5F9),
                ),
              ),
              const SizedBox(height: 75),
              ElevatedButton(
                onPressed: () async {
                  onPressed();
                },
                child: const Text(
                  'Update',
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
      ),
    );
  }

  Widget buildFormField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF737373),
              fontSize: 15,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const TextField(),
        ],
      ),
    );
  }

  void onPressed() async {
    try {
      await fireStore.doc(widget.id).update({
        'Police Station Name': _policeStationName.text.toString(),
        'Number of Police Officers': _numberOfPoliceOfficers.text.toString(),
        'Number of Branches': _numberOfBranches.text.toString(),
        'District': _district.text.toString(),
        'Branch Number': _branchNumber.text.toString(),
        'Province': _province.text.toString(),
        'id': widget.id,
        'active': true,
        'updateAt': DateTime.now(),
      });
      Utils().showToast(
        context,
        'Updated Successfully!!!',
      );
    } catch (e) {
      Utils().showToast(
        context,
        e.toString(),
      );
    }
  }
}
