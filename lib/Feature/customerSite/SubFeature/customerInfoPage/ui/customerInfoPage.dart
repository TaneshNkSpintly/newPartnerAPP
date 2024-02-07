import 'dart:async';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GlobalFunctionMessages.dart';
import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../../../Services/customerSiteProvider.dart';
import '../../editCustomerInfo/ui/editCustomerInfoPage.dart';

class CustomerInfoPage extends StatefulWidget {
  String orgId;
  CustomerInfoPage({super.key, required this.orgId});

  @override
  State<CustomerInfoPage> createState() => _DoorInfoPageState();
}

class _DoorInfoPageState extends State<CustomerInfoPage> {
  bool showMessage = false;
  var CongigureConfirmation;

  void _showSuccessMessage() {
    setState(() {
      showMessage = true;
    });

    // Set a timer to hide the message after 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        showMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    Country _CountrieSelected = Country(
      isoCode: "IN",
      phoneCode: "91",
      name: "India",
      iso3Code: "IND",
    );

    return Consumer(
      builder: (context, ref, child) {
        // if (initFetch) {
        //   initsta(ref);

        //   initFetch = false;
        // }
        final customerSiteOverViewData = ref.watch(customerSiteProvider);
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
                  'Customer Info',
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
                // GestureDetector(
                //   onTap: () {
                //     //open nav bar
                //   },
                //   child: Icon(
                //     Icons.keyboard_arrow_down,
                //     color: Color(0xFF6E88C9),
                //     size: 25,
                //   ),
                // ),
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
                    height: screenSize.height * 0.05,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: customerSiteOverViewData
                                    .organisationDetailsModel ==
                                null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.name}',
                                      style: TextStyle(
                                        color: Color(0xFF111827),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Country',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        // CountryPickerUtils.getDefaultFlagImage(
                                        //     _CountrieSelected),
                                        CountryPickerUtils.getDefaultFlagImage(
                                            findCountryByValue(
                                                customerSiteOverViewData
                                                    .organisationDetailsModel!
                                                    .generalSetting
                                                    .country)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${findCountryByValue(customerSiteOverViewData.organisationDetailsModel!.generalSetting.country).name}',
                                          style: TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Account type',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Text(
                                      '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.accountType}',
                                      style: TextStyle(
                                        color: Color(0xFF111827),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Admin Name',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.admins[0].name}',
                                      style: TextStyle(
                                        color: Color(0xFF111827),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Admin Email ID',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.admins[0].email}',
                                      style: TextStyle(
                                        color: Color(0xFF111827),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Admin Phone no.',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        CountryPickerUtils.getDefaultFlagImage(
                                            findCountryByValue(
                                                customerSiteOverViewData
                                                    .organisationDetailsModel!
                                                    .generalSetting
                                                    .country)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.admins[0].phone}',
                                          style: TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    //

                                    //
                                  ]),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          //Navigator.of(context).pop();
                          var TitleMessage = "Delete Door?";
                          var subTitleMessage =
                              "Are you sure you want to delete this door ? This will detach it from Falcon X and delete all it’s data. Detached devices will be available in the detached devices tab.";
                          var Result = await showDeketeBottomSnackBAR(
                              context, //void Function() refresh,
                              TitleMessage,
                              subTitleMessage);
                          if (Result == 1) {
                            var TitleMessage = "Network Deleted Successfully";
                            var subTitleMessage =
                                "You have successfully deleted Door #1 from Falcon X.";
                            var Result = showSccessBottomSnackBAR(
                                context, //void Function() refresh,
                                TitleMessage,
                                subTitleMessage);
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: primaryButtonColor,
                            border: Border.all(
                              color: Color(0xFFF94444),
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/deleteBinIcon.png',
                                height: 20,
                                width: 20,
                                color: Color(0xFFF94444),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Delete Door",
                                style: TextStyle(
                                  color: Color(0xFFF94444),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () async {
                          // CongigureConfirmation =
                          //     await showCongigureDoorBottomSnackBAR(context);

                          var Result = await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => EditCustomerInfoPage(
                                        orgId: widget.orgId,
                                      )));

                          if (Result == 1) {
                            _showSuccessMessage();
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryButtonColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   'assets/icon/configure.png',
                              //   height: 20,
                              //   width: 20,
                              //   color: Colors.white,
                              // ),
                              Icon(
                                Icons.mode_edit_outline_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Edit Detail",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //SECTION A
                ]),
                //

                if (showMessage)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          showMessage = false;
                        });
                      },
                      child: Container(
                        height: 60, // Adjust height as needed
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: SuccessMessage(
                          titleMessage: "Changes saved successfully",
                        ),
                      ),
                    ),
                  ),

                //stack
              ],
            ),
          ),
        );
      },
    );
  }
}
