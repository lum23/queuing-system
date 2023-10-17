import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queueing_system/screens/auth/auth.dart';
import 'package:queueing_system/screens/auth/guest_auth.dart';
import 'package:queueing_system/screens/auth/student_signup.dart';

import '../wrapper.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  var $ScreenHeight,
      $ScreenWidth,
      $Color1_background = const Color(0xff013440),
      $Color2_accent = const Color(0xfffbb245),
      $Color3_text = const Color(0xfff8f8f8),
      $Color4_gray = const Color(0xff9e9e9e),
      $temp_var = 9.6;

  bool $isSignedIn = false;

  String _username = '';
  String _password = '';
  String _authError = '';

  final AuthFirebase _auth = AuthFirebase();
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    $ScreenHeight = MediaQuery.of(context).size.height / 100;
    $ScreenWidth = MediaQuery.of(context).size.width / 100;


    return Material(
      child: SafeArea(
        child: Container(
          color: $Color1_background,
          child: SingleChildScrollView(
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: $ScreenWidth * 100,
                    height: $ScreenHeight * $temp_var,
                  ),
                  Container(
                    color: Colors.amber,
                    height: $ScreenHeight * 25, // Height at 25% of screen height
                    width: $ScreenHeight * 25, // Width at 25% of screen height
                  ),
                  SizedBox(
                    height: $ScreenHeight * 2.5, // Spacing at 2.5% of screen height
                  ),
                  Text(
                    'Welcome!',
                    style: GoogleFonts.shipporiAntique(
                        textStyle: TextStyle(
                      color: $Color3_text,
                      decoration: TextDecoration.none,
                      fontSize:
                        $ScreenHeight * 3, // Font size at 3% of screen height
                      )
                    )
                  ),
                  Text(
                    'Log in now',
                    style: GoogleFonts.shipporiAntique(
                        textStyle: TextStyle(
                            color: $Color2_accent,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight * 1.7,
                            fontWeight: FontWeight.w100)),
                  ),
                  SizedBox(
                    height: $ScreenHeight * .5,
                  ),
                  SizedBox(
                    height: $ScreenHeight * 2, // Spacing at 2.5% of screen height
                    child: Text(
                      _authError,
                      style: GoogleFonts.shipporiAntique(
                        textStyle: TextStyle(
                        color: Colors.red[400],
                        decoration: TextDecoration.underline,
                        fontSize:
                            $ScreenHeight * 1.4, // Font size at 3% of screen height
                        )
                      ),
                    ),
                  ),
                  //* START OF TEXTFIELDS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: GoogleFonts.shipporiAntique(
                            textStyle: TextStyle(
                          color: $Color3_text,
                          decoration: TextDecoration.none,
                          fontSize:
                              $ScreenHeight * 1.8, // Font size at 3% of screen height
                        )),
                      ),
                      SizedBox(
                        height: $ScreenHeight * .5,
                      ),
                      SizedBox(
                        width: $ScreenWidth * 80,
                        height: $ScreenHeight * 6,
                        child: TextFormField(
                          validator: (value) => value!.isEmpty ? 'Enter a valid email' : null,
                          scrollPadding: const EdgeInsets.only(bottom: 150),
                          onChanged: (value) {
                            setState(() => _username = value);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: $ScreenHeight * 1, horizontal: $ScreenHeight * 1),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular($ScreenHeight * 1),
                              borderSide: const BorderSide(color: Colors.red)
                            ),
                            errorStyle: const TextStyle(
                              fontSize: 12,
                              height: 0.5
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular($ScreenHeight * 1),
                                borderSide: const BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular($ScreenHeight * 1.2),
                                borderSide: BorderSide(color: $Color4_gray)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular($ScreenHeight * 1.2),
                                borderSide: const BorderSide(color: Colors.white)
                            ),
                            isDense: true
                          ),
                          style: TextStyle(
                            color: $Color4_gray
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: GoogleFonts.shipporiAntique(
                            textStyle: TextStyle(
                          color: $Color3_text,
                          decoration: TextDecoration.none,
                          fontSize:
                              $ScreenHeight * 1.8, // Font size at 3% of screen height
                        )),
                      ),
                      SizedBox(
                        height: $ScreenHeight * .5,
                      ),
                      SizedBox(
                        width: $ScreenWidth * 80,
                        height: $ScreenHeight * 6,
                        child: TextFormField(
                          validator: (value) => value!.isEmpty ? 'Enter a valid password' : null,
                          onChanged: (value) {
                            setState(() => _password = value);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: $ScreenHeight * 1, horizontal: $ScreenHeight * 1),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular($ScreenHeight * 1),
                              borderSide: const BorderSide(color: Colors.red)
                            ),
                            errorStyle: const TextStyle(
                              fontSize: 12,
                              height: 0.5
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular($ScreenHeight * 1),
                                borderSide: const BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular($ScreenHeight * 1.2),
                                borderSide: BorderSide(color: $Color4_gray)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular($ScreenHeight * 1.2),
                                borderSide: const BorderSide(color: Colors.white)
                            ),
                            isDense: true
                          ),
                          style: TextStyle(
                            color: $Color4_gray
                          ),
                        ),
                      ),
                    ],
                  ),
                  //* END OF TEXTFIELDS
                  //* START Remember password & Forgot Password
                  SizedBox(
                    width: $ScreenWidth * 80,
                    height: $ScreenHeight * 3.5,
                    // color: Colors.blue[500],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: $ScreenWidth * 40,
                          height: $ScreenHeight * 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: $ScreenWidth * 0.7,
                              ),
                              Transform.scale(
                                scale: $ScreenHeight * 0.08,
                                child: SizedBox(
                                  height: $ScreenWidth * 5,
                                  width: $ScreenWidth * 5,
                                  child: Checkbox(
                                    value: $isSignedIn, 
                                    onChanged: (bool? value) {
                                      setState(() {
                                        $isSignedIn = value!;
                                      });
                                    },
                                    side: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: $ScreenWidth * 0.7,
                              ),
                              Text(
                                'Remember password?',
                                style: GoogleFonts.shipporiAntique(
                                  textStyle: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: $ScreenHeight * 1.25,
                                  fontWeight: FontWeight.w100)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: $ScreenWidth * 40,
                          height: $ScreenHeight * 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => $isSignedIn,
                                child: Text(
                                  'Forgot Password',
                                  style: GoogleFonts.shipporiAntique(
                                    textStyle: TextStyle(  
                                      height: 1.0,
                                      color: $Color2_accent,
                                      decoration: TextDecoration.none,
                                      fontSize: $ScreenHeight * 1.25,
                                      fontWeight: FontWeight.w100)),
                                ),
                              ),
                              SizedBox(
                                width: $ScreenWidth * 0.7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //* END Remember password & Forgot Password
                  SizedBox(
                    height: $ScreenHeight * .7, // Spacing at 0.7% of screen height
                  ),
                  //* START of Sign In Button
                  SizedBox(
                    width: $ScreenWidth * 80,
                    height: $ScreenHeight * 5.5,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.signIn(_username, _password);
                          if (result == null) {
                            setState(() {
                              _authError = 'There\'s an error logging in.';
                            });
                          }
                          else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WillPopScope(child: const Wrapper(), onWillPop: () async => false)));
                          }
                        };
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: $Color2_accent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular($ScreenHeight * 1.2)
                        )
                      ),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.shipporiAntique(
                          textStyle: TextStyle(  
                          height: 1.0,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: $ScreenHeight * 1.8,
                          fontWeight: FontWeight.w600)), 
                      )
                    ),
                  ),
                  //* END of Sign In button
                  SizedBox(
                    height: $ScreenHeight * 2, // Spacing at 2% of screen height
                  ),
                  //* START of Sign In as Guest
                  SizedBox(
                    width: $ScreenWidth * 80,
                    height: $ScreenHeight * 5.5,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WillPopScope(child: const GuestAuth(), onWillPop: () async => false))),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: $Color4_gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular($ScreenHeight * 1.2)
                        )
                      ),
                      child: Text(
                        'Sign in as Guest',
                        style: GoogleFonts.shipporiAntique(
                          textStyle: TextStyle(  
                          height: 1.0,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: $ScreenHeight * 1.8,
                          fontWeight: FontWeight.w600)), 
                      )
                    ),
                  ),
                  //* END of Sign In as Guest
                  SizedBox(
                    height: $ScreenHeight * 1.5, // Spacing at 1.5% of screen height
                  ),
                  //* START of Signup
                  SizedBox(
                    width: $ScreenWidth * 80,
                    height: $ScreenHeight * 3.5,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: GoogleFonts.shipporiAntique(
                            textStyle: TextStyle(  
                              height: 1.0,
                              color: $Color3_text,
                              decoration: TextDecoration.none,
                              fontSize: $ScreenHeight * 1.25,
                              fontWeight: FontWeight.w100)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WillPopScope(child: const StudentSignup(), onWillPop: () async => false))),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.shipporiAntique(
                              textStyle: TextStyle(  
                                height: 1.0,
                                color: $Color2_accent,
                                decoration: TextDecoration.none,
                                fontSize: $ScreenHeight * 1.25,
                                fontWeight: FontWeight.w100),
                              ),
                          ),
                        ),
                      ],
                    )
                  ),
                  //* END of Signup
                  SizedBox(
                    width: $ScreenWidth * 100,
                    height: $ScreenHeight * $temp_var,
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
