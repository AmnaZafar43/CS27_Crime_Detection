import 'package:crime_detection/windows/add_criminal.dart';
import 'package:crime_detection/windows/add_officer.dart';
import 'package:crime_detection/windows/add_police_station.dart';
import 'package:crime_detection/windows/civilian_added.dart';
import 'package:crime_detection/windows/civilians.dart';
import 'package:crime_detection/windows/cover_page.dart';
import 'package:crime_detection/windows/crime_type.dart';
import 'package:crime_detection/windows/criminal_added.dart';
import 'package:crime_detection/windows/give_information.dart';
import 'package:crime_detection/windows/liscense_applied.dart';
import 'package:crime_detection/windows/liscense_information.dart';
import 'package:crime_detection/windows/officer_added.dart';
import 'package:crime_detection/windows/order_released.dart';
import 'package:crime_detection/windows/police_station_added.dart';
import 'package:crime_detection/windows/release_order.dart';
import 'package:crime_detection/windows/report_added.dart';
import 'package:crime_detection/windows/report_crime.dart';
import 'package:crime_detection/windows/report_details.dart';
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
      home: const OrderReleased(),
    );
  }
}
