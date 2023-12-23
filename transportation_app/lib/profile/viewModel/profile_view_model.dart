import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(String name, String surname, String nickname, String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'name': name,
      'surname': surname,
      'nickname': nickname,
      // Diğer kullanıcı bilgileri
    });
  }
}