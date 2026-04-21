import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../core/constants/app_constants.dart';

class PresenceService {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  FirebaseAuth get _auth => FirebaseAuth.instance;

  void updateUserPresence() {
    if (Firebase.apps.isEmpty) return;
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final userDoc = _firestore.collection(AppConstants.usersCollection).doc(uid);

    userDoc.update({
      'isOnline': true,
      'lastSeen': FieldValue.serverTimestamp(),
    }).catchError((e) => null);

  }

  void setUserOffline() {
    if (Firebase.apps.isEmpty) return;
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    _firestore.collection(AppConstants.usersCollection).doc(uid).update({
      'isOnline': false,
      'lastSeen': FieldValue.serverTimestamp(),
    }).catchError((e) => null);

  }

  Stream<DocumentSnapshot>? getUserPresence(String uid) {
    if (Firebase.apps.isEmpty) return null;
    return _firestore.collection(AppConstants.usersCollection).doc(uid).snapshots();
  }
}
