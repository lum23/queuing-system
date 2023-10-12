import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    $ScreenHeight = MediaQuery.of(context).size.height / 100;
    $ScreenWidth = MediaQuery.of(context).size.width / 100;

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chosda'),
          backgroundColor: $Color1_background,
          toolbarHeight: 80,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () => $ScreenHeight,
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text('asdada'),
              Stepper(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}