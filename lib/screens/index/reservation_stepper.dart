import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queueing_system/screens/index/edit_profile.dart';

import '../auth/auth.dart';

class ReservationStepper extends StatefulWidget {
  const ReservationStepper({Key? key}) : super(key: key);

  @override
  _ReservationStepperState createState() => _ReservationStepperState();
}


class _ReservationStepperState extends State<ReservationStepper> {
  var $ScreenHeight,
      $ScreenWidth,
      $Color1_background = const Color(0xff013440),
      $Color2_accent = const Color(0xfffbb245),
      $Color3_text = const Color(0xfff8f8f8),
      $Color4_gray = const Color(0xff9e9e9e);

  int _currentStepIndex = 0;

  final AuthFirebase _auth = AuthFirebase();
  
  List<Step> steps = [
    const Step(
      title: Text(''),
      content: Text('Content for Step 1'),
      isActive: true,
    ),
    const Step(
      title: Text(''),
      content: Text('Content for Step 2'),
      isActive: false,
    ),
    const Step(
      title: Text(''),
      content: Text('Content for Step 3'),
      isActive: false,
    ),
  ];

  String getStepText() {
    if (_currentStepIndex == 0) {
      return 'CHOOSE DEPARTMENT';
    } else if (_currentStepIndex == 1) {
      return 'CHOOSE REASONS';
    } else if (_currentStepIndex == 2) {
      return 'CHOOSE OPTION';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    $ScreenHeight = MediaQuery.of(context).size.height / 100;
    $ScreenWidth = MediaQuery.of(context).size.width / 100;

    int _indent = 8;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chosda'),
          backgroundColor: $Color1_background,
          toolbarHeight: 80,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile())),
              icon: const Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {
                _auth.signOut();
              }, 
              icon: Icon(Icons.square)
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: $ScreenHeight * 3,
              ),
              Text(getStepText(),
                  style: GoogleFonts.russoOne(
                      textStyle: TextStyle(
                    color: $Color1_background,
                    decoration: TextDecoration.none,
                    fontSize:
                        $ScreenHeight * 3.2, // Font size at 3% of screen height
                  ))),
              Divider(
                thickness: 4,
                indent: $ScreenWidth * _indent,
                endIndent: $ScreenWidth * _indent,
                color: $Color2_accent
              ),
              Expanded(
                child: Stepper(
                  currentStep: _currentStepIndex,
                  type: StepperType.horizontal,
                  onStepCancel: () {
                    if (_currentStepIndex > 0) {
                      setState(() {
                        _currentStepIndex -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_currentStepIndex < steps.length - 1) {
                      setState(() {
                        _currentStepIndex += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _currentStepIndex = index;
                    });
                  },
                  steps: steps,
                  elevation: 0.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
