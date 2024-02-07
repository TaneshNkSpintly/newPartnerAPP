import 'package:flutter/material.dart';
import 'package:partner_app/Gobal%20File/GobalFunctionSnackBAR.dart';

import '../../../Gobal File/GobalVariable.dart';

Future showCongigureDoorBottomSnackBAR(
    BuildContext context, //void Function() refresh,

    {String message = "x"}) {
  int selectedContainer = 0;
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
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Configure Door #1",
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ),

              //content

              Expanded(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 5, start: 15, end: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Select the device to configure first:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContainer = 0;
                              });
                            },
                            child: Container(
                              width: screenSize.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: selectedContainer == 0
                                      ? primaryButtonColor
                                      : Color(0xFFBDC7D9),
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  child: Row(
                                    children: [
                                      Text(
                                        "ENTRY",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: selectedContainer == 0
                                              ? FontWeight.w500
                                              : FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Radio(
                                        value: 0,
                                        groupValue: selectedContainer,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedContainer = value as int;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContainer = 1;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              width: screenSize.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: selectedContainer == 1
                                      ? primaryButtonColor
                                      : Color(0xFFBDC7D9),
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  child: Row(
                                    children: [
                                      Text(
                                        "EXIT",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: selectedContainer == 1
                                              ? FontWeight.w500
                                              : FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Radio(
                                        value: 1,
                                        groupValue: selectedContainer,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedContainer = value as int;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // width: screenSize.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFEFF6FC)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: Center(
                          child: Text(
                            "Hold your phone close to the Exit Device until configuration complete.",
                            maxLines: 5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      //  _timezoneController.text = _selectedTimezone;
                      setState(() {});
                      // refresh();
                      Navigator.of(context).pop(0);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
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
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();

                      if (selectedContainer == 0)
                        showScaningDoorBottomSnackBAR(context, "Entry");
                      else
                        showScaningDoorBottomSnackBAR(context, "Exit");
                      // showCongigureDoorBottomSnackBAR(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryButtonColor),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "CONFIGURE",
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

Future showScaningDoorBottomSnackBAR(
    BuildContext context, String DeviceName, //void Function() refresh,

    {String message = "x"}) {
  int selectedContainer = 0;
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

              //content

              Expanded(
                child: Container(
                  width: screenSize.width,
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 5, start: 15, end: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text(
                        "Scanning for the $DeviceName Device",
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Searching...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  //  _timezoneController.text = _selectedTimezone;
                  var title = "Oops...";
                  var subtitle =
                      "It looks like the configuration failed. You have to be close to device while its powered on.";

                  Navigator.of(context).pop();
                  var result = showAlert2_BottomSnackBAR(
                      context, title, subtitle, DeviceName);
                  setState(() {});
                  // refresh();
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

void showAlert2_BottomSnackBAR(
    BuildContext context, //void Function() refresh,
    String TitleMessage,
    String subTitleMessage,
    String DeviceName,
    {String message = "x"}) {
  print("showAlert2_BottomSnackBAR");
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

              //content

              Expanded(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 20, bottom: 20, start: 15, end: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/alert.png', // Adjust the path to your actual image in the assets folder
                        width: 60.0,
                        height: 60.0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${TitleMessage}",
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$subTitleMessage",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  //  _timezoneController.text = _selectedTimezone;
                  setState(() {});
                  // refresh();
                  Navigator.of(context).pop();
                  showCongfiguringDoorBottomSnackBAR(
                    context,
                    DeviceName,
                  );
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
                        "Okay",
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

Future showCongfiguringDoorBottomSnackBAR(
    BuildContext context, String DeviceName, //void Function() refresh,

    {String message = "x"}) {
  //NOTE DEFINE IN PARENT CLASS
  void refresh() {
    // setState(() {});
  }
  int selectedContainer = 0;
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

              //content

              Expanded(
                child: Container(
                  width: screenSize.width,
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 5, start: 15, end: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$DeviceName device is getting configured,",
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
                        "Please wait",
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Searching...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  //  _timezoneController.text = _selectedTimezone;
                  var title =
                      "Entry device of Door #1 configured successfully.";
                  var subtitle =
                      "You successfully configured the entry device of Door #1";

                  Navigator.of(context).pop();
                  showSccessBottomSnackBAR(
                      context, //void Function()

                      title,
                      subtitle,
                      refresh: refresh);
                  setState(() {});
                  // refresh();
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  //  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryButtonColor,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "CACEL",
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
