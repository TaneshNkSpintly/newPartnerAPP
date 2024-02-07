import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Gobal File/GobalVariable.dart';
import '../SubFeature/createNewController/ui/createNewControllerPage1.dart';
import '../../../../customerDoor/Model/accessPointList_Model.dart';
import '../Services/controllerProvider.dart';
import '../SubFeature/controllerInfo/ui/controllerInfoPage.dart';

bool initFetch = true;

TextEditingController _searchController = TextEditingController();

List<AccessPointListModel>? controllerListFiltered;

List<AccessPointListModel>? filterControllerList(
    List<AccessPointListModel>? controllerList) {
  // If search content is empty or the search field is null, return all gateways.
  if (_searchController.text.isEmpty) {
    return controllerList;
  }

  return controllerList!.where((siteList) {
    return siteList.siteName
        .toString()
        .toLowerCase()
        .contains(_searchController.text.toLowerCase());
  }).toList();
}

class CustomerControllerPage extends StatefulWidget {
  final VoidCallback onReplace;
  String orgId;
  CustomerControllerPage({required this.onReplace, required this.orgId});

  @override
  State<CustomerControllerPage> createState() => _CustomerControllerPageState();
}

class _CustomerControllerPageState extends State<CustomerControllerPage> {
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

    await ref
        .read(customerControllerProvider.notifier)
        .fetchControllerList(widget.orgId);
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
        final customerControllerData = ref.watch(customerControllerProvider);

        // final dashboardData = ref.watch(dashboardProvider);
        controllerListFiltered =
            filterControllerList(customerControllerData.controllerList);
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
                        builder: (context) => CreateNewControllerPage1(
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
                        "Controller",
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onReplace();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFDBDBDB)),
                          borderRadius: BorderRadius.circular(42),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Mesh I/O',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7C7C82),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            // height: 0.11,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF0F8FE),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF6DBDF3)),
                        borderRadius: BorderRadius.circular(42),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Controller',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6DBDF3),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          //    height: 0.11,
                        ),
                      ),
                    ),
                  ),
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
                        controllerListFiltered == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : controllerListFiltered!.isEmpty
                                ? Center(
                                    child: Text("no controller available"),
                                  )
                                : Column(
                                    children: List<Widget>.generate(
                                      controllerListFiltered!.length,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ControllerInfoPage(),
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
                                                          "#${controllerListFiltered![index].name}",
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
                                                      ],
                                                    ),
                                                    Text(
                                                      "${controllerListFiltered![index].channelNo} Channel",
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
                                                  GestureDetector(
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
                                                          "Delete ",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0XFFF94444),
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12,
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
                                                              ControllerInfoPage(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "View Info",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF2F3789),
                                                          fontFamily: 'Inter',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
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
