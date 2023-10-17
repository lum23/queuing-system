import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseDB {

  final String uid;
  DatabaseDB({ required this.uid });

  final CollectionReference userData = FirebaseFirestore.instance.collection('Users');

  Future createUserData(String FirstName, String LastName, String IDNumber, String PhoneNumber, String Course) async {
    return await userData.doc(uid).set({
      'First Name': FirstName,
      'Last Name': LastName,
      'ID Number': IDNumber,
      'Phone Number': PhoneNumber,
      'Course': Course
    });


  }
}