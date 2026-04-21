import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/user_model.dart';
import '../core/constants/app_constants.dart';

class AuthService {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  Stream<User?> get authStateChanges {
    if (Firebase.apps.isEmpty) return Stream.value(null);
    return _auth.authStateChanges();
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    // --- Mock Auth Mode for Development ---
    if (phoneNumber == "+923001234567") {
      await Future.delayed(const Duration(seconds: 1));
      codeSent("mock_verification_id", 123456);
      return;
    }
    // ---------------------------------------

    if (Firebase.apps.isEmpty) return;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<UserCredential?> signInWithCredential(PhoneAuthCredential credential) {
    // --- Mock Auth Mode for Development ---
    if (credential.verificationId == "mock_verification_id" && credential.smsCode == "123456") {
      return Future.value(null); // Return null or a mock UserCredential
    }
    // ---------------------------------------

    if (Firebase.apps.isEmpty) return Future.value(null);
    return _auth.signInWithCredential(credential);
  }

  Future<void> saveUserData(UserModel user) async {
    if (Firebase.apps.isEmpty) return;
    await _firestore
        .collection(AppConstants.usersCollection)
        .doc(user.uid)
        .set(user.toJson());
  }

  Future<UserModel?> getUserData(String uid) async {
    if (Firebase.apps.isEmpty) return null;
    final doc = await _firestore.collection(AppConstants.usersCollection).doc(uid).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    }
    return null;
  }

  Future<void> signOut() async {
    if (Firebase.apps.isEmpty) return;
    return _auth.signOut();
  }
}
