import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partner_app/Feature/customerDevice/SubFeatures/controller/SubFeature/createNewController/ui/createNewControllerPage3.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../../customerDoor/SubFeature/editDoor/ui/qrScanDevicePage.dart';

TextEditingController _doorNameChanel1Controller = TextEditingController();
TextEditingController _doorNameChanel2Controller = TextEditingController();
TextEditingController _entryDeviceSerialNoController = TextEditingController();
TextEditingController _exitDeviceSerialNoController = TextEditingController();
bool _enableChanel1_Controller = false;
bool _enableChanel2_Controller = false;

bool showNextButton = false;
bool showMoreChanel1 = false;
bool showMoreChanel2 = false;
String errorEntryDevice = "inital";
String errorExitDevice = "inital";

String validateSerialNumber(String value, List<String> validationList) {
  if (value.length != 14) {
    return "Serial number doesn't support the configuration";
  }

  String firstFourDigits = value.substring(0, 4);

  if (!validationList.contains(firstFourDigits)) {
    return "Serial number doesn't support the configuration";
  }

  return ""; // Return null to indicate the input is valid
}

class CreateNewControllerPage2 extends StatefulWidget {
  String orgId;
  late int siteIdController;
  late int networkIdController;
  late int installationMethodValue;
  late int configurationValue;
  TextEditingController controllerSerialNoController = TextEditingController();

  CreateNewControllerPage2(
      {super.key,
      required this.orgId,
      required this.controllerSerialNoController,
      required this.siteIdController,
      required this.networkIdController,
      required this.configurationValue,
      required this.installationMethodValue});

  @override
  State<CreateNewControllerPage2> createState() =>
      _CreateNewControllerPage2State();
}

