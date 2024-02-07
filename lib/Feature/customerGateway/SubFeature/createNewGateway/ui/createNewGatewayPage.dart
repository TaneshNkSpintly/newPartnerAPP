import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../../../../../Gobal File/gobalconfigData.dart';
import '../../../../customerDoor/SubFeature/editDoor/ui/qrScanDevicePage.dart';
import '../../../../customerSite/Modal/sites_Model.dart';
import '../../../../customerSite/Services/customerSiteProvider.dart';
import '../../../Services/customerGatewayProvider.dart';

TextEditingController _siteController = TextEditingController();
TextEditingController _networkController = TextEditingController();
TextEditingController _gatewaySerialNoController = TextEditingController();
late int siteIdController;
late int networkIdController;
late int installationMethodValue;
late int configurationValue;

String errorGatewaySerial = 'inital';

bool showNextButton = false;
bool showCreationLoad = false;

class createNewGatewayPage extends StatefulWidget {
  String orgId;
  createNewGatewayPage({super.key, required this.orgId});

  @override
  State<createNewGatewayPage> createState() => _createNewGatewayPageState();
}

class _createNewGatewayPageState extends State<createNewGatewayPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteController.clear();
    _networkController.clear();
    _gatewaySerialNoController.clear();
    showNextButton = false;
    showCreationLoad = false;
  }

  String validateSerialNumber(String value, List<String> validationList) {
    if (value.length != 14) {
      return "Serial number doesn't support the configuration";
    }

    String firstFourDigits = value.substring(0, 4);

    if (!validationList.contains(firstFourDigits)) {
      return "Serial number doesn't support the configuration";
    }

    return ""; // Return null to indicate the input is valid
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (_siteController.text != "" &&
        _networkController.text != "" &&
        (errorGatewaySerial == "" || errorGatewaySerial == "inital")) {
      showNextButton = true;
      setState(() {});
    } else {
      showNextButton = false;
      setState(() {});
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        //  for (int i = 0; i < 3; i++)
                        Container(
                          height: 6,
                          width: screenSize.width * 0.9,
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
                          'Add New Gateway',
                          style: TextStyle(
                              fontFamily: 'Inter',
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
                          'Gateway (1/1)',
                          style: TextStyle(
                              fontFamily: 'Inter',
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
                            GestureDetector(
                              onTap: () {
                                _showSitType(context, refresh);
                              },
                              child: TextFormField(
                                controller: _siteController,
                                enabled: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Site',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    onPressed: () {
                                      _showSitType(context, refresh);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_siteController.text != "")
                                  _showNetworkType(context, refresh);
                              },
                              child: TextFormField(
                                controller: _networkController,
                                enabled: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Network',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    onPressed: () {
                                      _showNetworkType(context, refresh);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            //

                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Color(0xFFE0E0E0))),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _gatewaySerialNoController,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: 'Entry Device',
                                        // hintText: 'Entry Serial Number',
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,

                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(14),
                                      ],
                                      onChanged: (value) {
                                        //gatway validation
                                        List<String> validationListGateway = [
                                          "101C",
                                        ];
                                        errorGatewaySerial =
                                            validateSerialNumber(
                                                value, validationListGateway);
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // ignore: unused_local_variable
                                      var result = await Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  QRScanDevicePage()));
                                      if (result != null && result != "0") {
                                        setState(() {
                                          _gatewaySerialNoController.text =
                                              result.toString();
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.qr_code_scanner,
                                      size: 25,
                                      color: primaryButtonColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (errorGatewaySerial != "inital")
                              Text(
                                "$errorGatewaySerial",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 11),
                              ),

                            //
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
                            Navigator.of(context).pop();
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
                        // showCreationLoad
                        //     ? Center(
                        //         child: CircularProgressIndicator(),
                        //       )
                        //     :
                        Consumer(
                          builder: (context, ref, child) {
                            final customerDoorData =
                                ref.watch(customerGatewayProvider);

                            // final dashboardData = ref.watch(dashboardProvider);

                            return GestureDetector(
                              onTap: () async {
                                if (showNextButton) {
                                  showCreationLoad = true;
                                  setState(() {});
                                  MessageResponse? ResultCreateNewGateway =
                                      await ref
                                          .read(
                                              customerGatewayProvider.notifier)
                                          .createAccessGatewayPost(
                                            widget.orgId,
                                            siteIdController,
                                            networkIdController,
                                            _gatewaySerialNoController.text
                                                .toString(),
                                          );
                                  print(
                                      "ResultCreateNewGateway==type: ${ResultCreateNewGateway!.type}");
                                  if (ResultCreateNewGateway!.type ==
                                      "success") {
                                    var Title = "Gateway Added";
                                    var SubTitle =
                                        "New gateway ‘${_gatewaySerialNoController.text.toString()}’ has been successfully added in Site ${_siteController.text} ";
                                    await showSccessBottomSnackBAR(
                                        context, Title, SubTitle);
                                  } else if (ResultCreateNewGateway!.type ==
                                      "error") {
                                    String errorMessage = ResultCreateNewGateway
                                        .errorMessage!.errorMessage;
                                    var title = "Couldn't add the Door!";
                                    var subtitle = "$errorMessage";
                                    await showUnsccessBottomSnackBAR(
                                        context, title, subtitle);
                                  }
                                  Navigator.of(context).popUntil((route) =>
                                      route.settings.name == '/BotoomNavBar');
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
                                child: showCreationLoad
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          "ADD GATEWAY",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

//
void _showSitType(BuildContext context, void Function() refresh) {
  //List<String> SiteList = ["Lake Plaza Office ", "Lake Plaza Office "];
  int? selectOption;
  var _selectedSiteId;
  var _selectedSiteName;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Consumer(
          builder: (context, ref, child) {
            final customerSiteData = ref.watch(customerSiteProvider);
            return Container(
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust the height as needed
              child: Column(
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
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Site",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  Expanded(
                    child: customerSiteData.SiteList == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: customerSiteData.SiteList!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                      title: Text(customerSiteData
                                          .SiteList![index].name),
                                      trailing: Radio<int>(
                                        value: index,
                                        groupValue: selectOption,
                                        onChanged: (int? value) {
                                          setState(() {
                                            selectOption = value!;
                                            _selectedSiteId = customerSiteData
                                                .SiteList![index].id;
                                            _selectedSiteName = customerSiteData
                                                .SiteList![index].name;
                                          });
                                        },
                                      )),
                                ],
                              );
                            },
                          ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _siteController.text = _selectedSiteName;
                      siteIdController = _selectedSiteId;
                      _networkController.clear();
                      setState(() {});
                      refresh();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryButtonColor),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            );
          },
        );
      });
    },
  );
}

void _showNetworkType(BuildContext context, void Function() refresh) {
  // List<String> NewtorkList = [
  //   "Lake Plaza Office - First Floor",
  //   "Lake Plaza Office - Second Floor"
  // ];
  SitesModel? NewtorkList;

  int? selectOption;
  var _selectedNewtork;
  var _selectedNewtorkid;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Consumer(
          builder: (context, ref, child) {
            final customerSiteData = ref.watch(customerSiteProvider);
            if (_siteController.text != "") {
              try {
                NewtorkList = customerSiteData.SiteList!.firstWhere(
                  (siteList) => siteList.id == siteIdController,
                );
              } catch (e) {
                print("Network not found with ID $siteIdController");
              }
            }
            return Container(
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust the height as needed
              child: Column(
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
                      child: Text("Network",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  Expanded(
                    child: (NewtorkList == null)
                        ? Center(
                            child: Text("no network"),
                          )
                        : ListView.builder(
                            itemCount: NewtorkList!.networks.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                      title: Text(
                                          NewtorkList!.networks[index].name),
                                      trailing: Radio<int>(
                                        value: index,
                                        groupValue: selectOption,
                                        onChanged: (int? value) {
                                          setState(() {
                                            selectOption = value!;
                                            _selectedNewtork = NewtorkList!
                                                .networks[index].name;
                                            _selectedNewtorkid =
                                                NewtorkList!.networks[index].id;
                                          });
                                        },
                                      )),
                                ],
                              );
                            },
                          ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _networkController.text = _selectedNewtork;
                      networkIdController = _selectedNewtorkid;

                      setState(() {});
                      refresh();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      // height: screenSize.height * 0.05,
                      // width: screenSize.width * 0.85,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryButtonColor),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            );
          },
        );
      });
    },
  );
}
