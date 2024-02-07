import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/customerSite/Services/customerSiteProvider.dart';

import '../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../Gobal File/GobalModel.dart';
import '../../../Gobal File/GobalVariable.dart';
import '../../dashboard/Services/dashboardProvider.dart';
import '../Modal/sites_Model.dart';
import '../SubFeature/createNewSite/ui/createNewSite.dart';
import '../SubFeature/customerInfoPage/ui/customerInfoPage.dart';
import '../SubFeature/siteInfoPage/ui/siteInfoPage.dart';

TextEditingController _searchController = TextEditingController();
int searchSection = 0;
ValueNotifier<bool> _minimizeA = ValueNotifier<bool>(false);
double _lastScrollOffset = 0.0;
bool initFetch = true;
int? indexOrg;

List<SitesModel>? SiteListFiltered;

List<SitesModel>? filterSiteList(List<SitesModel>? siteDataList) {
  // If search content is empty or the search field is null, return all gateways.
  if (_searchController.text.isEmpty) {
    return siteDataList;
  }

  return siteDataList!.where((siteList) {
    return siteList.name
        .toString()
        .toLowerCase()
        .contains(_searchController.text.toLowerCase());
  }).toList();
}

class CustomerSitesPage extends StatefulWidget {
  String orgId;
  CustomerSitesPage({super.key, required this.orgId});

  @override
  State<CustomerSitesPage> createState() => _CustomerSitesPageState();
}

class _CustomerSitesPageState extends State<CustomerSitesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initFetch = true;
  }

  DasboardSiteContainer dasboardSiteContainer = DasboardSiteContainer();

