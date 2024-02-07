import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../../controller/SubFeature/controllerInfo/ui/bottomSnackbars.dart';
import '../Model/meshIoList_Model.dart';
import '../Services/meshIOProvider.dart';
import '../SubFeature/createNewMeshIo/ui/createNewMeshIoPage.dart';
import '../SubFeature/meshInfo/ui/meshIoInfoPage.dart';

bool initFetch = true;

TextEditingController _searchController = TextEditingController();

List<MeshioListModel>? meshIoListFiltered;

List<MeshioListModel>? filterMeshIoList(List<MeshioListModel>? meshIoList) {
  // If search content is empty or the search field is null, return all gateways.
  if (_searchController.text.isEmpty) {
    return meshIoList;
  }

  return meshIoList!.where((siteList) {
    return siteList.name
        .toString()
        .toLowerCase()
        .contains(_searchController.text.toLowerCase());
  }).toList();
}

class CustomerMeshIOPage extends StatefulWidget {
  final VoidCallback onReplace;
  String orgId;
  CustomerMeshIOPage({required this.onReplace, required this.orgId});

  @override
  State<CustomerMeshIOPage> createState() => _CustomerMeshIOPageState();
}

class _CustomerMeshIOPageState extends State<CustomerMeshIOPage> {
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

    var DoorListData = await ref
        .read(meshIODataProvider.notifier)
        .fetchMeshIoList(widget.orgId);
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
        final customerMeshIOData = ref.watch(meshIODataProvider);

        // final dashboardData = ref.watch(dashboardProvider);
        meshIoListFiltered = filterMeshIoList(customerMeshIOData.meshioList);

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
                        builder: (context) => CreateNewMeshIOPage(
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
                        "Mesh I/O",
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
                        'Mesh I/O',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6DBDF3),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          // height: 0.11,
                        ),
                      ),
                    ),
                  ),
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
                          'Controller',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7C7C82),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            //    height: 0.11,
                          ),
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
                        meshIoListFiltered == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : meshIoListFiltered!.isEmpty
                                ? Center(
                                    child: Text("no meshIO available"),
                                  )
                                : Column(
                                    children: List<Widget>.generate(
                                      meshIoListFiltered!.length,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MeshIoInfoInfoPage(),
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
                                                          "${meshIoListFiltered![index].name}",
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
                                                        meshIoListFiltered![
                                                                        index]
                                                                    .configurationStatus !=
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
                                                      "${meshIoListFiltered![index].serialNumber}",
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
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
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Configure Device",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0XFF2F3789),
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  )
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
