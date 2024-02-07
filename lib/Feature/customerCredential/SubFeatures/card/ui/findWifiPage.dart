import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindWifiPage extends StatefulWidget {
  const FindWifiPage({super.key});

  @override
  State<FindWifiPage> createState() => _FindWifiPageState();
}

class _FindWifiPageState extends State<FindWifiPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: const Color(0xFF6E88C9),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Find Wifi Network',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.06,
            ),
//
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(children: [
                for (int i = 1; i < 7; i++) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 20,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Network $i',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          //  height: 0.09,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xFFDBDBDB),
                    height: 30,
                  ),
                ],
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
