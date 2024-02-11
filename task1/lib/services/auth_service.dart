import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final AuthService instance = AuthService._();

  AuthService._();

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow; // Let the caller handle the error
    }
  }

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow; // Let the caller handle the error
    }
  }
}
