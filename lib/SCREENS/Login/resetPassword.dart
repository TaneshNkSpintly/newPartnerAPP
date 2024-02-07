import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../Feature/CongitoService/CongitoService.dart';

final AuthService _authService = AuthService();
TextEditingController phoneNumberController = TextEditingController();
PhoneNumber? initialPhoneNumber;

TextEditingController enterOTPController = TextEditingController();
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

class RestPassword extends StatefulWidget {
  const RestPassword({super.key});

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

var index = 0;

class _RestPasswordState extends State<RestPassword> {
  void refreshPage() {
    setState(() {});
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
              height: screenSize.height * 0.05,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create New",
                      style: headingStyle,
                    ),
                    Text(
                      "Password",
                      style: headingStyle,
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            if (index == 0) ...[
              RequestOtp(
                RefreshParent: refreshPage,
              ),
            ] else ...[
              SetNewPassword(
                RefreshParent: refreshPage,
              )
            ],
          ],
        ),
      )),
    );
  }
}

class RequestOtp extends StatefulWidget {
  final Function() RefreshParent;

  const RequestOtp({super.key, required this.RefreshParent});

  @override
  State<RequestOtp> createState() => _RequestOtpState();
}

class _RequestOtpState extends State<RequestOtp>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    initialPhoneNumber = PhoneNumber(isoCode: 'IN');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Enter your phone number!",
              style: secondHeadStyle,
            ),
            Spacer()
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.08,
        ),
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
                  if (phoneNumberController.text.length > 8) {}

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
        SizedBox(
          height: screenSize.height * 0.3,
        ),
        GestureDetector(
          onTap: () {
            _authService.forgotPassword(phoneNumberController.text);
            index = 1;
            widget.RefreshParent();
          },
          child: Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: buttonColor,
            ),
            child: Center(
                child: Text(
              "Next",
              style: TextStyle(
                  color: Color.fromARGB(255, 254, 252, 252),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              "Back",
              style: TextStyle(
                  color: buttonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            )),
          ),
        )
      ],
    ));
  }
}

//            SET NEW PASSWORD

class SetNewPassword extends StatefulWidget {
  final Function() RefreshParent;
  const SetNewPassword({super.key, required this.RefreshParent});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _passwordError = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Text(
          //       "Set New Password",
          //       style: TextStyle(fontSize: 24),
          //     ),
          //     Spacer(),
          //   ],
          // ),
          // SizedBox(
          //   height: screenSize.height * 0.05,
          // ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Otp has been sent to",
                    style: secondHeadStyle,
                  ),
                  Text(
                    "email@gmail.com!",
                    style: secondHeadStyle,
                  ),
                ],
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
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
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color.fromARGB(
                        255, 192, 190, 190), // Adjust the color as needed
                  ),
                ),
              ),
              child: TextField(
                controller: enterOTPController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Spacer(),
              Text(
                "Resend Otp[0:45]",
                style: TextStyle(color: buttonColor, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          _buildPasswordTextField(
            controller: _passwordController,
            labelText: 'Password',
            isObscure: _obscurePassword,
            onChanged: (_) => _validatePasswords(),
          ),
          _buildPasswordTextField(
            controller: _confirmPasswordController,
            labelText: 'Confirm Password',
            isObscure: _obscureConfirmPassword,
            onChanged: (_) => _validatePasswords(),
          ),
          Text(
            _passwordError,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          GestureDetector(
            onTap: () {
              _validatePasswords();
              if (_passwordError.isEmpty) {
                var newpasswardSet = _authService.setNewPassword(
                    phoneNumberController.text,
                    enterOTPController.text,
                    _confirmPasswordController.text);
                print("newpasswardSet$newpasswardSet");
                // Passwords are valid; proceed with your logic.
              }
            },
            child: Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: buttonColor,
              ),
              child: Center(
                child: Text(
                  "CREATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              index = index - 1;
              widget.RefreshParent();
            },
            child: Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isObscure,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isObscure,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ),
          IconButton(
            icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                if (controller == _passwordController) {
                  _obscurePassword = !_obscurePassword;
                } else {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  void _validatePasswords() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.length < 8) {
      setState(() {
        _passwordError = 'Password must be at least 8 characters long.';
      });
    } else if (password != confirmPassword) {
      setState(() {
        _passwordError = 'Passwords do not match.';
      });
    } else {
      setState(() {
        _passwordError = '';
      });
    }
  }
}
