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
      $Color4_gray = const Color(0xff9e9e9e),
      $temp_var = 9.6;

  @override
  Widget build(BuildContext context) {
    $ScreenHeight = MediaQuery.of(context).size.height / 100;
    $ScreenWidth = MediaQuery.of(context).size.width / 100;

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
          backgroundColor: $Color1_background,
          toolbarHeight: 80,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                onPressed: () => $temp_var,
                icon: const Icon(Icons.account_circle))
          ],
          // Adjust the height to your desired value
        ),
        body: SafeArea(
          child: Stepper(
            steps: steps
          )
        ),
      ),
    );
  }
}
