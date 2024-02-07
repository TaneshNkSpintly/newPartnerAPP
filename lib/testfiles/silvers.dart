import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partner_app/Gobal%20File/GobalFunctionSnackBAR.dart';

class testPages extends StatefulWidget {
  const testPages({super.key});

  @override
  State<testPages> createState() => _testPagesState();
}

class _testPagesState extends State<testPages> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.white70,
        child:
        // Column(
        //   children: [

// SingleChildScrollView(
//                   child: Column(
//                     children:
                     ListView.builder(
                      itemCount: 1500,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                        onTap: () {
                          print(
                              "textScaleFactor");
                      
                        },
                        child: Container(
                            padding:
                                EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12),
                            margin: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(
                                      0xFFDCDCDC),
                                  width: 1),
                              borderRadius:
                                  BorderRadius
                                      .circular(7),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "{organisationListFiltered![index].name}:$index",
                                        maxLines: 3,
                                        softWrap:
                                            true,
                                        
                                        style:
                                            TextStyle(
                                          fontFamily:
                                              'Inter',
                                          fontSize: 16 ,
                                          fontWeight:
                                              FontWeight
                                                  .w600,
                                          color: Colors
                                              .black,
                                        ),
                                      ),
                                    ),
                                    // Spacer(),
                                    GestureDetector(
                                      onTap:
                                          () async {
                                        var title =
                                            "Sure, you want Delete ?";
                                        var subtitle =
                                            "Deleting this organisation removes all users and data. Download important data first. Unenroll any cards to avoid locking them, rendering them unusable in other Spintly orgs.";
                                        var result =
                                            await showDeketeBottomSnackBAR(
                                                context,
                                                title,
                                                subtitle);
                                        if (result ==
                                            1) {
                                          var title =
                                              "Can’t delete the Organisation!";
                                          var subtitle =
                                              "Please delete and clear the sites under the organisation first to proceed.";
                                          showUnsccessBottomSnackBAR(
                                              context,
                                              title,
                                              subtitle);
                                          print(
                                              "hoho");
                                          //    setState(() {});
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height:
                                                20,
                                            child: Image
                                                .asset(
                                              'assets/icon/deleteBinIcon.png', // Replace with your image path
                                            ),
                                          ),
                                          Text(
                                            "Remove",
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 13,
                                                //fontWeight: FontWeight.w400,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                //
                                Row(
                                  children: [
                                    Text(
                                      "Account Type:",
                                      style: TextStyle(
                                          fontFamily:
                                              'Inter',
                                          fontSize:
                                              13,
                                          fontWeight:
                                              FontWeight
                                                  .w400,
                                          color: Color(
                                              0xFF8E8D92)),
                                    ),
                                    Text(
                                      "Customer Account",
                                      style: TextStyle(
                                          fontFamily:
                                              'Inter',
                                          fontSize:
                                              13,
                                          fontWeight:
                                              FontWeight
                                                  .w600,
                                          color: Colors
                                              .black),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Number of Sites:",
                                      style: TextStyle(
                                          fontFamily:
                                              'Inter',
                                          fontSize:
                                              13,
                                          fontWeight:
                                              FontWeight
                                                  .w400,
                                          color: Colors
                                              .grey),
                                    ),
                                    Text(
                                      "05",
                                      style: TextStyle(
                                          fontFamily:
                                              'Inter',
                                          fontSize:
                                              13,
                                          fontWeight:
                                              FontWeight
                                                  .w600,
                                          color: Colors
                                              .black),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            )),
                      );
                    }),
                //   ),
                // ),
            
            
         // ],
       // ),
      ),
    );
  }
}