//function
  refresh() {
    setState(() {});
  }

  Future<void> initsta(WidgetRef ref) async {
    var customerSiteOverViewData = await ref
        .read(customerSiteProvider.notifier)
        .fetchSiteOverviewDetails(widget.orgId);

    ///dashboardcontainer iniat;ilesed
    if (customerSiteOverViewData != null) {
      dasboardSiteContainer.dataNumbers
          .add(customerSiteOverViewData.noOfSites.toString());
      dasboardSiteContainer.dataNumbers
          .add(customerSiteOverViewData.noOfAccessPoints.toString());
      dasboardSiteContainer.dataNumbers
          .add(customerSiteOverViewData.noOfDetachedDevices.toString());
      dasboardSiteContainer.dataNumbers
          .add(customerSiteOverViewData.noOfDevices.toString());
      dasboardSiteContainer.dataNumbers
          .add(customerSiteOverViewData.noOfGateways.toString());

      dasboardSiteContainer.dataNumbers
          .add(customerSiteOverViewData.noOfMeshIOs.toString());
    }
    var SiteListData = await ref
        .read(customerSiteProvider.notifier)
        .fetchSitesDetails(widget.orgId);

    var orgDetailData = await ref
        .read(customerSiteProvider.notifier)
        .fetchSelectedOrgDetails(widget.orgId);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Consumer(
        builder: (context, ref, child) {
          if (initFetch) {
            initsta(ref);

            initFetch = false;
          }
          final customerSiteOverViewData = ref.watch(customerSiteProvider);

          // final dashboardData = ref.watch(dashboardProvider);
          SiteListFiltered = filterSiteList(customerSiteOverViewData.SiteList);

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [],
              backgroundColor: themeColor,
              title: customerSiteOverViewData.organisationDetailsModel == null
                  ? Row()
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF6E88C9),
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FractionallySizedBox(
                              //     widthFactor: 0.5, // Set the width factor to 50%
                              child: Text(
                                '${customerSiteOverViewData.organisationDetailsModel!.generalSetting.name}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CustomerInfoPage(
                                      orgId: widget.orgId,
                                    )));
                          },
                          child: Text(
                            'Customer Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
            ),
            body: dasboardSiteContainer.dataNumbers.length < 6
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: screenSize.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            themeColor,
                            themeColor,
                            Colors.white,
                            Colors.white
                          ],
                          stops: [0.0, 0.2, 0.3, 1.0],
                        ),
                        //  color: themeColor //Colors.white,
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                color: themeColor,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(6, (index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 15, top: 10, bottom: 15),
                                        width: screenSize.width * 0.4,
                                        decoration: BoxDecoration(
                                          color: dasboardSiteContainer
                                              .CardColor[index],
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
                                                '${dasboardSiteContainer.heading[index]}',
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
                                              Text(
                                                "${dasboardSiteContainer.dataNumbers[index]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 21,
                                                    fontFamily: 'Inter',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ContainerListOfSites(
                              orgId: widget.orgId,
                              refreshParent: refresh,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class ContainerListOfSites extends StatefulWidget {
  final Function refreshParent;

  String orgId;
  ContainerListOfSites({required this.refreshParent, required this.orgId});

  @override
  _ContainerListOfSitesState createState() => _ContainerListOfSitesState();
}

var subtextStleGrey = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xFF8E8D92));

var subtextStleBlack = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black);

class _ContainerListOfSitesState extends State<ContainerListOfSites> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    return Consumer(
      builder: (context, ref, child) {
        // if (initFetch) {
        //   initsta(ref);

        //   initFetch = false;
        // }
        final customerSiteOverViewData = ref.watch(customerSiteProvider);
        return Column(
          children: [
            Container(
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
                        margin: EdgeInsets.only(top: 5, left: 2, right: 2),
                        height: 5,
                        width: screenSize.width * 0.24,
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
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sites",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: Colors.black),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewSite(
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
                              color: Color(0xFF2F3789),
                            ),
                            Text(
                              "New Sites",
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFC8E7FC), width: 1.5),
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
                        SiteListFiltered =
                            filterSiteList(customerSiteOverViewData.SiteList);

                        setState(
                            () {}); // Rebuild the widget whenever the text changes.
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Colors.white),
              //  height: screenSize.height * 0.6,
              child: SiteListFiltered == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SiteListFiltered!.isEmpty
                      ? Center(
                          child: Text("no sites"),
                        )
                      : SingleChildScrollView(
                          child: Column(children: [
                            Column(
                              children:
                                  // for (int i = 0; i < 7; i++)
                                  List<Widget>.generate(
                                      SiteListFiltered!.length, (index) {
                                // print(index);
                                print("ALL Sites");
                                print(index);

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SiteInfoPage(siteIdex: index,orgId: widget.orgId,),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 12),
                                          margin: EdgeInsets.only(
                                              left: 15, right: 15, top: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFFDCDCDC),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "${SiteListFiltered![index].name}",
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      var title = "Delete Site";
                                                      var subtitle =
                                                          "Are you sure you want to delete this site “IT Hub” ?";
                                                      var result =
                                                          await showDeketeBottomSnackBAR(
                                                              context,
                                                              title,
                                                              subtitle);

                                                      if (result == 1) {
                                                        MessageResponse?
                                                            SiteDeteResult =
                                                            await ref
                                                                .read(customerSiteProvider
                                                                    .notifier)
                                                                .deleteAnSite(
                                                                    SiteListFiltered![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                    widget
                                                                        .orgId);

                                                        if (SiteDeteResult!
                                                                .type ==
                                                            "success") {
                                                          

                                                          List<SitesModel>? x = await ref
                                                              .read(
                                                                  customerSiteProvider
                                                                      .notifier)
                                                              .fetchSitesDetails(
                                                                  widget.orgId);
                                                          ////////////////////////////////////
                                                          ////////////////////////////
                                                          print(
                                                              " SUCCESSt: ${x!.length}");
                                                          String siteName =
                                                              SiteListFiltered![
                                                                      index]
                                                                  .name
                                                                  .toString();
                                                          String custName =
                                                              customerSiteOverViewData
                                                                  .organisationDetailsModel!
                                                                  .generalSetting
                                                                  .name;

                                                          String Title =
                                                              "Site Deleted Successfully";
                                                          var Subtitle =
                                                              "You successfully deleted the site $siteName for customer $custName.";
                                                          await showSccessBottomSnackBAR(
                                                              context,
                                                              Title,
                                                              Subtitle,
                                                              refresh: refresh);

                                                          print(
                                                              "customerSiteOverViewData.SiteList${customerSiteOverViewData.SiteList!.length}");
                                                          setState(() {});
                                                        } else {
                                                          print("FAILED");
                                                          var title =
                                                              "Failed to Delete Site";
                                                          var subtitle =
                                                              "Failed to delete the site because there are networks under it. Delete the networks and then try deleting the site again.";
                                                          showUnsccessBottomSnackBAR(
                                                              context,
                                                              title,
                                                              subtitle);
                                                        }
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: Image.asset(
                                                            'assets/icon/deleteBinIcon.png', // Replace with your image path
                                                          ),
                                                        ),
                                                        Text(
                                                          "Remove",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 13,
                                                              //fontWeight: FontWeight.w400,
                                                              color:
                                                                  Colors.red),
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
                                                    "Site Location:",
                                                    style: subtextStleGrey,
                                                  ),
                                                  Text(
                                                      "${SiteListFiltered![index].location}",
                                                      style: subtextStleBlack),
                                                  Spacer(),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Networks:",
                                                    style: subtextStleGrey,
                                                  ),
                                                  Text(
                                                    "${SiteListFiltered![index].networks.length.toString()}",
                                                    style: subtextStleBlack,
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Timezone:",
                                                    style: subtextStleGrey,
                                                  ),
                                                  Text(
                                                    "${SiteListFiltered![index].timezone}",
                                                    style: subtextStleBlack,
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                );
                              }),
                              //   ],
                            ),
                          ]),
                        ),
            )
                //;
                //   },
                // ),
                ),
          ],
        );
      },
    );
  }
}

final class DasboardSiteContainer {
  List<String> heading = [
    "Total Sites",
    "Total Doors",
    "Deteched Devices",
    "Total Devices",
    "Total Gateways",
    "Total Mesh/IO"
  ];
  List<String> dataNumbers = [];
  List CardColor = [
    Color(0xFF4E56AD),
    Color(0xFFE03F6B),
    Color(0xFFF8A62C),
    Color(0xFF0DA678),
    Color.fromARGB(255, 2, 202, 216),
    Color.fromARGB(255, 248, 44, 61),
  ];
}
