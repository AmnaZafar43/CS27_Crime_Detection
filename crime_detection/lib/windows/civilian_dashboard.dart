import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/liscense_information.dart';
import 'package:crime_detection/windows/report_crime.dart';
import 'package:crime_detection/windows/view_fir.dart';
import 'package:crime_detection/windows/view_liscense.dart';
import 'package:crime_detection/windows/view_order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CivilianDashboard extends StatefulWidget {
  const CivilianDashboard({super.key});

  @override
  State<CivilianDashboard> createState() => _CivilianDashboardState();
}

class _CivilianDashboardState extends State<CivilianDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoverScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF52B6DF),
              ),
              child: Text(
                'Civilians',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              title: const Text('Report FIR'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportCrime()));
              },
            ),
            ListTile(
              title: const Text('View FIR'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewFIR()));
              },
            ),
            ListTile(
              title: const Text('Apply for Liscense'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LiscenseInformation()));
              },
            ),
            ListTile(
              title: const Text('View Liscense'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewLiscense()));
              },
            ),
            ListTile(
              title: const Text('View Orders'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewOrder()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Civilian Dashborad'),
      ),
    );
  }
}
