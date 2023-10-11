import 'package:flutter/material.dart';
import 'package:queueing_system/screens/auth/auth.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthFirebase _auth = AuthFirebase();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          width: 200,
          height: 250,
          color: Colors.green,
          child: SizedBox(
            width: 50,
            height: 20,
            child: ElevatedButton(

              onPressed: () async {
                await _auth.signOut();
              },
              child: const Text('logout')
            ),
          ),
        )
      ),
    );
  }
}