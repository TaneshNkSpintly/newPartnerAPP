import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/Feature/customerDevice/SubFeatures/controller/SubFeature/controllerInfo/ui/bottomSnackbars.dart';
import 'package:partner_app/Gobal%20File/GlobalFunctionMessages.dart';
import 'package:partner_app/Gobal%20File/GobalFunctionSnackBAR.dart';
import '../../../../../../../Gobal File/GobalVariable.dart';

class MeshIoInfoInfoPage extends StatefulWidget {
  const MeshIoInfoInfoPage({super.key});

  @override
  State<MeshIoInfoInfoPage> createState() => _MeshIoInfoInfoPageState();
}

class _MeshIoInfoInfoPageState extends State<MeshIoInfoInfoPage> {
  bool showMessage = false;
  var CongigureConfirmation;

  void _showSuccessMessage() {
    setState(() {
      showMessage = true;
    });

    // Set a timer to hide the message after 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        showMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [],
        backgroundColor: themeColor,
        title: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                //open nav bar
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 252, 252, 252),
                size: 25,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'FalconX',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                //open nav bar
              },
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF6E88C9),
                size: 25,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomerBottomOveriewNavigationBarPage(
      //   menuSelected: "Sites",
      // ),
      body: Container(
        height: screenSize.height,
        child: Stack(
          children: [
            Column(children: [
              Container(
                // container a
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: themeColor, // Color(0xFFF5F6FF),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFF768ABC),
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Lake Plaza Office, Goa, India",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //SECTION A
              Container(
                //container1b
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Mesh I/O #1",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    // GestureDetector(
                    //   onTap: () async {
                    //     var Result = await Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => EditDoorPage(),
                    //       ),
                    //     );
                    //     if (Result == 1) {
                    //       _showSuccessMessage();
                    //     }
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.edit,
                    //         size: 14,
                    //         color: Color(0xFF2F3789),
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       Text(
                    //         "Edit",
                    //         style: TextStyle(
                    //             color: Color(0xFF2F3789),
                    //             fontFamily: 'Inter',
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                //container1c
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //DATA container 1
                        ContainerControllerInfo(),
                        ContainerControllerOperation(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //Navigator.of(context).pop();
                  var TitleMessage = "Sure, You want to Delete Controller?";
                  var subTitleMessage =
                      "Deleting the device will detach it from FalconX and Delete all it’s data. Detached device will be available in the detached device tab.";
                  showDeketeBottomSnackBAR(
                      context, //void Function() refresh,
                      TitleMessage,
                      subTitleMessage);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: primaryButtonColor,
                    border: Border.all(
                      color: Color(0xFFF94444),
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/deleteBinIcon.png',
                        height: 20,
                        width: 20,
                        color: Color(0xFFF94444),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Delete Device",
                        style: TextStyle(
                          color: Color(0xFFF94444),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ]),
//

            if (showMessage)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      showMessage = false;
                    });
                  },
                  child: Container(
                    height: 60, // Adjust height as needed
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: SuccessMessage(
                      titleMessage: "Changes saved successfully",
                    ),
                  ),
                ),
              ),

//stack
          ],
        ),
      ),
    );
  }
}

class ContainerControllerInfo extends StatefulWidget {
  const ContainerControllerInfo({super.key});

  @override
  State<ContainerControllerInfo> createState() =>
      _ContainerControllerInfoState();
}

class _ContainerControllerInfoState extends State<ContainerControllerInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFDCDCDC), width: 1),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Network",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        "Lake Plaza Office- First Floor",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Serial Number",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        "432784627836443",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Wifi Connected To",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        "Wifi_Network_1",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),

              //row
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Firmware Version",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        "1.06",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )
              //end column container
            ],
          ),
        ),
      ]),
    );
  }
}

class ContainerControllerOperation extends StatefulWidget {
  const ContainerControllerOperation({super.key});

  @override
  State<ContainerControllerOperation> createState() =>
      _ContainerControllerOperationState();
}

class _ContainerControllerOperationState
    extends State<ContainerControllerOperation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFDCDCDC), width: 1),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(children: [
        GestureDetector(
          onTap: () async {
            // ignore: non_constant_identifier_names
            var ReplaceDeviceConfirmation =
                await showCReplaceDeviceBottomSnackBAR(context);
          },
          child: Container(
            child: Row(
              children: [
                Text(
                  'Replace Device',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF2F3789),
                  size: 25,
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Color(0xFFDBDBDB),
          height: 30,
        ),
        GestureDetector(
          onTap: () async {
            var ReplaceDeviceConfirmation =
                await showUpdateFirmwareTypeBottomSnackBAR(context);
            //  if (ReplaceDeviceConfirmation != null &&
            //                                     ReplaceDeviceConfirmation != "0") {
            //                                   setState(() {
            //                                     _entryDeviceSerialNoController
            //                                             .text =
            //                                         result.toString();
            //                                   });
            //                                 }
          },
          child: Container(
            child: Row(
              children: [
                Text(
                  'Update Firmware',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF2F3789),
                  size: 25,
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Color(0xFFDBDBDB),
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            showConfigureDeviceBottomSnackBAR(context);
          },
          child: Container(
            child: Row(
              children: [
                Text(
                  'Configure Device',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF2F3789),
                  size: 25,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
