import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/user.dart';

class AuthServices {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    // Future это тоже самое что асинк евеит жаваскрипт
    try {
      AuthResult result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFireBase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    // Future это тоже самое что асинк евеит жаваскрипт
    try {
      AuthResult result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFireBase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logout() async {
    await _fAuth.signOut();
  }

  Stream<User> get currentUser {
    return _fAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user != null ? User.fromFirebase(user) : null);
  }
}
