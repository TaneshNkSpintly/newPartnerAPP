import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../../customerDoor/SubFeature/editDoor/ui/qrScanDevicePage.dart';
import '../../../../../../customerSite/Modal/sites_Model.dart';
import '../../../../../../customerSite/Services/customerSiteProvider.dart';
import 'createNewControllerPage2.dart';

TextEditingController _siteController = TextEditingController();
TextEditingController _networkController = TextEditingController();
TextEditingController _controllerSerialNoController = TextEditingController();

TextEditingController _installationMethodController = TextEditingController();
TextEditingController _configurationController = TextEditingController();

late int siteIdController;
late int networkIdController;
late int installationMethodValue;
late int configurationValue;

String errorGatewaySerial = 'inital';

bool showNextButton = false;
bool showCreationLoad = false;

class CreateNewControllerPage1 extends StatefulWidget {
  String orgId;
  CreateNewControllerPage1({super.key, required this.orgId});

  @override
  State<CreateNewControllerPage1> createState() =>
      _CreateNewControllerPage1State();
}

class _CreateNewControllerPage1State extends State<CreateNewControllerPage1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteController.clear();
    _networkController.clear();
    _controllerSerialNoController.clear();

    _installationMethodController.clear();
    _configurationController.clear();
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
                        for (int i = 0; i < 3; i++)
                          Container(
                            height: 6,
                            width: screenSize.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: i == 0
                                  ? Color(0xFF6DBDF3)
                                  : Color(0xFFEFEBEB),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: const Color(0xFF6E88C9),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Add New Controller',
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
                          'Basic Details (1/3)',
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
                            GestureDetector(
                              onTap: () {
                                _showInstallationMethodType(context, refresh);
                              },
                              child: TextFormField(
                                controller: _installationMethodController,
                                enabled: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Installation Method',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    onPressed: () {
                                      _showInstallationMethodType(
                                          context, refresh);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_installationMethodController.text != "")
                                  _showConfigurationType(context, refresh);
                              },
                              child: TextFormField(
                                controller: _configurationController,
                                enabled: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Configuration',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    onPressed: () {
                                      _showConfigurationType(context, refresh);
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
                                      controller: _controllerSerialNoController,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: 'Controller Serial Number',
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
                                        List<String> validationListMeshIO = [
                                          "1027",
                                          "102C"
                                        ];
                                        errorGatewaySerial =
                                            validateSerialNumber(
                                                value, validationListMeshIO);
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
                                          _controllerSerialNoController.text =
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
                            // final customerDoorData =
                            //     ref.watch(meshIODataProvider);

                            return GestureDetector(
                              onTap: () async {
                                if (showNextButton) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CreateNewControllerPage2(
                                            orgId: widget.orgId,
                                            siteIdController: siteIdController,
                                            networkIdController:
                                                networkIdController,
                                            configurationValue:
                                                configurationValue,
                                            controllerSerialNoController:
                                                _controllerSerialNoController,
                                            installationMethodValue:
                                                installationMethodValue,
                                          )));
                                  setState(() {});
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
                                          "NEXT",
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

void _showInstallationMethodType(
    BuildContext context, void Function() refresh) {
  List<String> InstallationMethodList = [
    "New Installation",
  ];

  List<int> IstallationvalueList = [1];

  int? selectOption;
  var _selectedInstallationMethod;
  late int selectedIstallationvalue;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
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
                  child: Text("Installation Method",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: InstallationMethodList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(InstallationMethodList[index]),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectOption = value!;
                                  _selectedInstallationMethod =
                                      InstallationMethodList[index];
                                  selectedIstallationvalue =
                                      IstallationvalueList[index];
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
                  _installationMethodController.text =
                      _selectedInstallationMethod;
                  installationMethodValue = selectedIstallationvalue;
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
      });
    },
  );
}

void _showConfigurationType(BuildContext context, void Function() refresh) {
  List<String> ConfigurationList = [
    "Entry Reader + Door Controller",
    "Door Controller + Rex",
  ];
  List<int> ConfigurationListvalue = [3, 4];

  int? selectOption;
  var _selectedConfiguration;

  late int _selectedConfigurationvalue;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
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
                  child: Text("Configuration Type",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ConfigurationList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(ConfigurationList[index]),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectOption = value!;
                                  _selectedConfiguration =
                                      ConfigurationList[index];
                                  _selectedConfigurationvalue =
                                      ConfigurationListvalue[index];
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
                  _configurationController.text = _selectedConfiguration;
                  configurationValue = _selectedConfigurationvalue;
                  print("conf$configurationValue");
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
      });
    },
  );
}
