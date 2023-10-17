import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queueing_system/screens/auth/auth.dart';
import 'package:queueing_system/screens/auth/authenticate.dart';

class StudentSignup extends StatefulWidget {
  const StudentSignup({ Key? key }) : super(key: key);

  @override
  _StudentSignupState createState() => _StudentSignupState();
}
class _StudentSignupState extends State<StudentSignup> {
  var $ScreenHeight,
      $ScreenWidth,
      $Color1_background = const Color(0xff013440),
      $Color2_accent = const Color(0xfffbb245),
      $Color3_text = const Color(0xfff8f8f8),
      $Color4_gray = const Color(0xff9e9e9e);

  final _formKey = GlobalKey<FormState>();
  final AuthFirebase _auth = AuthFirebase();

  String _FirstName = '';
  String _LastName = '';
  String _IDnumber = '';
  String _PhoneNumber = '';
  String _Course = '';
  String _email = '';
  String _password = '';
  String _passwordConfirmation = '';
  
  String _error = '';

  @override
  Widget build(BuildContext context) {
    $ScreenHeight = MediaQuery.of(context).size.height / 100;
    $ScreenWidth = MediaQuery.of(context).size.width / 100;

    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: $ScreenWidth * 100,
            height: $ScreenHeight * 100,
            color: $Color1_background,
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: $ScreenHeight * 18, // 25% of screen height
                      height: $ScreenHeight * 18, // 25% of screen height
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: $ScreenHeight * 1.5,
                    ),
                    Text(
                      'Student sign up',
                      style: GoogleFonts.shipporiAntique(
                        textStyle: TextStyle(
                            color: $Color3_text,
                            decoration: TextDecoration.none,
                            fontSize: $ScreenHeight * 2.5,
                            fontWeight: FontWeight.w600)),
                    ),
                    Text(
                      'Please enter your details.',
                      style: GoogleFonts.shipporiAntique(
                        textStyle: TextStyle(
                          color: $Color2_accent,
                          decoration: TextDecoration.none,
                          fontSize: $ScreenHeight * 1.2,
                          fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(
                      height: $ScreenHeight * 1,
                    ),
                    SizedBox(
                      width: $ScreenWidth * 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: $ScreenWidth * 37,
                            height: $ScreenHeight * 9,
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name',
                                  style: GoogleFonts.shipporiAntique(
                                    textStyle: TextStyle(
                                    color: $Color3_text,
                                    decoration: TextDecoration.none,
                                    fontSize:
                                      $ScreenHeight * 1.5,
                                    )
                                  ),
                                ),
                                SizedBox(
                                  height: $ScreenHeight * .3,
                                ),
                                SizedBox(
                                  height: $ScreenHeight * 6,
                                  child: TextFormField(
                                    validator: (value) => value!.isEmpty ? 'Enter a first name' : null,
                                    onChanged: (value) {
                                      setState(() => _FirstName = value);
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
                                          borderRadius: BorderRadius.circular($ScreenHeight * 1),
                                          borderSide: BorderSide(color: $Color4_gray)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular($ScreenHeight * 1),
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
                          ),
                          SizedBox(
                            width: $ScreenWidth * 37,
                            height: $ScreenHeight * 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: GoogleFonts.shipporiAntique(
                                    textStyle: TextStyle(
                                    color: $Color3_text,
                                    decoration: TextDecoration.none,
                                    fontSize:
                                      $ScreenHeight * 1.5,
                                    )
                                  ),
                                ),
                                SizedBox(
                                  height: $ScreenHeight * .3,
                                ),
                                SizedBox(
                                  height: $ScreenHeight * 6,
                                  child: TextFormField(
                                    validator: (value) => value!.isEmpty ? 'Enter a last name' : null,
                                    onChanged: (value) {
                                      setState(() => _LastName = value);
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
                                            borderRadius: BorderRadius.circular($ScreenHeight * 1),
                                            borderSide: BorderSide(color: $Color4_gray)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular($ScreenHeight * 1),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: $ScreenWidth * 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: $ScreenWidth * 37,
                            height: $ScreenHeight * 9,
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'I.D Number',
                                  style: GoogleFonts.shipporiAntique(
                                    textStyle: TextStyle(
                                    color: $Color3_text,
                                    decoration: TextDecoration.none,
                                    fontSize:
                                      $ScreenHeight * 1.5,
                                    )
                                  ),
                                ),
                                SizedBox(
                                  height: $ScreenHeight * .3,
                                ),
                                SizedBox(
                                  height: $ScreenHeight * 6,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) => value!.isEmpty ? 'Enter an ID number' : null,
                                    onChanged: (value) {
                                      setState(() => _IDnumber = value);
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
                                            borderRadius: BorderRadius.circular($ScreenHeight * 1),
                                            borderSide: BorderSide(color: $Color4_gray)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular($ScreenHeight * 1),
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
                          ),
                          SizedBox(
                            width: $ScreenWidth * 37,
                            height: $ScreenHeight * 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone number',
                                  style: GoogleFonts.shipporiAntique(
                                    textStyle: TextStyle(
                                    color: $Color3_text,
                                    decoration: TextDecoration.none,
                                    fontSize:
                                      $ScreenHeight * 1.5,
                                    )
                                  ),
                                ),
                                SizedBox(
                                  height: $ScreenHeight * .3,
                                ),
                                SizedBox(
                                  height: $ScreenHeight * 6,
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    validator: (value) => value!.isEmpty ? 'Enter a phone number' : null,
                                    onChanged: (value) {
                                      setState(() => _PhoneNumber = value);
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
                                            borderRadius: BorderRadius.circular($ScreenHeight * 1),
                                            borderSide: BorderSide(color: $Color4_gray)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular($ScreenHeight * 1),
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
                          ),
                        ],
                      ),
                    ),
                    //* Course
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Course',
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
                            validator: (value) => value!.isEmpty ? 'Enter a course' : null,
                            onChanged: (value) {
                              setState(() => _Course = value);
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
                    SizedBox(
                      height: $ScreenHeight * 1,
                    ),
                    //* Email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
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
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => value!.isEmpty ? 'Enter a valid email' : null,
                            onChanged: (value) {
                              setState(() => _email = value);
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
                    SizedBox(
                      height: $ScreenHeight * 1,
                    ),
                    //* Create Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create password',
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
                            validator: (value) => value!.isEmpty ? 'Enter a password' : null,
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
                    SizedBox(
                      height: $ScreenHeight * 1,
                    ),
                    //* Password Confirmation
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password Confirmation',
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
                            validator: (value) => value!.isEmpty ? 'Enter a password' : null,
                            onChanged: (value) {
                              setState(() => _passwordConfirmation = value);
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
                    SizedBox(
                      height: $ScreenHeight * 2,
                    ),
                    //* START of Sign In as Student Button
                      SizedBox(
                        width: $ScreenWidth * 80,
                        height: $ScreenHeight * 5.5,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // dynamic result = await _auth.registerEmailAndPassword(_email, _password, _FirstName, _LastName, _IDnumber, _PhoneNumber, _Course);
                              dynamic result = await _auth.registerEmailAndPassword(_email, _password, _FirstName, _LastName, _IDnumber, _PhoneNumber, _Course);
                              if (result == null){
                                setState(() => _error = 'error');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: $Color2_accent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular($ScreenHeight * 1.2)
                            )
                          ),
                          child: Text(
                            'Sign Up as Student',
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
                      //* START of Signup
                      SizedBox(
                        width: $ScreenWidth * 80,
                        height: $ScreenHeight * 3.5,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.shipporiAntique(
                                textStyle: TextStyle(  
                                  height: 1.0,
                                  color: $Color3_text,
                                  decoration: TextDecoration.none,
                                  fontSize: $ScreenHeight * 1.25,
                                  fontWeight: FontWeight.w100)),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Authenticate())),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero
                              ),
                              child: Text(
                                'Login',
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
                      Text(_error)
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}