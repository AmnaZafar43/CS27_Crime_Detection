// ignore_for_file: use_build_context_synchronously

import 'package:crime_detection/windows/higher_authority_dashboard.dart';
import 'package:crime_detection/windows/police_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crime_detection/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/toast.dart';
import '../windows/civilian_dashboard.dart';
import '../windows/sign_in.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
    String username,
    String role,
  ) async {
    try {
      print("--> $email");
      print("--> $password");
      print("--> $username");
      print("--> $role");
      print("--> $name");
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Users u = Users(
        email: email,
        password: password,
        name: name,
        userId: user.user!.uid,
        username: username,
        role: role,
        createDate: DateTime.now(),
        updateDate: DateTime.now(),
        active: true,
      );
      await _firebaseFirestore
          .collection('Users')
          .doc(user.user!.uid)
          .set(u.toMap());
    } catch (e) {
      rethrow;
    }
  }

  String validateEmail(BuildContext context, String email) {
    final emailRules = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRules.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return '';
  }

  String validatePassword(BuildContext context, String password) {
    final passwordRules =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (!passwordRules.hasMatch(password)) {
      return 'Password should be 8 digit, uppercase letters';
    }
    return '';
  }

  Future<void> addCriminal(
      BuildContext context,
      String firstName,
      String lastName,
      String age,
      String gender,
      String address,
      String charge,
      DateTime dateTime,
      String wanted) async {
    try {
      // generate unique id
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      // adds the data to firebase with collection name criminals as above written
      await _firebaseFirestore.collection('criminals').doc(id).set({
        // _firstName controller stores the name that is added in the text field
        'First Name': firstName,
        'Last Name': lastName,
        'Age': age,
        'Gender': gender,
        'Address': address,
        'Charge': charge,
        'Date of Imprison': dateTime.toString(),
        'Most Wanted': wanted,
        'id': id,
        // createAt,updateAt,active shows the date and time when table is created and active shows the table is active or in use or not.
        'createAt': DateTime.now(),
        'updateAt': DateTime.now(),
        'active': true,
      });
      Utils().showToast(context, 'Successfully Added');
    } catch (e) {
      // throws exception if data not added successfully
      Utils().showToast(
        context,
        e.toString(),
      );
    }
  }

  Future<void> loginBasedOnRole(BuildContext context) async {
    if (_auth.currentUser == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
      );
    } else {
      final data = await _firebaseFirestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .get();
      if (data['role'] == 'Civilian') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CivilianDashboard(),
          ),
        );
      } else if (data['role'] == 'Police Officer') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PoliceOfficerDashboard(),
          ),
        );
      } else if (data['role'] == 'Higher Authority') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HigherAuthorityDashboard(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('No Page Found'),
              ),
            ),
          ),
        );
      }
    }
  }
}
