import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart' as gsi;


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/user_model.dart';
import '../core/constants/app_constants.dart';

class AuthService {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  final gsi.GoogleSignIn _googleSignIn = gsi.GoogleSignIn(
    clientId: '447317744345-hpqtj4knps9sdm8iq08o437vrqv40fs9.apps.googleusercontent.com',
    scopes: ['email'],
  );




  Stream<User?> get authStateChanges {
    if (Firebase.apps.isEmpty) return Stream.value(null);
    return _auth.authStateChanges();
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

  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (Firebase.apps.isEmpty) return null;
      
      final gsi.GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
 
      final gsi.GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );




      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    if (Firebase.apps.isEmpty) return;
    await _googleSignIn.signOut();
    return _auth.signOut();
  }
}
