import 'package:crime_detection/windows/add_criminal.dart';
import 'package:crime_detection/windows/add_officer.dart';
import 'package:crime_detection/windows/add_police_station.dart';
import 'package:crime_detection/windows/civilian_dashboard.dart';
import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/fir_details.dart';
import 'package:crime_detection/windows/higher_authority_dashboard.dart';
import 'package:crime_detection/windows/liscense_applied.dart';
import 'package:crime_detection/windows/liscense_information.dart';
import 'package:crime_detection/windows/officer_details.dart';
import 'package:crime_detection/windows/police_dashboard.dart';
import 'package:crime_detection/windows/release_order.dart';
import 'package:crime_detection/windows/report_crime.dart';
import 'package:crime_detection/windows/update_station.dart';
import 'package:crime_detection/windows/view_criminal.dart';
import 'package:crime_detection/windows/view_fir.dart';
import 'package:crime_detection/windows/view_liscense.dart';
import 'package:crime_detection/windows/view_officer.dart';
import 'package:crime_detection/windows/view_order.dart';
import 'package:crime_detection/windows/view_station.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // code for initialization of firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // running point for my app
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debug banner will not shown on right side
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // set background color for all screens
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      // call the screen here which you want to run first
      home:  const CivilianDashboard(),
    );
  }
}
