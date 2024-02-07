import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanDevicePage extends StatefulWidget {
  @override
  _QRScanDevicePageState createState() => _QRScanDevicePageState();
}

class _QRScanDevicePageState extends State<QRScanDevicePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedResult = "Please Scan QR Code";
  bool scanResultCounter = false;
  double linePosition = 0.0;

  late Timer _animationTimer;

  void _popOut() {
    Future.delayed(Duration(milliseconds: 5000), () {
      // Navigator.of(context).pop(scannedResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var containerSize = screenSize.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_back,
              size: 20,
              color: const Color(0xFF6E88C9),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              'Scan',
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      body: Container(
        height: screenSize.height,
        decoration: BoxDecoration(color: Color.fromARGB(192, 63, 63, 63)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: screenSize.height * 0.15,
              child: Center(
                child: Text(
                  scannedResult,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: screenSize.width * 0.85,
              width: screenSize.width * 0.85,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Center(
                    child: Container(
                      height: containerSize,
                      width: containerSize,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 5),
                    top: linePosition,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0,
                                2), // Change the y-offset to control the shadow position
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ... Your existing Positioned widgets for top, right, bottom, and left lines
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: containerSize * 0.25,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: containerSize * 0.25,
                      width: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: containerSize * 0.25,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: containerSize * 0.25,
                      width: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //BOTTOM
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: containerSize * 0.25,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: containerSize * 0.25,
                      width: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: containerSize * 0.25,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: containerSize * 0.25,
                      width: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                "Align QR within frame to scan",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                scanResultCounter
                    ? Navigator.of(context).pop(scannedResult)
                    : Navigator.of(context).pop("0");
                ;
              },
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue, // Adjust the color as needed
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        scanResultCounter ? "CONFIRM" : "CANCEL",
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
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedResult = scanData.code.toString();
        if (scannedResult != "Please Scan QR Code") scanResultCounter = true;
        _animationTimer.cancel();
        // _popOut();
        //  Navigator.of(context).pop(scannedResult);
      });
    });

    startAnimation();
  }

  void startAnimation() {
    final Size screenSize = MediaQuery.of(context).size;
    _animationTimer = Timer(Duration(milliseconds: 5), () {
      if (linePosition < screenSize.width * 0.85 - 2) {
        setState(() {
          linePosition += 2;
        });
        startAnimation();
      } else {
        // Reset the position when it reaches the bottom
        setState(() {
          linePosition = screenSize.width * 0.85 - 2;
        });
        startBottomAnimation();
      }
    });
  }

  void startBottomAnimation() {
    final Size screenSize = MediaQuery.of(context).size;
    _animationTimer = Timer(Duration(milliseconds: 5), () {
      if (linePosition > 0) {
        setState(() {
          linePosition -= 2;
        });
        startBottomAnimation();
      } else {
        // Reset the position when it reaches the top
        setState(() {
          linePosition = 0.0;
        });
        startAnimation();
      }
    });
  }

  @override
  void dispose() {
    _animationTimer.cancel(); // Cancel the timer
    controller?.dispose();
    super.dispose();
  }
}
