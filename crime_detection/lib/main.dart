import 'package:crime_detection/windows/add_criminal.dart';
import 'package:crime_detection/windows/add_officer.dart';
import 'package:crime_detection/windows/add_police_station.dart';
import 'package:crime_detection/windows/civilian_dashboard.dart';
import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/officer_details.dart';
import 'package:crime_detection/windows/view_criminal.dart';
import 'package:crime_detection/windows/view_officer.dart';
import 'package:crime_detection/windows/view_station.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: ViewStation(),
    );
  }
}
