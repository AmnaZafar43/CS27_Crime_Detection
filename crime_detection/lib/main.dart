import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/report_crime.dart';
import 'package:crime_detection/windows/sign_in.dart';
import 'package:crime_detection/windows/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: const ReportCrime(),
    );
  }
}
