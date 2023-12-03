import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_detection/windows/order_details.dart';
import 'package:crime_detection/windows/police_dashboard.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatefulWidget {
  const ViewOrder({super.key});

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  // bool _isLoading = false;
  final fireStore = FirebaseFirestore.instance.collection('Orders').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF52B6DF),
        title: const Text('View Order'),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
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
                          snapshot.data!.docs[position]['Give Order']
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[position]['District'].toString(),
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
                                  builder: (context) => OrderDetails(
                                        giveOrder: snapshot
                                            .data!.docs[position]['Give Order']
                                            .toString(),
                                        branchNumberToOrder: snapshot
                                            .data!
                                            .docs[position][
                                                'Police Station Branch Number to Order']
                                            .toString(),
                                        orderReleaseDate: snapshot
                                            .data!
                                            .docs[position]
                                                ['Order Release Date']
                                            .toString(),
                                        district: snapshot
                                            .data!.docs[position]['District']
                                            .toString(),
                                        province: snapshot
                                            .data!.docs[position]['Province']
                                            .toString(),
                                        id: snapshot.data!.docs[position]['id']
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
