import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queueing_system/screens/index/edit_profile.dart';
import 'package:queueing_system/screens/wrapper.dart';

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
  int _chosenDepartment = -1;
  int _chosenReason = -1;
  int _chosenOption = -1;

  final AuthFirebase _auth = AuthFirebase();

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

    int indent = 8;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chosda'),
          backgroundColor: $Color1_background,
          toolbarHeight: 80,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditProfile())),
              icon: const Icon(Icons.account_circle),
            ),
            IconButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Wrapper()));
                },
                icon: const Icon(Icons.square))
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
                  indent: $ScreenWidth * indent,
                  endIndent: $ScreenWidth * indent,
                  color: $Color2_accent),
              EasyStepper(
                activeStep: _currentStepIndex,
                lineStyle: LineStyle(
                    lineType: LineType.normal,
                    lineThickness: 4,
                    defaultLineColor: $Color1_background),
                internalPadding: 0,
                //* COLORS
                activeStepBackgroundColor: $Color1_background,
                borderThickness: 5,
                defaultStepBorderType: BorderType.normal,
                activeStepBorderColor: $Color1_background,
                unreachedStepBorderColor: $Color1_background,
                showLoadingAnimation: false,
                steps: [
                  EasyStep(
                      customStep: Text('1',
                          style: GoogleFonts.russoOne(
                              textStyle: TextStyle(
                            color: _currentStepIndex == 0
                                ? $Color3_text
                                : $Color1_background,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight * 3.5,
                          )))),
                  EasyStep(
                      customStep: Text('2',
                          style: GoogleFonts.russoOne(
                              textStyle: TextStyle(
                            color: $Color1_background,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight * 3.5,
                          )))),
                  EasyStep(
                      customStep: Text('3',
                          style: GoogleFonts.russoOne(
                              textStyle: TextStyle(
                            color: $Color1_background,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight * 3.5,
                          )))),
                ],
                
              ),
              // if (_currentStepIndex == 0) ...[
              //   custom
              // ]
            ],
          ),
        ),
      ),
    );
  }
}
