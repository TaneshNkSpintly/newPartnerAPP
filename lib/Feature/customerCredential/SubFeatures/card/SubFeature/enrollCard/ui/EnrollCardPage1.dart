import 'package:flutter/material.dart';
import '../../../../../../../Gobal File/GobalVariable.dart';
import 'EnrollCardPage2.dart';

class EnrollCardPage1 extends StatefulWidget {
  const EnrollCardPage1({super.key});

  @override
  State<EnrollCardPage1> createState() => _EnrollCardPage1State();
}

class _EnrollCardPage1State extends State<EnrollCardPage1> {
  var infoTextStyle = TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    // height: 1.5, // Adjust the line spacing
  );

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    void refresh() {
      setState(() {});
    }

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
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                //height: 0.06,
              ),
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
                      "Enroll your card",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenSize.width * 0.7,
                              height: screenSize.width * 0.7,
                              child: Image.asset(
                                "assets/icon/Gifs/ScanBleGIF.gif",
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Following are steps to enroll cards',
                          style: infoTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          ' 1.Scan for card reader',
                          style: infoTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          ' 2.Select card reader',
                          style: infoTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          ' 3.Swipe card on the reader (Repeat this step to unenroll more cards)',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        //
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EnrollCardPage2()));
                },
                child: Container(
                  height: screenSize.height * 0.05,
                  width: screenSize.width,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      "Start Enrollment",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              //SECTION A
            ]),
//

//stack
          ],
        ),
      ),
    );
  }
}
