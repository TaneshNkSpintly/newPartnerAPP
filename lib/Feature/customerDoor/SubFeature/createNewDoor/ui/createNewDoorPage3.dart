import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../../../../../Gobal File/gobalconfigData.dart';
import '../../../Services/customerDoorProvider.dart';

TextEditingController _LockingMechanismController = TextEditingController();
TextEditingController RelayOnTimecontroller = TextEditingController();
int? selectedLockingMechanismvalue;

String errorRelayTime = "inital";
bool _isOnInvertRelayLogic = false;

bool showNextButton = false;

class CreateNewDoorPage3 extends StatefulWidget {
  String orgId;
  late TextEditingController doorNameController;
  late int siteIdController;
  late int networkIdController;
  late int installationMethodValue;
  late int configurationValue;
  late TextEditingController entryDeviceSerialNoController;
  late TextEditingController exitDeviceSerialNoController;
  late bool enableAttendenceController;

  CreateNewDoorPage3({
    super.key,
    required this.orgId,
    required this.doorNameController,
    required this.siteIdController,
    required this.networkIdController,
    required this.installationMethodValue,
    required this.configurationValue,
    required this.entryDeviceSerialNoController,
    required this.exitDeviceSerialNoController,
    required this.enableAttendenceController,
  });

  @override
  State<CreateNewDoorPage3> createState() => _CreateNewDoorPage3State();
}

