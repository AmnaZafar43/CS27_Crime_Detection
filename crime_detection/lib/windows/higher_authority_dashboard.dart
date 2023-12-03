import 'package:crime_detection/windows/add_officer.dart';
import 'package:crime_detection/windows/add_police_station.dart';
import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/release_order.dart';
import 'package:crime_detection/windows/view_fir.dart';
import 'package:crime_detection/windows/view_officer.dart';
import 'package:crime_detection/windows/view_order.dart';
import 'package:crime_detection/windows/view_station.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HigherAuthorityDashboard extends StatefulWidget {
  const HigherAuthorityDashboard({super.key});

  @override
  State<HigherAuthorityDashboard> createState() =>
      _HigherAuthorityDashboardState();
}

class _HigherAuthorityDashboardState extends State<HigherAuthorityDashboard> {
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
                'Higher Authority',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              title: const Text('Add Police Officer'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddOfficer()));
              },
            ),
            ListTile(
              title: const Text('View Police Officers'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewOfficer()));
              },
            ),
            ListTile(
              title: const Text('Add Police Station'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPoliceStation()));
              },
            ),
            ListTile(
              title: const Text('View Police Stations'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewStation()));
              },
            ),
            ListTile(
              title: const Text('Release Order'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReleaseOrder()));
              },
            ),
            ListTile(
              title: const Text('View Order'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewOrder()));
              },
            ),
            ListTile(
              title: const Text('View FIRs'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewFIR()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Higher Authority Dashborad'),
      ),
    );
  }
}
