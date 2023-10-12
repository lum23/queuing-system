import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queueing_system/screens/index/reservation_stepper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Scaffold(
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
        child: Container(
          width: $ScreenWidth * 100,
          height: $ScreenHeight * 100,
          color: $Color3_text,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: $ScreenHeight * 3, // Spacing at 2.5% of screen height
                ),
                Container(
                  height: $ScreenHeight * 30, // Height at 25% of screen height
                  width: $ScreenWidth * 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      style: BorderStyle.solid,
                      color: $Color1_background,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: $Color3_text,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: $ScreenHeight *
                            3, // Spacing at 2.5% of screen height
                      ),
                      Text('WELCOME!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.russoOne(
                              textStyle: TextStyle(
                            color: $Color1_background,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight *
                                4, // Font size at 3% of screen height
                          ))),
                      SizedBox(
                        height: $ScreenHeight *
                            3, // Spacing at 2.5% of screen height
                      ),
                      Text('Click Here to get started!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.russoOne(
                              textStyle: TextStyle(
                            color: $Color1_background,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight *
                                3, // Font size at 3% of screen height
                          ))),
                      SizedBox(
                        height: $ScreenHeight * 7,
                      ),
                      SizedBox(
                        width: $ScreenWidth * 45,
                        height: $ScreenHeight * 5,
                        child: ElevatedButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationStepper())),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: $Color2_accent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        $ScreenHeight * 1.2))),
                            child: Text(
                              'NEW TOKEN',
                              style: GoogleFonts.shipporiAntique(
                                  textStyle: TextStyle(
                                      height: 1.0,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontSize: $ScreenHeight * 2,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: $ScreenHeight * 3,
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.amber,
                ),
                //TOKEN GENERATION

                SizedBox(
                  height: $ScreenHeight * 3,
                ),
                for (var i = 0; i < 10; i++) ...[
                  Container(
                    height:
                        $ScreenHeight * 30, // Height at 25% of screen height
                    width: $ScreenWidth * 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: $Color1_background,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: $ScreenHeight *
                              10, // Height at 25% of screen height
                          width: $ScreenWidth * 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: $ScreenHeight *
                                      10, // Height at 25% of screen height
                                  width: $ScreenHeight * 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: $Color3_text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: $ScreenHeight * 0.5,
                        ),
                        Container(
                          height: $ScreenHeight *
                              15, // Height at 25% of screen height
                          width: $ScreenWidth * 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: $Color3_text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: $ScreenHeight * 1,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
