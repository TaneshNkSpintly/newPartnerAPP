import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/customerDoor/Model/accessPointList_Model.dart';
import 'package:partner_app/Feature/customerDoor/Services/customerDoorProvider.dart';
import 'package:partner_app/Gobal%20File/GlobalFunctionMessages.dart';
import 'package:partner_app/Gobal%20File/GobalFunctionSnackBAR.dart';
import 'package:partner_app/Gobal%20File/gobalconfigData.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../../editDoor/ui/editDoorPage.dart';
import '../../../ui/bottomSnackbars.dart';

class DoorInfoPage extends StatefulWidget {
  int doorAccesspointID;
   DoorInfoPage({super.key,required this.doorAccesspointID});

  @override
  State<DoorInfoPage> createState() => _DoorInfoPageState();
}

class _DoorInfoPageState extends State<DoorInfoPage> {
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
     return Consumer(
      builder: (context, ref, child) {
        // if (initFetch) {
        //   initsta(ref);

        //   initFetch = false;
        // }
          final customerDoorData = ref.watch(customerDoorProvider);

  AccessPointListModel? selectedDoorData;


  selectedDoorData = customerDoorData.accessPointList?.firstWhere(
    (siteList) => siteList.siteId == widget.doorAccesspointID,
  );

  print("ghahg:${selectedDoorData!.name}");

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
                          "Door #1",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            var Result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditDoorPage(),
                              ),
                            );
                            if (Result == 1) {
                              _showSuccessMessage();
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 14,
                                color: Color(0xFF2F3789),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    color: Color(0xFF2F3789),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
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
                            ContainerDoorInfo( selectedDoorData:selectedDoorData),
                            ContainerReaderInfo(selectedDoorData: selectedDoorData,),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //Navigator.of(context).pop();
                                    var TitleMessage = "Delete Door?";
                                    var subTitleMessage =
                                        "Are you sure you want to delete this door ? This will detach it from Falcon X and delete all it’s data. Detached devices will be available in the detached devices tab.";
                                    showDeketeBottomSnackBAR(
                                        context, //void Function() refresh,
                                        TitleMessage,
                                        subTitleMessage);
                                  },
                                  child: Container(
                                    height: screenSize.height * 0.05,
                                    width: screenSize.width * 0.4,
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
                                          "Delete Door",
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
                                //
                                GestureDetector(
                                  onTap: () async {
                                    CongigureConfirmation =
                                        await showCongigureDoorBottomSnackBAR(
                                            context);
                                  },
                                  child: Container(
                                    height: screenSize.height * 0.05,
                                    width: screenSize.width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: primaryButtonColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icon/configure.png',
                                          height: 20,
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Configure Device",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
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
                      ),
                    ),
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
    );
  }
}

class ContainerDoorInfo extends StatefulWidget {

  AccessPointListModel selectedDoorData;
   ContainerDoorInfo({super.key,required this.selectedDoorData });

  @override
  State<ContainerDoorInfo> createState() => _ContainerDoorInfoState();
}

class _ContainerDoorInfoState extends State<ContainerDoorInfo> {
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
                        "${widget.selectedDoorData.networkName}",
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
                        "Installation Method",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        "${installMethodTypeGolbal[widget.selectedDoorData.installationMethod-1]}",
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
                        "Configuration",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                         "${configurationTypeGolbal[widget.selectedDoorData.configuration-1]}",
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
                        "Locking Mechanism",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                       "${LockingMechanismGolbal[widget.selectedDoorData.lockingMechanism-1]}",
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
                        "Invert Relay Logic",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(widget.selectedDoorData.relaySettings.invertRelayLogic==true?
                            "Yes":"No",
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
                        "Relay on Time",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        "${widget.selectedDoorData.relaySettings.relayOnTime} Seconds",
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
              ),
              //row
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Attendance",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C82)),
                      ),
                      Text(
                        widget.selectedDoorData.enableAttendance==1?
                        "Enabled":"Disable",
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

class ContainerReaderInfo extends StatefulWidget {
  
  AccessPointListModel selectedDoorData;
   ContainerReaderInfo({super.key,required this.selectedDoorData});

  @override
  State<ContainerReaderInfo> createState() => _ContainerReaderInfoState();
}

class _ContainerReaderInfoState extends State<ContainerReaderInfo> {
  var viewRederDetails = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEFF6FC), width: 1),
        color: Color(0xFFEFF6FC),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Readers:20",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  viewRederDetails = !viewRederDetails;
                  setState(() {});
                },
                child: Row(
                  children: [
                    Text(
                      viewRederDetails ? "Hide Details" : "View Details",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F3789),
                      ),
                    ),
                    Icon(
                      viewRederDetails
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Color(0xFF6E88C9),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),

          //CONTAINERS Reader
          if (viewRederDetails)
            for (int index = 0; index < widget.selectedDoorData.devices.length; index++)
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                margin: EdgeInsets.only(left: 2, right: 2, top: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDCDCDC), width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.selectedDoorData.devices[index].serialNumber.toString()}",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${widget.selectedDoorData.name}",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFF9A644),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: 
                                
                                widget.selectedDoorData.devices[index].connectivityStatus==0?
                              Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 243, 217, 213),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.red,
                                        size: 10,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "unconfigured",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ):

                                //configured
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD5F3E7),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Color(0xFF2BC185),
                                        size: 10,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "configured",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF2BC185),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),)
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
                                  "Device Type",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6B7280)),
                                ),
                                Text(
                                  "${DeviceTypeGolbal[widget.selectedDoorData.devices[index].type-1]}",
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
                                  "MAC ID",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6B7280)),
                                ),
                                Text(
                                  "d1e21386a83f",
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
                                      color: Color(0xFF6B7280)),
                                ),
                                Text(
                                  "16.00.01",
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
                                  "Battery",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6B7280)),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "50%",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    RotatedBox(
                                      quarterTurns:
                                          1, // Rotate the icon 90 degrees clockwise
                                      child: Icon(
                                        Icons.battery_3_bar_rounded,
                                        color: Color(0xFF5CB067),
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                                //
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

                        Divider(
                          height: 30,
                          color: Color(0xFFDCDCDC),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //
                              },
                              child: Text(
                                "Update Firmware",
                                style: TextStyle(
                                    color: Color(0XFF2F3789),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 25,
                              width: 1.5,
                              color: Color(0xFFDCDCDC),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //
                              },
                              child: Text(
                                "Replace Reader",
                                style: TextStyle(
                                    color: Color(0XFF2F3789),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Spacer(),
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
              ),
        ],
      ),
    );
  }
}
