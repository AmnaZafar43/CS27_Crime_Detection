import 'package:crime_detection/windows/cover_page.dart';
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
      drawer: const Drawer(),
      body: const Center(
        child: Text('Civilian Dashborad'),
      ),
    );
  }
}
