import 'package:firebase_auth/firebase_auth.dart';
import 'package:crime_detection/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Users u = Users(
        name: name,
        userId: user.user!.uid,
        username: username,
        role: role,
        createDate: DateTime.now(),
        updateDate: DateTime.now(),
        active: true,
        email: email,
        password: password,
      );
      await _firebaseFirestore
          .collection('Users')
          .doc(user.user!.uid)
          .set(u.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
