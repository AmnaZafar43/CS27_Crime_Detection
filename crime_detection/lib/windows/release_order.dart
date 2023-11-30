import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/fir_details.dart';
import 'package:flutter/material.dart';

import '../utils/toast.dart';

class ReleaseOrder extends StatefulWidget {
  const ReleaseOrder({super.key});

  @override
  State<ReleaseOrder> createState() => _ReleaseOrderState();
}

class _ReleaseOrderState extends State<ReleaseOrder> {
// this create a new collection name criminals to firebase
  final fireStore = FirebaseFirestore.instance.collection('Orders');
// initializing all controllers of text field
  final TextEditingController _giveOrder = TextEditingController();

  final TextEditingController _branchNumberToOrder = TextEditingController();

  final TextEditingController _district = TextEditingController();

  final TextEditingController _province = TextEditingController();
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Color(0xFF52B6DF),
        title: const Text('Police Station'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SelectCrime()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7)),
              Text(
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
                  child: Center(
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
              Text(
                'Give Order',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _giveOrder,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w400,
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
                'Police Station Branch Number to Order',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _branchNumberToOrder,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w400,
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
                    // fontWeight: FontWeight.w400,
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
                'Province',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _province,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w400,
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
                'Order Release Date',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              ElevatedButton(
                // this button calls _datePicker function which shows us calender to pick date
                onPressed: _datePicker,
                child: const Text(
                  // sets decoration like color, font style etc
                  'Pick Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 125),
              ElevatedButton(
                onPressed: () {
                  try {
                    // generate unique id
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    // adds the data to firebase with collection name criminals as above written
                    print(dateTime.toString());
                    fireStore.doc(id).set({
                      // _firstName controller stores the name that is added in the text field
                      'Give Order': _giveOrder.text.toString(),
                      'Police Station Branch Number to Order':
                          _branchNumberToOrder.text.toString(),
                      'District': _district.text.toString(),
                      'Province': _province.text.toString(),
                      'Order Release Date': dateTime.toString(),
                      'id': id,
                      // createAt,updateAt,active shows the date and time when table is created and active shows the table is active or in use or not.
                      'createAt': DateTime.now(),
                      'updateAt': DateTime.now(),
                      'active': true,
                    }).then((value) {
                      Utils().showToast(context, 'Successfully Added!!');
                    }).onError((error, stackTrace) {
                      // show toast shows the mssg on bottom of screen
                      Utils().showToast(context, error.toString());
                    });
                  } catch (e) {
                    // throws exception if data not added successfully
                    Utils().showToast(
                      context,
                      e.toString(),
                    );
                  }
                },
                child: const Text(
                  'Add',
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
            style: TextStyle(
              color: Color(0xFF737373),
              fontSize: 15,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          TextField(
              // Add text field properties
              ),
        ],
      ),
    );
  }
}
