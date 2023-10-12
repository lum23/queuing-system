import 'package:flutter/material.dart';
import 'package:queueing_system/screens/auth/auth.dart';
import 'package:queueing_system/screens/index/edit_profile.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthFirebase _auth = AuthFirebase();

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: EditProfile()
            // child: ElevatedButton(

            //   onPressed: () async {
            //     await _auth.signOut();
            //   },
            //   child: const Text('logout')
            // ),
        )
    );
  }
}