// dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/dashboard/Modal/orgainsations_Model.dart';
import 'package:partner_app/Feature/dashboard/Services/dashboardProvider.dart';
import 'package:partner_app/testfiles/SdkHomeTestPage.dart';

import '../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../Gobal File/GobalVariable.dart';
import '../../customerBottomNavigationBar/ui/customerBottomNavigationBar.dart';
import '../../customerMenu/ui/menuCustomer.dart';
import '../SubFeatures/createNewCustomer/ui/createNewCustomer.dart';

bool customInitSate = false;

TextEditingController _searchController = TextEditingController();
DasboardContainer dasboardContainer = DasboardContainer();
List<Organisation>? organisationListFiltered;

List<Organisation>? filterOrganisationList(
    List<Organisation>? organizationList) {
  // If search content is empty or the search field is null, return all gateways.
  if (_searchController.text.isEmpty) {
    return organizationList;
  }

  return organizationList!.where((organizationList) {
    return organizationList.name
        .toString()
        .toLowerCase()
        .contains(_searchController.text.toLowerCase());
  }).toList();
}

class DashBoardPage extends StatefulWidget {
  // String orgId;
  DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    customInitSate = false;
  }

  Future<void> initsta(WidgetRef ref) async {
    var dashboardData =
        await ref.read(dashboardProvider.notifier).fetchDashboardDetails();

    ///dashboardcontainer iniatilesed
    if (dashboardData != null && dashboardData.dashboarDetailModel != null) {
      print("dashboardDataytyty");
      dasboardContainer.dataNumbers.add(
          dashboardData!.dashboarDetailModel!.noOfOrganisations.toString());
      dasboardContainer.dataNumbers
          .add(dashboardData!.dashboarDetailModel!.noOfAccessPoints.toString());
      dasboardContainer.dataNumbers.add(
          dashboardData!.dashboarDetailModel!.noOfDetachedDevices.toString());
      dasboardContainer.dataNumbers
          .add(dashboardData!.dashboarDetailModel!.noOfGateways.toString());

      for (int i = 0; i < dasboardContainer.dataNumbers.length; i++)
        print("vv${dasboardContainer.dataNumbers[i]}");
    }

    await ref.read(dashboardProvider.notifier).fetchConfigurationDetails();

    await ref.read(dashboardProvider.notifier).fetchUserDetails();
    await ref.read(dashboardProvider.notifier).fetchOrganisationDetails();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Consumer(
      builder: (context, ref, child) {
        final dashboardData = ref.watch(dashboardProvider);

        if (customInitSate == false) {
          initsta(ref);
          customInitSate = true;
        }
        if (dashboardData.organizationList != null)
          organisationListFiltered =
              filterOrganisationList(dashboardData.organizationList);


// SpintlyOuathSdk spintlyOuathSdk = SpintlyOuathSdk();


        return Scaffold(
          floatingActionButton:  ElevatedButton(
          onPressed: () async {
            // Use the plugin functionality
            
    //  String? platformVersion = await spintlyOuathSdk.getOuatSdk();
    //         print('Platform Version: $platformVersion');
                 Navigator.of(context).push(
                      MaterialPageRoute(
               builder: (context) =>
          SdkTestHomePage()));
                                      
          },
          child: Text('Go SdkTestHome'),
        ),
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
                    _navigateToMenu(context);
                    //   dashboardBloc.add(DashboardCustomerMenuNavigateEvent());
                    print("hi");
                  },

                  onHorizontalDragUpdate: (details) {
                        if (details.delta.dx > 0) {
                          // Swiped from left to right (right to left on RTL languages)
                          
                          _navigateToMenu(context);
                        } else if (details.delta.dx < 0) {
                          // Swiped from right to left (left to right on RTL languages)
                          
                        }
                      },
                  child: Container(
                    //menu button
                    height: 18,
                    width: 20,
                    color: themeColor,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 2,
                            width: 13,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 2,
                            width: 17,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 2,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          body: dasboardContainer.dataNumbers.length < 3
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: GestureDetector(
                       onHorizontalDragUpdate: (details) {
                        if (details.delta.dx > 0) {
                          // Swiped from left to right (right to left on RTL languages)
                          
                          _navigateToMenu(context);
                        } else if (details.delta.dx < 0) {
                          // Swiped from right to left (left to right on RTL languages)
                          
                        }
                      },
                    child: Container(
                      height: screenSize.height,
                      color: themeColor,
                      child: Column(
                        children: [
                          //Section A
                          Container(
                            color: themeColor,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(4, (index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: 15, top: 10, bottom: 15),
                                    width: screenSize.width * 0.4,
                                    decoration: BoxDecoration(
                                      color: dasboardContainer.CardColor[index],
                                      borderRadius: BorderRadius.circular(
                                          12), // This will apply rounded corners with a radius of 20 to all sides
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${dasboardContainer.heading[index]}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 1,
                                          ),
                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                          // if (dashboardData!
                                          //         .dashboarDetailModel!.noOfOrganisations
                                          //         .toString() !=
                                          //     null)
                                          Text(
                                            // "${dashboardData!.dashboarDetailModel!.noOfOrganisations.toString()}",
                                            "${dasboardContainer.dataNumbers[index]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 21,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          //section b
                          Expanded(
                            child: Container(
                              //  height: screenSize.height * 0.5,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                              ),
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 5, left: 2, right: 2),
                                        height: 5,
                                        width: screenSize.width * 0.1,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color:
                                              Color.fromARGB(255, 219, 219, 225),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Customers",
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Inter',
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateNewCustomer()));
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add_circle_outline_rounded,
                                              size: 20,
                                              color: Color(0xFF2F3789),
                                            ),
                                            Text(
                                              "New Customer",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF2F3789),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    margin: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Color(0xFFC8E7FC),
                                      //     spreadRadius: 2,
                                      //   )
                                      // ],
                    
                                      border: Border.all(
                                          color: Color(0xFFC8E7FC), width: 1.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: 
                                       TextField(
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
                                          organisationListFiltered =
                                              filterOrganisationList(
                                                  dashboardData.organizationList);
                                          // ref.refresh(dashboardProvider);
                                          //  ref.refresh(dashboardProvider);
                    
                                          print(
                                              "$value ${organisationListFiltered!.length}");
                                          setState(() {});
                    
                                          // setState(
                                          //     () {}); // Rebuild the widget whenever the text changes.
                                        },
                                      ),
                                    
                                  ),
                                  Expanded(
                                    child: organisationListFiltered == null
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Container(
                                            //height: screenSize.height * 0.5,
                                            child:  ListView.builder(
                                                  itemCount: organisationListFiltered!
                                                              .length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                  // print(index);
                                                  // print("ALL organisation");
                                                  // print(index);
                    
                                                  return GestureDetector(
                                                    onTap: () {
                                                      print(
                                                          "textScaleFactor$textScaleFactor");
                                                      var orgId =
                                                          organisationListFiltered![
                                                                  index]
                                                              .id
                                                              .toString();
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CustomerBottomNavigationBarPage(
                                                              orgId: orgId,
                                                            ),
                                                            settings:
                                                                RouteSettings(
                                                              name:
                                                                  '/BotoomNavBar',
                                                            ),
                                                          ));
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
                                                                    "${organisationListFiltered![index].name}",
                                                                    maxLines: 3,
                                                                    softWrap:
                                                                        true,
                                                                    // overflow:
                                                                    //     TextOverflow
                                                                    //         .ellipsis,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize: 16 /
                                                                          textScaleFactor,
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
                                                //  for (int i = 0; i < 7; i++)
                                             
                                          ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                    
                          // Container(
                          //   height: screenSize.height,
                          //   color: themeColor,
                          //   alignment: Alignment.topCenter,
                          //   child: )
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

final class DasboardContainer {
  List<String> heading = [
    "Total Customers",
    "Total Doors",
    "Deteched Devices",
    "Total Gateways"
  ];
  List<String> dataNumbers = [];
  List CardColor = [
    Color(0xFF4E56AD),
    Color(0xFFE03F6B),
    Color(0xFF0DA678),
    Color(0xFFFFAA04)
  ];
}

void _navigateToMenu(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomerMenuPage();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  ));
}
