import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../Gobal File/GobalVariable.dart';

class EnrollCardPage2 extends StatefulWidget {
  EnrollCardPage2();

  @override
  State<EnrollCardPage2> createState() => _EnrollCardPage2State();
}

var stepCount = 1;
var stepTextList = [
  "Scan for Card Readers",
  "Select Card Readers",
  "Place the card on device",
  "Enrolling...",
  "Process Completed"
];
var selectedStepWidget;

class _EnrollCardPage2State extends State<EnrollCardPage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedStepWidget = STEP1CONTENT(refreshParent: refreshParent);
    print("XY${selectedStepWidget.runtimeType}");
    setState(() {});
  }

  void refreshParent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                  weight: 20,
                )
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Text(
              'Enroll Card',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenSize.width * 0.075,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.07,
            ),
            if (stepCount < 4)
              Opacity(
                opacity: 0.20,
                child: Text(
                  'Step ${stepCount.toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenSize.width * 0.035,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            SizedBox(
              height: 5,
            ),
            Opacity(
              opacity: 0.44,
              child: Text(
                '${stepTextList[stepCount - 1]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenSize.width * 0.04,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            //
            Expanded(
              child: Container(
                child: selectedStepWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class STEP1CONTENT extends StatefulWidget {
  final Function refreshParent;
  const STEP1CONTENT({required this.refreshParent});

  @override
  State<STEP1CONTENT> createState() => _STEP1CONTENTState();
}

class _STEP1CONTENTState extends State<STEP1CONTENT> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      // step1 container
      child: Container(
        // 1
        width: screenSize.width * 0.85,
        height: screenSize.width * 0.85,
        decoration: ShapeDecoration(
          // color: Colors.white,
          shape: OvalBorder(
            side: BorderSide(width: 2, color: Color(0xFFFBF9F7)),
          ),
        ),
        child: Center(
          child: Container(
            //2
            width: screenSize.width * 0.65,
            height: screenSize.width * 0.65,
            decoration: ShapeDecoration(
              //   color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(width: 2, color: Color(0xFFFBF9F7)),
              ),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  stepCount = 2;
                  selectedStepWidget = STEP2CONTENT(
                    refreshParent: widget.refreshParent,
                  );
                  widget.refreshParent();
                },
                child: Container(
                  //3
                  width: screenSize.width * 0.45,
                  height: screenSize.width * 0.45,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7780D6),
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: Container(
                      width: screenSize.width * 0.35,
                      height: screenSize.width * 0.35,
                      decoration: ShapeDecoration(
                        color: Color(0xFF7780D6),
                        shape: OvalBorder(
                          side: BorderSide(width: 2, color: Color(0x14FCF9F8)),
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                'assets/icon/scanReader.svg',
                                width: screenSize.width * 0.15,
                                height: screenSize.width * 0.15,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Scan Reader',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenSize.width * 0.05,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class STEP2CONTENT extends StatefulWidget {
  final Function refreshParent;
  const STEP2CONTENT({required this.refreshParent});

  @override
  State<STEP2CONTENT> createState() => _STEP2CONTENTState();
}

class _STEP2CONTENTState extends State<STEP2CONTENT> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 9; i++) ...[
                  GestureDetector(
                    onTap: () {
                      stepCount = 3;
                      selectedStepWidget = STEP3CONTENT(
                        refreshParent: widget.refreshParent,
                      );
                      widget.refreshParent();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05,
                        vertical: screenSize.width * 0.03,
                      ),
                      width: screenSize.width,
                      alignment: Alignment.centerLeft,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF0F2F4).withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        '1015A001000011 - Entry',
                        style: TextStyle(
                          color: Color(0xFF24333B),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ],
            ),
          ),
        ),
        //    Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: screenSize.height * 0.05,
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
      ],
    );
  }
}

class STEP3CONTENT extends StatefulWidget {
  final Function refreshParent;
  const STEP3CONTENT({required this.refreshParent});

  @override
  State<STEP3CONTENT> createState() => _STEP3CONTENTState();
}

class _STEP3CONTENTState extends State<STEP3CONTENT> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        stepCount == 3
            ? Expanded(
                child: GestureDetector(
                  onTap: () {
                    stepCount = 4;
                    // selectedStepWidget = STEP3CONTENT(
                    //   refreshParent: widget.refreshParent,
                    // );
                    widget.refreshParent();
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenSize.width * 0.5,
                        height: screenSize.width * 0.5,
                        child: Image.asset(
                          "assets/icon/Gifs/ScanBleGIF.gif",
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: TextButton(
                onPressed: () {
                  stepCount = 5;
                  selectedStepWidget = STEP5SuccessCONTENT(
                    refreshParent: widget.refreshParent,
                  );
                  widget.refreshParent();
                },
                child: Text("temproary next"),
              )),
        SizedBox(
          height: 25,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: screenSize.height * 0.05,
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
      ],
    );
  }
}

class STEP5SuccessCONTENT extends StatefulWidget {
  final Function refreshParent;
  const STEP5SuccessCONTENT({required this.refreshParent});

  @override
  State<STEP5SuccessCONTENT> createState() => _STEP5SuccessCONTENTState();
}

class _STEP5SuccessCONTENTState extends State<STEP5SuccessCONTENT> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Card Enrolled Successfully',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF37D26D),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            // height: 0.09,
          ),
        ),
        SizedBox(
          height: screenSize.width * 0.2,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              //     stepCount = 4;
              // selectedStepWidget = STEP3CONTENT(
              //   refreshParent: widget.refreshParent,
              // );
              // widget.refreshParent();
              // setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.3,
                  height: screenSize.width * 0.3,
                  child: Image.asset(
                    "assets/icon/Gifs/succesfullyCompleted.gif",
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          'Count : 1 card(s) successfully enrolled',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF888B87),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: screenSize.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryButtonColor,
              border: Border.all(
                color: primaryButtonColor,
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
