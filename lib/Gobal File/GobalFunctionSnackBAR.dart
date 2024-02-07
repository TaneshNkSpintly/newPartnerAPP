import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GobalVariable.dart';

Future showSccessBottomSnackBAR(
    BuildContext context, String TitleMessage, String subTitleMessage,
    {String message = "x", void Function()? refresh}) {
  return showModalBottomSheet(
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
                  // margin: EdgeInsetsDirectional.only(
                  //     // top: 30, bottom: 30,
                  //     start: 15,
                  //     end: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFF74C480),
                        size: 48,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${TitleMessage}",
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
                  if (refresh != null) {
                    refresh();
                  }
                  Navigator.pop(context, 1);
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

Future showUnsccessBottomSnackBAR(
    BuildContext context, //void Function() refresh,
    String TitleMessage,
    String subTitleMessage,
    {String message = "x"}) {
  print("showUnsccessBottomSnackBAR");
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.5, // Adjust the height as needed

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

Future showDeketeBottomSnackBAR(
    BuildContext context, //void Function() refresh,
    String TitleMessage,
    String subTitleMessage,
    {String message = "x"}) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/delete.png', // Adjust the path to your actual image in the assets folder
                        // width: screenSize.height * 0.5,
                        // height: screenSize.height * 0.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${TitleMessage}",
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
                            "No,Later",
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
                      //  _timezoneController.text = _selectedTimezone;

                      // refresh();
                      Navigator.of(context).pop(1);
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
                            "Yes,Delete",
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