class _CreateNewDoorPage3State extends State<CreateNewDoorPage3> {
  ConfigDetails? configValidation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _LockingMechanismController.clear();
    RelayOnTimecontroller.clear();
    selectedLockingMechanismvalue = null;
    if (widget.installationMethodValue == 1) {
      // new installation

      configValidation = newInstallConfigs.firstWhere(
        (configList) => configList.value == widget.configurationValue,
      );
      print(
          "configValidation 3  found ${configValidation!.validSerials['entry']!.length}");
    } else {
      // retrofite type :1,2

      configValidation = retrofitType1Configs.firstWhere(
        (configList) => configList.value == widget.configurationValue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (_LockingMechanismController.text != "" &&
            RelayOnTimecontroller.text != ""
        //&& _isOnInvertRelayLogic.text != ""
        ) {
      showNextButton = true;
      setState(() {});
    } else {
      showNextButton = false;
      setState(() {});
    }

    if (configValidation!.formOptions["lockingMechanism"] == true &&
        _LockingMechanismController.text != "") {
      print("q");
      if (errorRelayTime == "") {
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
    print(
        "object${configValidation!.formOptions['relayTime']}:${configValidation!.name}");
    if (configValidation!.formOptions["relayTime"] == true &&
        errorRelayTime == "") {
      print("q1");
      if (configValidation!.formOptions["lockingMechanism"] == false ||
          _LockingMechanismController.text != "") {
        showNextButton = true;
        setState(() {});
        print("e1");
      } else {
        showNextButton = false;
        setState(() {});
        print("r1");
      }
    } else {
      showNextButton = false;
      setState(() {});
      print("t1");
    }

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
                                color: Color(0xFF6DBDF3)),
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

                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              if (configValidation!
                                      .formOptions['lockingMechanism'] ==
                                  true)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Locking Mechanism Settings (3/3)',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'This defines the type of lock or opening mechanism you are using with the door.',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF6B7280),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      maxLines: 5,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showLockingMechanismType(
                                            context, refresh);
                                      },
                                      child: TextFormField(
                                        controller: _LockingMechanismController,
                                        enabled: false,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          labelText: 'Locking Mechanism',
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () {
                                              _showLockingMechanismType(
                                                  context, refresh);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              SizedBox(
                                height: 30,
                              ),

                              Text(
                                'Relay Settings',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //  //"Relay On Time",
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    // border: Border(
                                    //   bottom: BorderSide(
                                    //     color: Color(0xFFE0E0E0),
                                    //   ),
                                    //   ),
                                    ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Relay On Time",
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          " Allowed range is 1-240 s",
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    //1
                                    Container(
                                      height: 40,
                                      width: screenSize.width * 0.18,
                                      margin: EdgeInsets.all(3),
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: RelayOnTimecontroller,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                        ),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                          ),
                                          hintText: "0",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFEBEBEB),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: themeColor),
                                          ),
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        onChanged: (value) {
                                          if (value!.isEmpty) {
                                            errorRelayTime =
                                                'Please enter a value.';
                                            return;
                                          }

                                          int intValue = int.parse(value!);
                                          if (intValue > 240) {
                                            print("object");
                                            errorRelayTime =
                                                'Number should not be greater than 240.';
                                            return;
                                          }

                                          errorRelayTime = "";
                                          setState(() {});
                                        },
                                      ),
                                    ),

                                    ///

                                    Text(
                                      " Seconds",
                                      style: TextStyle(
                                          color:
                                              themeColor, // Color(0xFF000000),
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          //fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              if (errorRelayTime != "inital")
                                Text(
                                  "$errorRelayTime",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 11),
                                ),
                              SizedBox(
                                height: 30,
                              ),
                              //
                              if (_LockingMechanismController.text != "")
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xFFE0E0E0),
                                      )),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Invert Relay Logic",
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Spacer(),
                                          Transform.scale(
                                            scale: 0.7,
                                            child: Switch(
                                              value: _isOnInvertRelayLogic,
                                              onChanged: (value) {
                                                setState(() {
                                                  _isOnInvertRelayLogic = value;
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
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Text(
                                          'Enabling this changes the logic of the relay and you’ll have to wire fail-safe locks to NO and fail-secure to NC. This will unlock the doors if the Spintly reader/controller fails.',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF6B7280),
                                              fontSize: 11,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
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
                                          .read(customerDoorProvider.notifier)
                                          .createAccessPointPost(
                                            widget.orgId,
                                            widget.doorNameController.text,
                                            widget.installationMethodValue,
                                            widget.configurationValue,
                                            widget.siteIdController,
                                            widget.networkIdController,
                                            widget.entryDeviceSerialNoController
                                                .text,
                                            widget.exitDeviceSerialNoController
                                                .text,
                                            selectedLockingMechanismvalue,
                                            int.parse(RelayOnTimecontroller.text
                                                .toString()),
                                            _isOnInvertRelayLogic,
                                            widget.enableAttendenceController,
                                          );
                                  print(
                                      "ResultCreateNewDoor==type: ${ResultCreateNewDoor!.type}");
                                  if (ResultCreateNewDoor!.type == "success") {
                                    var Title =
                                        "${widget.doorNameController.text.toString()} Added";
                                    var SubTitle =
                                        "New door ‘${widget.doorNameController.text.toString()}’ has been successfully added in Site ";
                                    await showSccessBottomSnackBAR(
                                        context, Title, SubTitle);
                                  } else if (ResultCreateNewDoor!.type ==
                                      "error") {
                                    String errorMessage = ResultCreateNewDoor
                                        .errorMessage!.errorMessage;
                                    var title = "Couldn't add the Door!";
                                    var subtitle = "$errorMessage";
                                    await showUnsccessBottomSnackBAR(
                                        context, title, subtitle);
                                  }
                                  Navigator.of(context).popUntil((route) =>
                                      route.settings.name == '/BotoomNavBar');
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
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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

void _showLockingMechanismType(BuildContext context, void Function() refresh) {
  List<String> LockingMechanismList = [
    "Door with Mag Lock",
    "Door with Strike Lock",
    "Boom Barrier or Sliding Gate",
    "Flap or Turnstile Barriers",
  ];
  List<int> LockingMechanismvalue = [
    1,
    2,
    3,
    4,
  ];
  int? selectOption;
  var _selectedNewtork;
  var _selectedLockValue;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.5, // Adjust the height as needed
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 2, right: 2),
                    height: 5,
                    width: screenSize.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 219, 219, 225),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Locking Mechanism",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: LockingMechanismList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(LockingMechanismList[index]),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectOption = value!;
                                  _selectedNewtork =
                                      LockingMechanismList[index];
                                  _selectedLockValue =
                                      LockingMechanismvalue[index];
                                });
                              },
                            )),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  _LockingMechanismController.text = _selectedNewtork;
                  selectedLockingMechanismvalue = _selectedLockValue;
                  setState(() {});
                  refresh();
                  Navigator.of(context).pop();
                },
                child: Container(
                  // height: screenSize.height * 0.05,
                  // width: screenSize.width * 0.85,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryButtonColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        );
      });
    },
  );
}
