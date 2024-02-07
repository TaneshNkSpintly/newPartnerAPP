import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../Gobal File/GobalVariable.dart';

class EditDoorPage extends StatefulWidget {
  const EditDoorPage({super.key});

  @override
  State<EditDoorPage> createState() => _EditDoorPageState();
}

class _EditDoorPageState extends State<EditDoorPage> {
  TextEditingController _networkNameController = TextEditingController();
  TextEditingController _installationMethodController = TextEditingController();
  TextEditingController _configurationController = TextEditingController();
  TextEditingController _lockingMechanismController = TextEditingController();
  //
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  bool _isOnDoorSensor = false;
  bool _isOnInvertRelayLogic = false;
  bool _isOnAttendence = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _networkNameController.text = "Lake Plaza Office- First Floor";
    _installationMethodController.text = "New Install";
    _configurationController.text = "New Install";
    _lockingMechanismController.text = "EM/MAG Lock";
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
              'Door #1',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      body: Container(
        height: screenSize.height,
        child: Column(children: [
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
                  "Edit Door",
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            //container1c
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _networkNameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Network",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFE0E0E0)), // Set the enabled border color to black
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _installationMethodController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Installation Method",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFE0E0E0)), // Set the enabled border color to black
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _configurationController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Configuration",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFE0E0E0)), // Set the enabled border color to black
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _lockingMechanismController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Locking Mechanism",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFFE0E0E0)), // Set the enabled border color to black
                        ),
                      ),
                    ),

                    ///
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Door Sensor",
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
                              value: _isOnDoorSensor,
                              onChanged: (value) {
                                setState(() {
                                  _isOnDoorSensor = value;
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
                    //"Relay On Time",
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: 40,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 245, 243, 243),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  //  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: controller1,
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
                                    color: (controller1.text.isEmpty ||
                                            (int.tryParse(controller1.text) ??
                                                    0) <
                                                3)
                                        ? Colors.blue
                                        : Colors.red,

// Color(0xFFE0E0E0),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeColor // Color(0xFFE0E0E0),
                                      ),
                                ),
                              ),
                            ),
                          ),
                          //2
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 245, 243, 243),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  //  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
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
                                      color:
                                          //  ((controller1.text.isEmpty &&
                                          //             controller2.text.isEmpty) ||
                                          //         ((int.tryParse(controller1.text) ??
                                          //                     0) <
                                          //                 2 &&
                                          //             (int.tryParse(
                                          //                         controller2.text) ??
                                          //                     0) <
                                          //                 5) ||
                                          //         ((int.tryParse(controller1.text) ??
                                          //                     0) ==
                                          //                 2 &&
                                          //             (int.tryParse(
                                          //                         controller2.text) ??
                                          //                     0) <
                                          //                 5))
                                          //     ?
                                          Colors.blue
                                      // : Colors.red,
                                      ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeColor // Color(0xFFE0E0E0),
                                      ),
                                ),
                              ),
                            ),
                          ),
                          //3
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 245, 243, 243),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  //  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
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
                                      color: Colors
                                          .blue // themeColor // Color(0xFFE0E0E0),
                                      ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeColor // Color(0xFFE0E0E0),
                                      ),
                                ),
                              ),
                            ),
                          ),

                          ///

                          Text(
                            " Seconds",
                            style: TextStyle(
                                color: themeColor, // Color(0xFF000000),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                //fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),

                    //
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                      child: Row(
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
                              inactiveTrackColor: Color(0xFFB0BEC5),
                              inactiveThumbColor: Color(0xFFECEFF1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Attendence",
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
                              value: _isOnAttendence,
                              onChanged: (value) {
                                setState(() {
                                  _isOnAttendence = value;
                                });
                              },
                              inactiveTrackColor: Color(0xFFB0BEC5),
                              inactiveThumbColor: Color(0xFFECEFF1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                  Navigator.pop(context,
                      1); //1 for succcess message displayed on parent page
                },
                child: Container(
                  height: screenSize.height * 0.05,
                  width: screenSize.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
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
    );
  }
}
