import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../../../../../Gobal File/gobalconfigData.dart';
import '../../../Services/customerDoorProvider.dart';
import '../../editDoor/ui/qrScanDevicePage.dart';
import 'createNewDoorPage3.dart';

TextEditingController _doorNameController = TextEditingController();
TextEditingController _entryDeviceSerialNoController = TextEditingController();
TextEditingController _exitDeviceSerialNoController = TextEditingController();
bool _enableAttendenceController = false;

bool showNextButton = false;

class CreateNewDoorPage2 extends StatefulWidget {
  String orgId;
  TextEditingController doorNameController = TextEditingController();
  late int siteIdController;
  late int networkIdController;
  late int installationMethodValue;
  late int configurationValue;

  CreateNewDoorPage2({
    super.key,
    required this.orgId,
    required this.doorNameController,
    required this.siteIdController,
    required this.networkIdController,
    required this.installationMethodValue,
    required this.configurationValue,
  });

  @override
  State<CreateNewDoorPage2> createState() => _CreateNewDoorPage2State();
}

class _CreateNewDoorPage2State extends State<CreateNewDoorPage2> {
  ConfigDetails? configValidation;
  String errorEntryDevice = 'inital';
  String errorExitDevice = 'inital';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showNextButton = false;
    _entryDeviceSerialNoController.clear();
    _exitDeviceSerialNoController.clear();
    if (widget.installationMethodValue == 1) {
      // new installation

      configValidation = newInstallConfigs.firstWhere(
        (configList) => configList.value == widget.configurationValue,
      );
      print(
          "configValidation  found ${configValidation!.validSerials['entry']!.length}");
    } else {
      // retrofite type :1,2

      configValidation = retrofitType1Configs.firstWhere(
        (configList) => configList.value == widget.configurationValue,
      );
      print("retrofite configValidation  found ${configValidation!.name}");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (configValidation!.formOptions["entry"] == true &&
        (errorEntryDevice == "" && errorEntryDevice != "inital")) {
      print("q$errorEntryDevice");
      if (configValidation!.formOptions["exit"] == false) {
        showNextButton = true;
        setState(() {});
        print("w1xfrompage2");
      } else if (errorExitDevice == "") {
        showNextButton = true;
        setState(() {});
        print("e");
      } else {
        showNextButton = false;
        setState(() {});
        print("r");
      }
    } else {
      showNextButton = false;
      setState(() {});
      print("t");
    }
    //
    if (configValidation!.formOptions["exit"] == true &&
        (errorExitDevice == "" && errorExitDevice != "inital")) {
      if (configValidation!.formOptions["entry"] == true) {
        showNextButton = true;
        setState(() {});
      } else if (errorEntryDevice == "") {
        showNextButton = true;
        setState(() {});
      } else {
        showNextButton = false;
        setState(() {});
      }
    } else if (configValidation!.formOptions["exit"] == true) {
      showNextButton = false;
      setState(() {});
    }
    // if (_entryDeviceSerialNoController.text != "" &&
    //     _exitDeviceSerialNoController.text != "") {
    //   showNextButton = true;
    //   setState(() {});
    // }

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
                              color: i != 2
                                  ? Color(0xFF6DBDF3)
                                  : Color(0xFFEFEBEB),
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
                          'Add New Door',
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
                          'Door Details (2/3)',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            if (configValidation!.formOptions["entry"] == true)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Color(0xFFE0E0E0))),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _entryDeviceSerialNoController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          labelText: 'Entry Device',
                                          // hintText: 'Entry Serial Number',
                                          enabledBorder: InputBorder.none,
                                          border: InputBorder.none,

                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(14),
                                        ],
                                        onChanged: (value) {
                                          errorEntryDevice =
                                              validateSerialNumber(
                                                  value,
                                                  configValidation!
                                                      .validSerials['entry']!);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        // ignore: unused_local_variable
                                        var result = await Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    QRScanDevicePage()));
                                        if (result != null && result != "0") {
                                          setState(() {
                                            _entryDeviceSerialNoController
                                                .text = result.toString();
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.qr_code_scanner,
                                        size: 25,
                                        color: primaryButtonColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (errorEntryDevice != "inital")
                              Text(
                                "$errorEntryDevice",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 11),
                              ),

                            if (configValidation!.formOptions["exit"] == true)
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Color(0xFFE0E0E0))),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _exitDeviceSerialNoController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          labelText: 'Exit Device',
                                          // hintText: 'Entry Serial Number',
                                          enabledBorder: InputBorder.none,
                                          border: InputBorder.none,

                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(14),
                                        ],
                                        onChanged: (value) {
                                          errorExitDevice =
                                              validateSerialNumber(
                                                  value,
                                                  configValidation!
                                                      .validSerials['exit']!);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        //   navigation to location page
                                        var result = await Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    QRScanDevicePage()));
                                        if (result != null && result != "0") {
                                          setState(() {
                                            _exitDeviceSerialNoController.text =
                                                result.toString();
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.qr_code_scanner,
                                        size: 25,
                                        color: primaryButtonColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (errorExitDevice != "inital")
                              Text(
                                "$errorExitDevice",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 11),
                              ),

                            SizedBox(
                              height: 10,
                            ),
                            if (configValidation!
                                    .formOptions["attendanceAvailable"] ==
                                true)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xFFE0E0E0)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Enable Attendence',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: 0.7,
                                      child: Switch(
                                        value: _enableAttendenceController,
                                        onChanged: (value) {
                                          setState(() {
                                            _enableAttendenceController = value;
                                          });
                                        },
                                        inactiveTrackColor: Color(0xFFB0BEC5),
                                        inactiveThumbColor: Color(0xFFECEFF1),
                                      ),
                                    ),
                                  ],
                                ),
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
                            Navigator.of(context).popUntil((route) =>
                                route.settings.name == '/BotoomNavBar');
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
                        configValidation!.formOptions["lockingMechanism"] ==
                                    false &&
                                configValidation!.formOptions["relayTime"] ==
                                    false
                            ?
                            //cretae new door
                            Consumer(
                                builder: (context, ref, child) {
                                  final customerDoorData =
                                      ref.watch(customerDoorProvider);

                                  // final dashboardData = ref.watch(dashboardProvider);

                                  return GestureDetector(
                                    onTap: () async {
                                      if (showNextButton) {
                                        MessageResponse? ResultCreateNewDoor =
                                            await ref
                                                .read(customerDoorProvider
                                                    .notifier)
                                                .createAccessPointPost(
                                                  widget.orgId,
                                                  widget
                                                      .doorNameController.text,
                                                  widget
                                                      .installationMethodValue,
                                                  widget.configurationValue,
                                                  widget.siteIdController,
                                                  widget.networkIdController,
                                                  _entryDeviceSerialNoController
                                                      .text,
                                                  _exitDeviceSerialNoController
                                                      .text,
                                                  selectedLockingMechanismvalue,
                                                  0, //RelayOnTimecontroller
                                                  false, //_isOnInvertRelayLogic,
                                                  _enableAttendenceController,
                                                );
                                        print(
                                            "ResultCreateNewDoor==type: ${ResultCreateNewDoor!.type}");
                                        if (ResultCreateNewDoor!.type ==
                                            "success") {
                                          var Title =
                                              "${widget.doorNameController.text.toString()} Added";
                                          var SubTitle =
                                              "New door ‘${widget.doorNameController.text.toString()}’ has been successfully added in Site ";
                                          await showSccessBottomSnackBAR(
                                              context, Title, SubTitle);
                                        } else if (ResultCreateNewDoor!.type ==
                                            "error") {
                                          String errorMessage =
                                              ResultCreateNewDoor
                                                  .errorMessage!.errorMessage;
                                          var title = "Couldn't add the Door!";
                                          var subtitle = "$errorMessage";
                                          await showUnsccessBottomSnackBAR(
                                              context, title, subtitle);
                                        }
                                        Navigator.of(context).popUntil(
                                            (route) =>
                                                route.settings.name ==
                                                '/BotoomNavBar');
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
                                          "ADD DOOR",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )

                            //next button
                            : GestureDetector(
                                onTap: () {
                                  if (showNextButton) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateNewDoorPage3(
                                                  orgId: widget.orgId,
                                                  doorNameController:
                                                      widget.doorNameController,
                                                  siteIdController:
                                                      widget.siteIdController,
                                                  networkIdController: widget
                                                      .networkIdController,
                                                  installationMethodValue: widget
                                                      .installationMethodValue,
                                                  configurationValue:
                                                      widget.configurationValue,
                                                  entryDeviceSerialNoController:
                                                      _entryDeviceSerialNoController,
                                                  exitDeviceSerialNoController:
                                                      _exitDeviceSerialNoController,
                                                  enableAttendenceController:
                                                      _enableAttendenceController,
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
