import 'package:flutter/material.dart';

import '../../../../../../../Gobal File/GobalVariable.dart';

class RsetBlePage2 extends StatefulWidget {
  RsetBlePage2();

  @override
  State<RsetBlePage2> createState() => _RsetBlePage2State();
}

class _RsetBlePage2State extends State<RsetBlePage2> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refreshPage() {
      setState(() {});
    }

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
              'Scanning for the device',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenSize.width * 0.075,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),

            Opacity(
              opacity: 0.20,
              child: Text(
                'Scaning...',
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
                'Select remote to reset!',
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
                child: ScanningCONTENT(refreshParent: refreshPage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanningCONTENT extends StatefulWidget {
  final Function refreshParent;
  const ScanningCONTENT({required this.refreshParent});

  @override
  State<ScanningCONTENT> createState() => _ScanningCONTENTState();
}

class _ScanningCONTENTState extends State<ScanningCONTENT> {
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
                      child: Row(
                        children: [
                          Text(
                            'D6:80:59:6E:29:33',
                            style: TextStyle(
                              color: Color(0xFF24333B),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '-${i + 10}',
                            style: TextStyle(
                              color: Color(0xFF3B4E7E),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.wifi,
                            size: 15,
                            color: Color(0xDD35D227),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  // Text(
                  //   '-10',
                  //   style: TextStyle(
                  //     color: Color(0xFF3B4E7E),
                  //     fontSize: 12,
                  //     fontFamily: 'Inter',
                  //     fontWeight: FontWeight.w600,
                  //     height: 0,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Icon(
                  //   Icons.wifi,
                  //   size: 15,
                  //   color: Color(0xDD35D227),
                  // ),
                  SizedBox(
                    height: 10,
                  )
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
