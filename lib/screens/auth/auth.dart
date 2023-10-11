import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queueing_system/models/student.dart';

class AuthFirebase{

  // ignore: unused_field
  final FirebaseAuth _authen = FirebaseAuth.instance;

  // User _userFromFireBase(User user) {
  //   return user != null ? Student(uid: user.uid) : null;
  // }
  //* Signin Guest
  Future signInGuest() async {
    try {
      UserCredential result = await _authen.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //* Signin email, pass
  Future signIn(String email, String password) async {
    // try{
    //   AuthRes
    // }
  }
  //* Signup

  //* Signout
  
}