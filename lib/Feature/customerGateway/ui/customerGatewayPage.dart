import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/customerGateway/SubFeature/gatewayInfo/ui/bottomSnackbars.dart';
import 'package:partner_app/Feature/customerGateway/ui/findWifiPage.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../Model/gatewayList_Model.dart';
import '../Services/customerGatewayProvider.dart';
import '../SubFeature/createNewGateway/ui/createNewGatewayPage.dart';
import '../SubFeature/gatewayInfo/ui/gatewayInfoPage.dart';

bool initFetch = true;
TextEditingController _searchController = TextEditingController();
List<GatewaylistModel>? gatewayListFiltered;

List<GatewaylistModel>? filterSiteList(List<GatewaylistModel>? siteDataList) {
  // If search content is empty or the search field is null, return all gateways.
  if (_searchController.text.isEmpty) {
    return siteDataList;
  }

  return siteDataList!.where((siteList) {
    return siteList.serialNumber
        .toString()
        .toLowerCase()
        .contains(_searchController.text.toLowerCase());
  }).toList();
}

class CustomerGatewayPage extends StatefulWidget {
  String orgId;
  CustomerGatewayPage({required this.orgId});

  @override
  State<CustomerGatewayPage> createState() => _CustomerGatewayPageState();
}

class _CustomerGatewayPageState extends State<CustomerGatewayPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initFetch = true;
  }

  Future<void> initsta(WidgetRef ref) async {
    // var customerSiteOverViewData = await ref
    //     .read(customerGatewayProvider.notifier)
    //     .fetchSiteOverviewDetails(widget.orgId);

    var GatewayListData = await ref
        .read(customerGatewayProvider.notifier)
        .fetchGatewayList(widget.orgId);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, child) {
        if (initFetch) {
          initsta(ref);

          initFetch = false;
        }
        final customerGatewayData = ref.watch(customerGatewayProvider);

        // final dashboardData = ref.watch(dashboardProvider);
        gatewayListFiltered = filterSiteList(customerGatewayData.gatewaylist);

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => createNewGatewayPage(
                          orgId: widget.orgId,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "New Gateway",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
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
                            border: Border.all(
                                color: Color(0xFFC8E7FC), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Serial Number',
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
                              gatewayListFiltered = filterSiteList(
                                  customerGatewayData.gatewaylist);

                              setState(
                                  () {}); // Rebuild the widget whenever the text changes.
                            },
                          ),
                        ),

                        //DATA
                        gatewayListFiltered == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : gatewayListFiltered!.isEmpty
                                ? Center(
                                    child: Text("no Gateways available"),
                                  )
                                : Column(
                                    children: List<Widget>.generate(
                                      gatewayListFiltered!.length,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    GatewayIoInfoInfoPage(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15, top: 10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xFFDCDCDC),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: Column(children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Gateway #${index + 1}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Spacer(),
                                                        gatewayListFiltered![
                                                                        index]
                                                                    .connectivityStatus !=
                                                                0
                                                            ? // condition for online
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD5F3E7),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            2),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .circle,
                                                                      color: Color(
                                                                          0xFF2BC185),
                                                                      size: 10,
                                                                    ),
                                                                    Text(
                                                                      "Online",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Color(
                                                                            0xFF2BC185),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFFEBEB),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            2),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .circle,
                                                                      color: Color(
                                                                          0xFFFF3333),
                                                                      size: 10,
                                                                    ),
                                                                    Text(
                                                                      "Offline",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Color(
                                                                            0xFFFF3333),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "#${gatewayListFiltered![index].serialNumber}",
                                                      style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF7C7C82)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                height: 30,
                                                color: Color(0xFFDCDCDC),
                                              ),
                                              Row(
                                                children: [
                                                  Spacer(),
                                                  gatewayListFiltered![index]
                                                              .configurationStatus ==
                                                          0
                                                      ? // condition for configuration
                                                      GestureDetector(
                                                          onTap: () async {
                                                            //
                                                            var CongigureConfirmation =
                                                                await showConfigureDeviceBottomSnackBAR(
                                                                    context);
                                                            (context);
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/icon/configure.png',
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                "Configure Device",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0XFF2F3789),
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () {
                                                            var TitleMessage =
                                                                "Delete Door?";
                                                            var subTitleMessage =
                                                                "Are you sure you want to delete this door ? This will detach it from Falcon X and delete all it’s data. Detached devices will be available in the detached devices tab.";
                                                            // showDeketeBottomSnackBAR(
                                                            //     context, //void Function() refresh,
                                                            //     TitleMessage,
                                                            //     subTitleMessage);
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/icon/deleteBinIcon.png',
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0XFFF94444),
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                  Spacer(),
                                                  Container(
                                                    height: 20,
                                                    width: 1.5,
                                                    color: Color(0xFFDCDCDC),
                                                  ),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FindWifiPage()));
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.wifi,
                                                          color:
                                                              Color(0XFF2F3789),
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          "Connect to WIFI",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0XFF2F3789),
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),

                                              ///
                                            ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
