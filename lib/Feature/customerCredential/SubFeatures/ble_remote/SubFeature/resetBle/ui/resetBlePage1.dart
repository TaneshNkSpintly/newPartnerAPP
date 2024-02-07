import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/Feature/customerCredential/SubFeatures/ble_remote/SubFeature/resetBle/ui/resetBlePage2.dart';

import '../../../../../../../Gobal File/GobalVariable.dart';

class ResetBLE_Page1 extends StatefulWidget {
  const ResetBLE_Page1();

  @override
  State<ResetBLE_Page1> createState() => _ResetBLE_Page1State();
}

class _ResetBLE_Page1State extends State<ResetBLE_Page1> {
  TextEditingController _searchController = TextEditingController();
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: screenSize.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Text(
            'Reset remote',
            style: TextStyle(
              color: Color(0xFF111827),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          //
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Note : Make sure the remote is put in assignment mode by pressing the button two times',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RsetBlePage2()));
            },
            child: Container(
              height: screenSize.height * 0.05,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryButtonColor,
              ),
              child: Center(
                child: Text(
                  'Reset Remote',
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
        ]),
      ),
    );
  }
}
