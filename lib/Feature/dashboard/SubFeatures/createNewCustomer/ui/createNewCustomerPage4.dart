import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../../../Services/dashboardProvider.dart';
import '../Services/createNewCustomerProvider.dart';

TextEditingController _adminNameController = TextEditingController();
TextEditingController _adminPhoneController = TextEditingController();
TextEditingController _adminEmailController = TextEditingController();

String emailError = '';

PhoneNumber? initialPhoneNumber;
bool showNextButton = true;

class CreateNewCustomerPage4 extends StatefulWidget {
  const CreateNewCustomerPage4({super.key});

  @override
  State<CreateNewCustomerPage4> createState() => _CreateNewCustomerPage4State();
}

class _CreateNewCustomerPage4State extends State<CreateNewCustomerPage4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initialPhoneNumber = PhoneNumber(isoCode: 'IN');
    _adminNameController.clear();
    _adminPhoneController.clear();
    _adminEmailController.clear();
    showNextButton = true;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if ((_adminNameController.text == "" &&
            _adminPhoneController.text == "" &&
            _adminEmailController.text == "") ||
        (_adminNameController.text != "" &&
            _adminPhoneController.text != "" &&
            _adminEmailController.text != "")) {
      showNextButton = true;
      setState(() {});
    }

    // else if ((_adminNameController.text != "" &&
    //     _adminPhoneController.text != "" &&
    //     _adminEmailController.text != "")) {
    //   showNextButton = true;
    //   setState(() {});
    // }

    else {
      showNextButton = false;
      setState(() {});
    }
    return Consumer(
      builder: (context, ref, child) {
        final createNewCustomerData = ref.watch(createNewCustomerProvider);
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: screenSize.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 4; i++)
                          Container(
                            height: 6,
                            width: screenSize.width * 0.23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color:
                                  // i == 2 ? Color(0xFFEFEBEB) :
                                  Color(0xFF6DBDF3),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: const Color(0xFF6E88C9),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Create New Customer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Text(
                          'Admin Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '(Optional)',
                          style: TextStyle(
                              color: Color(0xFF929CA4),
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _adminNameController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Admin Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFE0E0E0)), // Set the enabled border color to black
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(
                                        0xFFE0E0E0), // Adjust the color as needed
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
                                      border: InputBorder
                                          .none, // Remove the bottom border
                                    ),
                                    initialValue:
                                        initialPhoneNumber, // Set your initial country code
                                    onInputChanged: (PhoneNumber number) {
                                      _adminPhoneController.text =
                                          number.phoneNumber!;

                                      setState(() {});
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

                            TextFormField(
                              controller: _adminEmailController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Email Adddress",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFE0E0E0)), // Set the enabled border color to black
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  emailError = validateEmail(value);
                                });
                              },
                            ),
                            SizedBox(height: 8),
                            if (emailError.isNotEmpty)
                              Text(
                                emailError,
                                style: TextStyle(color: Colors.red),
                              ),

                            //
                          ],
                        ),
                      ),
                    ),

                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).popUntil(
                                (route) => route.settings.name == '/dashboard');
                          },
                          child: Container(
                            height: screenSize.height * 0.05,
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: primaryButtonColor,
                              border: Border.all(
                                color: primaryButtonColor,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "CANCEL",
                                style: TextStyle(
                                  color: primaryButtonColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //
                        GestureDetector(
                          onTap: () async {
                            if (showNextButton) {
                              var res = await ref
                                  .read(createNewCustomerProvider.notifier)
                                  .updateSuperAdminDetails(
                                      _adminNameController,
                                      _adminPhoneController,
                                      _adminEmailController);
                              MessageResponse? newCustResult = await ref
                                  .read(createNewCustomerProvider.notifier)
                                  .CreateNewCustomerPost();
                              if (newCustResult!.type == "success") {
                                var title = "Customer Created Successfully";
                                var subtitle =
                                    "New Customer ${createNewCustomerData.CustomerName} has been created successfully";
                                await ref
                                    .read(dashboardProvider.notifier)
                                    .fetchOrganisationDetails();
                                await showSccessBottomSnackBAR(
                                    context, title, subtitle,
                                    refresh: refresh);
                              } else if (newCustResult!.type == "error") {
                                String errorMessage =
                                    newCustResult.errorMessage!.errorMessage;
                                var title = "Couldn't Create new Customer!";
                                var subtitle = "$errorMessage";
                                await showUnsccessBottomSnackBAR(
                                    context, title, subtitle);
                              }
                              print("before unit");
                              Navigator.of(context).popUntil((route) =>
                                  route.settings.name == '/dashboard');
                              print("after unit");
                            }
                          },
                          child: Container(
                            height: screenSize.height * 0.05,
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: showNextButton
                                  ? primaryButtonColor
                                  : Color(0xFFDBDEE7),
                            ),
                            child: Center(
                              child: Text(
                                "CREATE",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}

//