class _CreateNewControllerPage2State extends State<CreateNewControllerPage2> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (_entryDeviceSerialNoController.text != "" &&
            _exitDeviceSerialNoController.text != ""
        //&& _enableAttendenceController.text != ""
        ) {
      showNextButton = true;
      setState(() {});
    }
    showNextButton = true; // removeeeeeeeeeeeeeeeeeeeeeee
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        for (int i = 0; i < 3; i++)
                          Container(
                            height: 6,
                            width: screenSize.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color:
                                  i < 2 ? Color(0xFF6DBDF3) : Color(0xFFEFEBEB),
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
                          'Add New Controller',
                          style: TextStyle(
                              fontFamily: 'Inter',
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
                          'Controller Configuration (2/3)',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          //chanel1
                          Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Color(0xFFEFF6FC),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showMoreChanel1 =
                                                  !showMoreChanel1;
                                            });
                                          },
                                          child: Icon(
                                            showMoreChanel1
                                                ? Icons
                                                    .keyboard_arrow_up_outlined
                                                : Icons
                                                    .keyboard_arrow_down_outlined,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Channel 1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            //   height: 0,
                                          ),
                                        ),
                                        Spacer(),
                                        Transform.scale(
                                          scale: 0.7,
                                          child: Switch(
                                            value: _enableChanel1_Controller,
                                            onChanged: (value) {
                                              setState(() {
                                                _enableChanel1_Controller =
                                                    value;
                                              });
                                            },
                                            inactiveTrackColor:
                                                Color(0xFFB0BEC5),
                                            inactiveThumbColor:
                                                Color(0xFFECEFF1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    if (showMoreChanel1)
                                      Container(
                                        width: screenSize.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            left: BorderSide(
                                              color: Color(0xFFCACEDA),
                                            ),
                                            right: BorderSide(
                                              color: Color(0xFFCACEDA),
                                            ),
                                            bottom: BorderSide(
                                              color: Color(0xFFCACEDA),
                                            ),
                                          ),
                                          // borderRadius: BorderRadius.only(
                                          //   bottomLeft: Radius.circular(10),
                                          //   bottomRight: Radius.circular(10),
                                          // ),
                                        ),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller:
                                                  _doorNameChanel1Controller,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Inter',
                                              ),
                                              decoration: InputDecoration(
                                                labelText: "Door Name 1",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xFFE0E0E0)), // Set the enabled border color to black
                                                ),
                                              ),
                                            ),
                                            //
                                            if (widget.configurationValue != 4)
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Color(
                                                              0xFFE0E0E0))),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller:
                                                            _entryDeviceSerialNoController,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Entry Device',
                                                          // hintText: 'Entry Serial Number',
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          border:
                                                              InputBorder.none,

                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              14),
                                                        ],
                                                        onChanged: (value) {
                                                          List<String>
                                                              listValidateSerialENTRY =
                                                              [
                                                            '1001',
                                                            '1002',
                                                            '1015',
                                                            '101F',
                                                            '1023',
                                                            '1024',
                                                            '1025',
                                                            '1028',
                                                            '1029',
                                                            '1033',
                                                            '1034',
                                                            '1038',
                                                          ];
                                                          errorEntryDevice =
                                                              validateSerialNumber(
                                                                  value,
                                                                  listValidateSerialENTRY);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        // ignore: unused_local_variable
                                                        var result = await Navigator
                                                                .of(context)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        QRScanDevicePage()));
                                                        if (result != null &&
                                                            result != "0") {
                                                          setState(() {
                                                            _entryDeviceSerialNoController
                                                                    .text =
                                                                result
                                                                    .toString();
                                                          });
                                                        }
                                                      },
                                                      child: Icon(
                                                        Icons.qr_code_scanner,
                                                        size: 25,
                                                        color:
                                                            primaryButtonColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (errorEntryDevice != "inital")
                                              Text(
                                                "$errorEntryDevice",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 11),
                                              ),
                                            //
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ]),
                          ),

                          //chanel2
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xFFEFF6FC),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showMoreChanel2 =
                                                  !showMoreChanel2;
                                            });
                                          },
                                          child: Icon(
                                            showMoreChanel2
                                                ? Icons
                                                    .keyboard_arrow_up_outlined
                                                : Icons
                                                    .keyboard_arrow_down_outlined,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Channel 2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            //   height: 0,
                                          ),
                                        ),
                                        Spacer(),
                                        Transform.scale(
                                          scale: 0.7,
                                          child: Switch(
                                            value: _enableChanel2_Controller,
                                            onChanged: (value) {
                                              setState(() {
                                                _enableChanel2_Controller =
                                                    value;
                                              });
                                            },
                                            inactiveTrackColor:
                                                Color(0xFFB0BEC5),
                                            inactiveThumbColor:
                                                Color(0xFFECEFF1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    if (showMoreChanel2)
                                      Container(
                                        width: screenSize.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            left: BorderSide(
                                              color: Color(0xFFCACEDA),
                                            ),
                                            right: BorderSide(
                                              color: Color(0xFFCACEDA),
                                            ),
                                            bottom: BorderSide(
                                              color: Color(0xFFCACEDA),
                                            ),
                                          ),
                                          // borderRadius: BorderRadius.only(
                                          //   bottomLeft: Radius.circular(10),
                                          //   bottomRight: Radius.circular(10),
                                          // ),
                                        ),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller:
                                                  _doorNameChanel1Controller,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Inter',
                                              ),
                                              decoration: InputDecoration(
                                                labelText: "Door Name",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xFFE0E0E0)), // Set the enabled border color to black
                                                ),
                                              ),
                                            ),
                                            //

                                            if (widget.configurationValue != 4)
                                              Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Color(
                                                              0xFFE0E0E0))),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller:
                                                            _exitDeviceSerialNoController,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Exit Device',
                                                          // hintText: 'Entry Serial Number',
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          border:
                                                              InputBorder.none,

                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              14),
                                                        ],
                                                        onChanged: (value) {
                                                          List<String>
                                                              exitValidationList =
                                                              [
                                                            '1001',
                                                            '1002',
                                                            '1015',
                                                            '101F',
                                                            '1023',
                                                            '1024',
                                                            '1025',
                                                            '1028',
                                                            '1029',
                                                            '1033',
                                                            '1034',
                                                            '1038',
                                                          ];
                                                          errorExitDevice =
                                                              validateSerialNumber(
                                                                  value,
                                                                  exitValidationList);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        //   navigation to location page
                                                        var result = await Navigator
                                                                .of(context)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        QRScanDevicePage()));
                                                        if (result != null &&
                                                            result != "0") {
                                                          setState(() {
                                                            _exitDeviceSerialNoController
                                                                    .text =
                                                                result
                                                                    .toString();
                                                          });
                                                        }
                                                      },
                                                      child: Icon(
                                                        Icons.qr_code_scanner,
                                                        size: 25,
                                                        color:
                                                            primaryButtonColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (errorExitDevice != "inital")
                                              Text(
                                                "$errorExitDevice",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 11),
                                              ),
                                            //
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),

                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
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
                          onTap: () {
                            if (showNextButton) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateNewControllerPage3(
                                        orgId: widget.orgId,
                                        controllerSerialNoController:
                                            widget.controllerSerialNoController,
                                        siteIdController:
                                            widget.siteIdController,
                                        networkIdController:
                                            widget.networkIdController,
                                        configurationValue:
                                            widget.configurationValue,
                                        installationMethodValue:
                                            widget.installationMethodValue,
                                        doorNameChanel1Controller:
                                            _doorNameChanel1Controller,
                                        doorNameChanel2Controller:
                                            widget.controllerSerialNoController,
                                        entryDeviceSerialNoController:
                                            _entryDeviceSerialNoController,
                                        exitDeviceSerialNoController:
                                            _exitDeviceSerialNoController,
                                      )));
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
        ],
      ),
    );
  }
}

//
