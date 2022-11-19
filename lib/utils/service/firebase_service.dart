import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  late final FirebaseAuth firebaseAuth;
  late final FirebaseFirestore firestore;
  late final FirebaseStorage database;

  FirebaseService() {
    firebaseAuth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    database = FirebaseStorage.instance;
  }
}
