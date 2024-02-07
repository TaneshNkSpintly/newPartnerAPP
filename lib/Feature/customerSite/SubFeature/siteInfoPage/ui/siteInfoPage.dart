import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/customerSite/Services/customerSiteProvider.dart';
import 'package:partner_app/Gobal%20File/GlobalFunctionMessages.dart';
import 'package:partner_app/Gobal%20File/GobalModel.dart';
import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../../editSiteInfo/ui/editSiteInfoPage.dart';

TextEditingController _newNetworkController = TextEditingController();

class SiteInfoPage extends StatefulWidget {
  int siteIdex;
   String orgId;
   SiteInfoPage({super.key, required this.siteIdex,required this.orgId});

  @override
  State<SiteInfoPage> createState() => _SiteInfoPageState();
}

class _SiteInfoPageState extends State<SiteInfoPage> {
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

    void refresh() {
      setState(() {});
    }

    return Consumer(
      builder: (context, ref, child) {
        
         
        final customerSiteOverViewData = ref.watch(customerSiteProvider);
        return  Scaffold(
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
                '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.name}',
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
                  Container(
                    // container a
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: themeColor, // Color(0xFFF5F6FF),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFF768ABC),
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Lake Plaza Office, Goa, India",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
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
                          "Site Information",
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
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
                                       "${customerSiteOverViewData.SiteList![widget.siteIdex].name}",
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
                                'Location',
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
                                "${customerSiteOverViewData.SiteList![widget.siteIdex].location} ",
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
                                'Timezone',
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
                               "${customerSiteOverViewData.SiteList![widget.siteIdex].timezone} ",
                                   style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                             
                              //
                              for(int index=0;index<customerSiteOverViewData.SiteList![widget.siteIdex].networks.length;index++)
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                    height: 25,
                                      ),
                                  Text(
                                    'Network${index+1}',
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
                                    "${customerSiteOverViewData.SiteList![widget.siteIdex].networks[index].name} ",
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
                              SizedBox(
                                height: 45,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFEFF6FC),
                                ),
                                child: Center(
                                  child: Text(
                                    'Only 2 networks are allowed per site',
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      // height: 0.14,
                                    ),
                                  ),
                                ),
                              )
        
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
                        String sitename=  customerSiteOverViewData.SiteList![widget.siteIdex].name;
                          showAddNewNetworkPicker(context, refresh,widget.siteIdex,widget.orgId,sitename);
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: primaryButtonColor,
                            border: Border.all(
                              color: Color(0xFF2F3789),
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: Color(0xFF2F3789),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "New Network",
                                style: TextStyle(
                                  color: Color(0xFF2F3789),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
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
        
                          var Result = await Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EditSiteInfoPage(siteIdex: widget.siteIdex,orgId: widget.orgId,)));
        
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
                                "Edit Site",
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
      }
    );
  }
}


void showAddNewNetworkPicker(BuildContext context, void Function() refresh,int siteIdex,String orgId,String siteName) {
  _newNetworkController.clear();
_newNetworkController.text="${siteName} - ";
bool _loaderAddNewtork=false;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {

        return Container(
          // height: MediaQuery.of(context).size.height *
          //     0.4, // Adjust the height as needed
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 2, right: 2),
                    height: 5,
                    width: screenSize.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 219, 219, 225),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Add New Network",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
                  _loaderAddNewtork?
                  Center(child: CircularProgressIndicator(),):
                 Center(
                  child: TextFormField(
                    controller: _newNetworkController,
                    //enabled: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Network Name',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      //  _newNetworkController.text="${siteName} - ${value}";
                    },
                  ),
        
              ),

              SizedBox(
                height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      //   _newNetworkController.text = _selectedTimezone;
                      setState(() {});
                      refresh();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      //  margin: EdgeInsets.all(15),
                      padding: const EdgeInsets.all(15.0),
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Center(
                        child: Text(
                          "Cancel",
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
                 Consumer(
                     builder: (context, ref, child) {
                        
                     final customerSiteOverViewData = ref.watch(customerSiteProvider);
                     //String stitename=customerSiteOverViewData.SiteList![siteIdex].name;
                       return GestureDetector(
                        
                      
                          onTap: () async {

                            _loaderAddNewtork=true;
                                setState(() {});


                              int? netId1=null;
                              if(  customerSiteOverViewData.SiteList![siteIdex].networks.length==1 ){
                                netId1=customerSiteOverViewData.SiteList![siteIdex].networks[0].id;
                              }
                              int? netId2=null;
                              if(  customerSiteOverViewData.SiteList![siteIdex].networks.length==2 ){
                                netId2=customerSiteOverViewData.SiteList![siteIdex].networks[1].id;
                              }
                               MessageResponse? Site_UpdateDetailsResult =
                                                     await ref.read(customerSiteProvider.notifier)
                                                         . updateSiteDetails_AddNetwork(
                                                              orgId,
                                                              customerSiteOverViewData.SiteList![siteIdex].id.toString(),
                                                              siteName,
                                                              _newNetworkController.text.toString(),
                                                            //
                                                            true, // created only network;
                                                              "",
                                                              "",
                                                              "",
                                                              "",
                                                              "",
                                                              null,
                                                             "",
                                                             null,
                                                            );
                                  if (Site_UpdateDetailsResult! .type =="success"){
                                            Navigator.pop(context, 1);
                                           var Title = "Network Added Successfully";
                                           var SubTitLE =
                                              "New network ${ _newNetworkController.text.toString()} has been successfully added to site $siteName";
                                            showSccessBottomSnackBAR(context, Title, SubTitLE);
                                                          
                                                     }
                                                  else if (Site_UpdateDetailsResult! .type =="error")
                                                  {
                                                     String errorMessage = Site_UpdateDetailsResult
                                                          .errorMessage!.errorMessage;
                                                            var title =
                                                                "Failed to Add Network";
                                                            var subtitle = "$errorMessage";
                                                            showUnsccessBottomSnackBAR(
                                                                context, title, subtitle);
                                                                  Navigator.pop(context, 0);
                                                }
                                                
                            _loaderAddNewtork=false;
                                setState(() {});
                            

                            },
                        child: Container(
                          //  margin: EdgeInsets.all(15),
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryButtonColor),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Add Network",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height*0.06,
              ),
            ],
          ),
        );
      });
    },
  );
}
