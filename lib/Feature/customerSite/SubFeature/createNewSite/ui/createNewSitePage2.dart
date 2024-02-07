import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../../../Services/customerSiteProvider.dart';
import '../../../ui/customerSitePage.dart';

TextEditingController _networkName1Controller = TextEditingController();
TextEditingController _networkName2Controller = TextEditingController();
bool showNextButton = false;
bool isLoadingCreateNEW = false;

class CreateNewSitePage2 extends StatefulWidget {
  String orgId;
  TextEditingController siteLocationController;
  TextEditingController siteNameController;
  TextEditingController timezoneController;

  CreateNewSitePage2(
      {super.key,
      required this.siteNameController,
      required this.siteLocationController,
      required this.timezoneController,
      required this.orgId});

  @override
  State<CreateNewSitePage2> createState() => _CreateNewSitePage2State();
}

class _CreateNewSitePage2State extends State<CreateNewSitePage2> {
  @override
  void dispose() {
    // TODO: implement dispose
    _networkName1Controller.clear();
    _networkName2Controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (_networkName1Controller.text != "" )
     {
      showNextButton = true;
      setState(() {});
    }
    else{
      showNextButton=false;
      setState(() {
        
      });
    }

    return Consumer(
      builder: (context, ref, child) {
        final customerSiteOverViewData = ref.watch(customerSiteProvider);
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: screenSize.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Container(
                            height: 6,
                            width: screenSize.width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xFF6DBDF3),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                          'Create New Site',
                          style: TextStyle(
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
                      height: 35,
                    ),

                    Row(
                      children: [
                        SizedBox(width: 15),
                        Text(
                          'Network Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _networkName1Controller,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Network Name -1",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFE0E0E0)), // Set the enabled border color to black
                                ),
                              ),
                              onChanged: (value) {
                                
                                setState(() {
                                  
                                });
                              },
                            ),
                            TextFormField(
                              controller: _networkName2Controller,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Network Name -2",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFE0E0E0)), // Set the enabled border color to black
                                ),
                              ),
                               onChanged: (value) {
                                
                                setState(() {
                                  
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).popUntil((route) =>
                                route.settings.name == '/BotoomNavBar');
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
                        isLoadingCreateNEW
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  if (showNextButton) {
                                    isLoadingCreateNEW = true;
                                    MessageResponse? ResultCreateNewSite =
                                        await ref
                                            .read(customerSiteProvider.notifier)
                                            .createNewSitePost(
                                              widget.orgId,
                                              widget.siteNameController.text
                                                  .toString(),
                                              widget.siteLocationController.text
                                                  .toString(),
                                              widget.timezoneController.text
                                                  .toString(),
                                              _networkName1Controller.text
                                                  .toString(),
                                              _networkName2Controller.text
                                                  .toString(),
                                            );
                                    print(
                                        "gshshsh ${ResultCreateNewSite!.type}");
                                    print("opfofpof ${ResultCreateNewSite}");
                                    isLoadingCreateNEW = false;
                                    if (ResultCreateNewSite!.type ==
                                        "success") {
                                      var title = "Site Created Successfully";
                                      var subtitle =
                                          "New Site Lake Plaza Office has been successfully added in Falcon-X";
                                      var result =
                                          await showSccessBottomSnackBAR(
                                              context, title, subtitle,
                                              refresh: refresh);

                                      Navigator.pop(context, 1);
                                    }
                                  }
                                },
                                child: Container(
                                  height: screenSize.height * 0.05,
                                  width: screenSize.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: showNextButton
                                        ? primaryButtonColor
                                        : Color(0xFFDBDEE7),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "CREATE SITE",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
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
          ),
        );
      },
    );
  }
}

//
