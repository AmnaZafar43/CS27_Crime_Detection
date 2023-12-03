import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/utils/toast.dart';
import 'package:crime_detection/windows/view_order.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({
    super.key,
    required this.branchNumberToOrder,
    required this.giveOrder,
    required this.id,
    required this.orderReleaseDate,
    required this.district,
    required this.province,
  });
  final String giveOrder;
  final String branchNumberToOrder;
  final String district;
  final String province;
  final String id;
  final String orderReleaseDate;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final fireStore =
      FirebaseFirestore.instance.collection('Orders').snapshots();
  CollectionReference ref =
      FirebaseFirestore.instance.collection('Orders');
  // bool _isLoading = false;
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52B6DF),
          title: const Text('Order Details'),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewOrder()));
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
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Give Order',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.giveOrder.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Police Station Branch Number To Order',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.branchNumberToOrder.toString(),
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
                      'Province',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.province.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Order Release Date',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.orderReleaseDate.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ]
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref.doc(widget.id.toString()).delete();
                    Utils().showToast(context, 'Deleted Successfully!!!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewOrder(),
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
