import 'package:flutter/material.dart';
import 'package:queueing_system/screens/auth/guest_auth.dart';
// import 'package:queueing_system/screens/auth/authenticate.dart';
// import 'package:queueing_system/screens/index/request.dart';
// import 'package:queueing_system/screens/auth/student_signup.dart';

class Wrapper extends StatelessWidget {
const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const GuestAuth();
  }
}