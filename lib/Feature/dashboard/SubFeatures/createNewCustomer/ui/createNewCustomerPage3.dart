import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../Services/createNewCustomerProvider.dart';
import 'createNewCustomerPage4.dart';

// TextEditingController _partnerAdminNameController = TextEditingController();
// TextEditingController _adminEmailController = TextEditingController();
// TextEditingController _partnerAdminPhoneNumberController =
//     TextEditingController();
List<PartnerAdminData> partnerAdminData = [
  PartnerAdminData(
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    "1",
  ),
  PartnerAdminData(
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    "1",
  ),
  PartnerAdminData(
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    "1",
  ),
  PartnerAdminData(
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    "1",
  ),
  PartnerAdminData(
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    "1",
  ),
];
int partnerDataIndex = 0;
PhoneNumber? initialPhoneNumber;
bool showNextButton = false;
bool showAddButton = false;

class CreateNewCustomerPage3 extends StatefulWidget {
  const CreateNewCustomerPage3({super.key});

  @override
  State<CreateNewCustomerPage3> createState() => _CreateNewCustomerPage3State();
}

class _CreateNewCustomerPage3State extends State<CreateNewCustomerPage3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showNextButton = false;
    initialPhoneNumber = PhoneNumber(isoCode: 'IN');
    for (int index = 0; index <= partnerDataIndex; index++) {
      partnerAdminData[partnerDataIndex].partnerAdminNameController.clear();

      partnerAdminData[partnerDataIndex]
          .partnerAdminPhoneNumberController
          .clear();
      partnerAdminData[partnerDataIndex].adminEmailController.clear();
    }
    partnerDataIndex = 0;
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

    if (partnerAdminData[partnerDataIndex].partnerAdminNameController.text !=
                "" &&
            (partnerAdminData[partnerDataIndex]
                    .partnerAdminPhoneNumberController
                    .text
                    .length >
                8) &&
            (partnerAdminData[partnerDataIndex]
                    .adminEmailController
                    .text
                    .length >
                8)
        //  partnerAdminData[partnerDataIndex].emailError != ""
        //&&
        // partnerDataIndex < 5
        ) {
      showNextButton = true;
      print("xxttyy");
      print(partnerDataIndex);
      if (partnerDataIndex < 4) {
        print("ppooii");
        print(partnerDataIndex);
        showAddButton = true;
      } else {
        print("ppuu");
        print(partnerDataIndex);
        showAddButton = false;
      }

      setState(() {});
    } else {
      print("oooouutttt");
      print(partnerDataIndex);

      showAddButton = false;
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
                              color: i == 3
                                  ? Color(0xFFEFEBEB)
                                  : Color(0xFF6DBDF3),
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
                          ' Partner Admin Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              for (int index = 0;
                                  index <= partnerDataIndex;
                                  index++) ...[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (index != 0 &&
                                          index == partnerDataIndex)
                                        GestureDetector(
                                          onTap: () {
                                            partnerDataIndex--;
                                            setState(() {});
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Image.asset(
                                                  'assets/icon/deleteBinIcon.png', // Replace with your image path
                                                ),
                                              ),
                                              Text(
                                                "Remove",
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 13,
                                                    //fontWeight: FontWeight.w400,
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      TextFormField(
                                        controller: partnerAdminData[index]
                                            .partnerAdminNameController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          labelText: "Partner Admin Name",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Partner Phone Number',
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
                                              onInputChanged:
                                                  (PhoneNumber number) {
                                                partnerAdminData[index]
                                                    .partnerAdminPhoneNumberController
                                                    .text = number.phoneNumber!;
                                                // if (_partnerAdminPhoneNumberController.text.length > 8) {
                                                //   phoneNumberValidated = true;
                                                //   if (passwordValidated) {
                                                //     showSignIn = true;
                                                //   }
                                                // } else {
                                                //   showSignIn = false;
                                                // }

                                                setState(() {});
                                              },
                                              spaceBetweenSelectorAndTextField:
                                                  0,
                                              selectorTextStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      TextFormField(
                                        controller: partnerAdminData[index]
                                            .adminEmailController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          labelText: "Email Address",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E0E0),
                                            ),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            partnerAdminData[index].emailError =
                                                validateEmail(value);
                                          });
                                        },
                                      ),
                                      SizedBox(height: 8),
                                      if (partnerAdminData[index]
                                          .emailError
                                          .isNotEmpty)
                                        Text(
                                          partnerAdminData[index].emailError,
                                          style: TextStyle(color: Colors.red),
                                        ),

                                      //
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                              SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "You can add a maximum of 5 partner admins",
                                        maxLines: 3,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 127, 184, 245),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (showAddButton) {
                                            partnerDataIndex++;
                                          }
                                          print("ghjk:$partnerDataIndex");
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: showAddButton
                                              ? Colors.blue
                                              : Color.fromARGB(
                                                  255, 214, 211, 211),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
                                  .updatePartnerAdminDetails(
                                      partnerAdminData, partnerDataIndex);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateNewCustomerPage4()));
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
                                "NEXT",
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

class PartnerAdminData {
  TextEditingController partnerAdminNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController partnerAdminPhoneNumberController =
      TextEditingController();
  var adminType = "1";
  String emailError = '';

  PartnerAdminData(this.partnerAdminNameController, this.adminEmailController,
      this.partnerAdminPhoneNumberController, this.adminType) {}

  // You can add additional methods or properties as needed
}
