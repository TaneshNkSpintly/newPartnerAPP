import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:partner_app/SCREENS/Login/resetPassword.dart';

import '../../Feature/CongitoService/CongitoService.dart';
import '../../Feature/dashboard/ui/dashboardPage.dart';

//STYLE
var headingStyle = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

var secondHeadStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: Color(0xFF929BA4),
);

var buttonColor = Color(0xFF6DBDF3);
TextEditingController phoneNumberController = TextEditingController();
PhoneNumber? initialPhoneNumber = PhoneNumber(phoneNumber: "777");
String errorLoginMessage = "";
TextEditingController PasswordController = TextEditingController();
bool viewPassword = false;
bool showSignIn = false;
bool phoneNumberValidated = false;
bool passwordValidated = false;
bool _isLoading = false;
var Idtoken;
final AuthService _authService = AuthService();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // phoneNumberController.text = initialPhoneNumber!.phoneNumber ?? '';

    initialPhoneNumber = PhoneNumber(isoCode: 'IN');
    PasswordController.text = "";
    viewPassword = false;
    showSignIn = false;
    phoneNumberValidated = false;
    passwordValidated = false;
    _isLoading = false;
    errorLoginMessage = "";
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Row(
              children: [
                Text(
                  "Welcome",
                  style: headingStyle,
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Enter your Phone and password to log in",
                  style: secondHeadStyle,
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.07,
            ),
            Container(
                // padding: EdgeInsets.all(16.0),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(
                            255, 189, 188, 188), // Adjust the color as needed
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      InternationalPhoneNumberInput(
                        inputDecoration: InputDecoration(
                          labelText: '',
                          border: InputBorder.none, // Remove the bottom border
                        ),
                        initialValue:
                            initialPhoneNumber, // Set your initial country code
                        onInputChanged: (PhoneNumber number) {
                          phoneNumberController.text = number.phoneNumber!;
                          if (phoneNumberController.text.length > 8) {
                            phoneNumberValidated = true;
                            if (passwordValidated) {
                              showSignIn = true;
                            }
                          } else {
                            showSignIn = false;
                          }

                          setState(() {});
                          // Handle phone number input here
                        },
                        spaceBetweenSelectorAndTextField: 0,
                        selectorTextStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(
                            255, 192, 190, 190), // Adjust the color as needed
                      ),
                    ),
                  ),
                  child: TextFormField(
                    obscureText: !viewPassword,
                    controller: PasswordController,
                    onChanged: (Passwordvalue) {
                      if (Passwordvalue.length > 7) {
                        passwordValidated = true;
                        //   phoneNumberValidated = true;
                        if (phoneNumberValidated) {
                          showSignIn = true;
                        }
                      } else {
                        showSignIn = false;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          viewPassword = !viewPassword;
                          setState(() {});
                        },
                        child: Icon(
                          viewPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "$errorLoginMessage",
                  style: TextStyle(color: Colors.red, fontSize: 11),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return RestPassword();
                        },
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(
                        color: Color(0xFF293786),
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  )),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                _isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
                    : GestureDetector(
                        onTap: () async {
                          if (showSignIn) {
                            setState(() {
                              _isLoading = true;
                            });
                            print(
                                "PhoneNumberController number ${phoneNumberController.text} ${PasswordController.text}");
                            try {
                              var session = await _authService.signIn(
                                phoneNumberController.text,
                                PasswordController.text,
                              );
                              // print("abced");
                              if (session != null &&
                                  session.runtimeType == String) {
                                errorLoginMessage = session;
                              }

                              if (session != null &&
                                  session.runtimeType == CognitoUserSession) {
                                Idtoken = session.getIdToken().getJwtToken()!;
                                print("Idtoken: ${Idtoken.length}");
                                FlutterClipboard.copy(Idtoken);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DashBoardPage(),//DashBoardPage(), //DashBoardBackTest DashBoardPage DashBoardTest1(),
                                    settings: RouteSettings(
                                      name: '/dashboard',
                                    ), // Assign a unique route name
                                  ),
                                );
                              } else {
                                setState(() {
                                  // _errorMessage = 'Failed to authenticate.';
                                  // CustomAlertBox.showAlertDialog(
                                  //   context: context,
                                  //   heading: "Error",
                                  //   content: "Failed to authenticate..",
                                  // );
                                  _isLoading = false;
                                });
                              }
                            } catch (e) {
                              print("error");

                              setState(() {
                                // _errorMessage = 'Login failed: $e';
                                // CustomAlertBox.showAlertDialog(
                                //   context: context,
                                //   heading: "Error",
                                //   content: "Invalid Phone Number or Password.",
                                // );

                                _isLoading = false;
                              });
                            }
                            // setState(() {});
                          }
                        },
                        child: Container(
                          width: screenSize.width * 0.9,
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                showSignIn ? buttonColor : Colors.grey.shade300,
                          ),
                          child: Center(
                              child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Color.fromARGB(255, 254, 252, 252),
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )),
                        ),
                      )
              ],
            )),
          ],
        ),
      )),
    );
  }
}
