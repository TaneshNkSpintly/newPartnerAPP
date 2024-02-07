import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../Gobal File/GobalVariable.dart';

class DetachedDevicePage extends StatefulWidget {
  // final VoidCallback onReplace;
  const DetachedDevicePage();

  @override
  State<DetachedDevicePage> createState() => _DetachedDevicePageState();
}

class _DetachedDevicePageState extends State<DetachedDevicePage> {
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
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Detached Device',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6FF),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/icon/sort.png',
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      "Sort",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Container(
                      height: 15,
                      width: 1,
                      color: Color(0xFFDCDCDC),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/icon/filter.png',
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFFC8E7FC), width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Name',
                          // helperText: "hi",
                          hintStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: Color(0xFF768ABC),
                          ),
                          icon: _searchController.text.isEmpty
                              ? Icon(
                                  Icons.search,
                                  color: Color(0xFF768ABC),
                                )
                              : null, // If the controller has data, do not display the search icon.
                        ),
                        onChanged: (value) {
                          setState(
                              () {}); // Rebuild the widget whenever the text changes.
                        },
                      ),
                    ),

                    //DATA
                    for (int i = 0; i < 2; i++) //meshio
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFDCDCDC), width: 1),
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
                                    Text(
                                      "Mesh I/O #$i",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFEBEB),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Color(0xFFFF3333),
                                            size: 10,
                                          ),
                                          Text(
                                            "Offline",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFF3333),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "#432784627836443",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF7C7C82)),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 30,
                            color: Color(0xFFDCDCDC),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  //
                                  // var CongigureConfirmation =
                                  //     await showConfigureDeviceBottomSnackBAR(
                                  //         context);
                                  // (context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.restore,
                                      size: 20,
                                      color: Color(0XFF2F3789),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Reset Device",
                                      style: TextStyle(
                                          color: Color(0XFF2F3789),
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          ///
                        ]),
                      ),
                    for (int i = 0; i < 2; i++) //Gateway
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFDCDCDC), width: 1),
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
                                    Text(
                                      "Gateway #$i",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFEBEB),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Color(0xFFFF3333),
                                            size: 10,
                                          ),
                                          Text(
                                            "Offline",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFF3333),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "#432784627836443",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF7C7C82)),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 30,
                            color: Color(0xFFDCDCDC),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  //
                                  // var CongigureConfirmation =
                                  //     await showConfigureDeviceBottomSnackBAR(
                                  //         context);
                                  // (context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.restore,
                                      size: 20,
                                      color: Color(0XFF2F3789),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Reset Device",
                                      style: TextStyle(
                                          color: Color(0XFF2F3789),
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          ///
                        ]),
                      ),
                    for (int i = 0; i < 1; i++) //Uno
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFDCDCDC), width: 1),
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
                                    Text(
                                      "Uno ",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFEBEB),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Color(0xFFFF3333),
                                            size: 10,
                                          ),
                                          Text(
                                            "Offline",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFF3333),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "#1001A02D000131",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF7C7C82)),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Device Type:",
                                      style: subtextStleGrey,
                                    ),
                                    Text("Entry", style: subtextStleBlack),
                                    Spacer(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Mac ID:",
                                      style: subtextStleGrey,
                                    ),
                                    Text("d1e21386a83f",
                                        style: subtextStleBlack),
                                    Spacer(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Firmware Version:",
                                      style: subtextStleGrey,
                                    ),
                                    Text("16.00.01", style: subtextStleBlack),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 30,
                            color: Color(0xFFDCDCDC),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  //
                                  // var CongigureConfirmation =
                                  //     await showConfigureDeviceBottomSnackBAR(
                                  //         context);
                                  // (context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.restore,
                                      size: 20,
                                      color: Color(0XFF2F3789),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Reset Device",
                                      style: TextStyle(
                                          color: Color(0XFF2F3789),
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          ///
                        ]),
                      ),
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
