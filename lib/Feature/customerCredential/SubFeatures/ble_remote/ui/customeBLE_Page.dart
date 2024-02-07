import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../SubFeature/resetBle/ui/resetBlePage1.dart';

class CustomerBLE_Page extends StatefulWidget {
  final VoidCallback onReplace;
  const CustomerBLE_Page({required this.onReplace});

  @override
  State<CustomerBLE_Page> createState() => _CustomerBLE_PageState();
}

class _CustomerBLE_PageState extends State<CustomerBLE_Page> {
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
      // bottomNavigationBar: CustomerBottomNavigationBarPage(
      //   menuSelected: "Door",
      // ),
      body: Container(
        height: screenSize.height,
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  widget.onReplace();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDBDBDB)),
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Card',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7C7C82),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        // height: 0.11,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: ShapeDecoration(
                  color: Color(0xFFF0F8FE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF6DBDF3)),
                    borderRadius: BorderRadius.circular(42),
                  ),
                ),
                child: Center(
                  child: Text(
                    'BLE Remote',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6DBDF3),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      //    height: 0.11,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.015,
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResetBLE_Page1()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05,
                              vertical: screenSize.height * 0.04),
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.82, -0.58),
                              end: Alignment(-0.82, 0.58),
                              colors: [Color(0xFF2F3789), Color(0xFF4650AF)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Reset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/icon/arrow-circle-right.png",
                                color: Colors.white,
                                height: 23,
                                width: 23,
                              ),
                            ],
                          )),
                    ),
                    //unenroll

                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => UnEnrollCardPage1()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05,
                              vertical: screenSize.height * 0.04),
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.82, -0.58),
                              end: Alignment(-0.82, 0.58),
                              colors: [Color(0xFF2F3789), Color(0xFF4650AF)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Firmware Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/icon/arrow-circle-right.png",
                                color: Colors.white,
                                height: 23,
                                width: 23,
                              ),
                            ],
                          )),
                    ),

                    //DATA
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
