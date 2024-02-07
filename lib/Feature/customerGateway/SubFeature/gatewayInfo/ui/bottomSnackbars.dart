import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../../../Gobal File/GobalVariable.dart';
import '../../../../customerDoor/SubFeature/editDoor/ui/qrScanDevicePage.dart';

Future showCReplaceDeviceBottomSnackBAR(
    BuildContext context, //void Function() refresh,

    {String message = "x"}) {
  TextEditingController _entryDeviceSerialNoController =
      TextEditingController();
  bool showNextButton = false;
  bool ReplaceButtonPressed = false;

  var result = showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        if (_entryDeviceSerialNoController.text != "") {
          showNextButton = true;
          setState(() {});
        }
        return Container(
          //      margin: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height *
              0.4, // Adjust the height as needed

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              //heading
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Replace Device",
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      '(Entry Device)',
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //content

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ReplaceButtonPressed
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Syncing Device Data from Cloud',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF111827),
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Scanning for device...',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          : GestureDetector(
                              onTap: () async {
                                // ignore: unused_local_variable
                                var result = await Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QRScanDevicePage()));
                                if (result != null && result != "0") {
                                  setState(() {
                                    _entryDeviceSerialNoController.text =
                                        result.toString();
                                  });
                                }
                              },
                              child: Container(
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
                                        enabled: false,
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
                                      ),
                                    ),
                                    Icon(
                                      Icons.qr_code_scanner,
                                      size: 25,
                                      color: primaryButtonColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      //
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              ReplaceButtonPressed
                  ? GestureDetector(
                      onTap: () {
                        //  _timezoneController.text = _selectedTimezone;
                        setState(() {});
                        // refresh();
                        Navigator.of(context).pop(0);
                      },
                      child: Container(
                        //  width: screenSize.width ,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryButtonColor),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Color(0xFFDBDEE7),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //  _timezoneController.text = _selectedTimezone;
                            setState(() {});
                            // refresh();
                            Navigator.of(context).pop(0);
                          },
                          child: Container(
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: primaryButtonColor,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "CLOSE",
                                  style: TextStyle(
                                    color: primaryButtonColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (showNextButton) {
                              ReplaceButtonPressed = true;
                              setState(() {});
                              //
                            }
                          },
                          child: Container(
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: showNextButton
                                    ? primaryButtonColor
                                    : Color(0xFFDBDEE7)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Replace",
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
                      ],
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
  return result;
}

Future showUpdateSoftwareTypeBottomSnackBAR(BuildContext context) {
  List<String> SoftwareList = [
    "16.00.00",
    "16.00.01",
    "16.00.02",
    "16.00.03",
    "16.00.04",
    "16.00.05",
    "16.00.06",
    "16.00.07"
  ];
  int? selectOption;
  var _selectedSoftware;
  bool updateConfirm = false;
  var result = showModalBottomSheet(
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
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Text("Software Firmware",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Current Version',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF929CA4),
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '16.00.01',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: updateConfirm
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Updating Software',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '50% uploaded...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        itemCount: SoftwareList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                  title: Text(SoftwareList[index]),
                                  trailing: Radio<int>(
                                    value: index,
                                    groupValue: selectOption,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectOption = value!;
                                        _selectedSoftware = SoftwareList[index];
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
                  if (updateConfirm) {
                    String TitleMessage =
                        "The device Firmware is updated successfully!";
                    String subTitleMessage = "Process Completed.";
                    // succes remove
                    showSccessBottomSnackBAR(
                        context, TitleMessage, subTitleMessage);
                  } else {
                    updateConfirm = true;
                    setState(() {});
                  }

                  // Navigator.of(context).pop(_selectedFirmware);
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
                        updateConfirm ? "Cancel" : "Confirm",
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
  return result;
}

Future showUpdateFirmwareTypeBottomSnackBAR(BuildContext context) {
  List<String> FirmwareList = [
    "16.00.00",
    "16.00.01",
    "16.00.02",
    "16.00.03",
    "16.00.04",
    "16.00.05",
    "16.00.06",
    "16.00.07"
  ];
  int? selectOption;
  var _selectedFirmware;
  bool updateConfirm = false;
  var result = showModalBottomSheet(
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
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Text("Update Firmware",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Current Version',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF929CA4),
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '16.00.01',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: updateConfirm
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Updating Firmware',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '50% uploaded...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        itemCount: FirmwareList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                  title: Text(FirmwareList[index]),
                                  trailing: Radio<int>(
                                    value: index,
                                    groupValue: selectOption,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectOption = value!;
                                        _selectedFirmware = FirmwareList[index];
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
                  if (updateConfirm) {
                    String TitleMessage =
                        "The device Firmware is updated successfully!";
                    String subTitleMessage = "Process Completed.";
                    // succes remove
                    showSccessBottomSnackBAR(
                        context, TitleMessage, subTitleMessage);
                  } else {
                    updateConfirm = true;
                    setState(() {});
                  }

                  // Navigator.of(context).pop(_selectedFirmware);
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
                        updateConfirm ? "Cancel" : "Confirm",
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
  return result;
}

Future showConfigureDeviceBottomSnackBAR(BuildContext context) {
  var result = showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.4, // Adjust the height as needed
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
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Configuring Device',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Gateway #1 is getting configured...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  // String TitleMessage =
                  //     "The device Firmware is updated successfully!";
                  // String subTitleMessage = "Process Completed.";

                  // var result = showUnsccessBottomSnackBAR(
                  //     context, TitleMessage, subTitleMessage);
                  // if (result == 1) {
                  String TitleMessage = "Configured";
                  String subTitleMessage =
                      "You have successfully configured the Gateway";
                  showSccessBottomSnackBAR(
                      context, TitleMessage, subTitleMessage);
                  //    }

                  setState(() {});

                  // Navigator.of(context).pop(_selectedFirmware);
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryButtonColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Cancel",
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
  return result;
}
