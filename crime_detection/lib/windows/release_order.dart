import 'package:crime_detection/windows/higher_authority_dashboard.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_methods.dart';
import '../utils/toast.dart';

class ReleaseOrder extends StatefulWidget {
  const ReleaseOrder({super.key});

  @override
  State<ReleaseOrder> createState() => _ReleaseOrderState();
}

class _ReleaseOrderState extends State<ReleaseOrder> {
  bool isLoading = false;
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
        backgroundColor:const Color(0xFF52B6DF),
        title: const Text('Police Station'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon:const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HigherAuthorityDashboard()));
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
                'Give Order',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _giveOrder,
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
                  fillColor:const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'Police Station Branch Number to Order',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _branchNumberToOrder,
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
                  fillColor:const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                'District',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
              TextField(
                controller: _district,
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
                  fillColor:const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
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
                  fillColor:const Color(0x66F1F5F9),
                ),
              ),
              SizedBox(height: 15),
              const Text(
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
                  addButtonPress();
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

  void addButtonPress() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_branchNumberToOrder.text.isEmpty ||
          _district.text.isEmpty ||
          _giveOrder.text.isEmpty ||
          _province.text.isEmpty) {
        Utils().showToast(context, 'Text box should not be empty');
      } else {
        await FirebaseMethods().releaseOrder(
            context,
            _giveOrder.text,
            _branchNumberToOrder.text,
            _district.text,
            _province.text,
            dateTime!);
      }
      // ignore: use_build_context_synchronously
      Utils().showToast(
        context,
        'Add successfully',
      );
    } catch (e) {
      Utils().showToast(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
}
