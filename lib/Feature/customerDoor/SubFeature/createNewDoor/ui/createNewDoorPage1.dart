import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../../Gobal File/gobalconfigData.dart';
import '../../../../customerSite/Modal/sites_Model.dart';
import '../../../../customerSite/Services/customerSiteProvider.dart';
import 'createNewDoorPage2.dart';

TextEditingController _doorNameController = TextEditingController();
TextEditingController _siteController = TextEditingController();
TextEditingController _networkController = TextEditingController();
TextEditingController _installationMethodController = TextEditingController();
TextEditingController _configurationController = TextEditingController();
late int siteIdController;
late int networkIdController;
late int installationMethodValue;
late int configurationValue;

bool showNextButton = false;

class CreateNewDoorPage1 extends StatefulWidget {
  String orgId;
  CreateNewDoorPage1({super.key, required this.orgId});

  @override
  State<CreateNewDoorPage1> createState() => _CreateNewDoorPage1State();
}

class _CreateNewDoorPage1State extends State<CreateNewDoorPage1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _doorNameController.clear();
    _siteController.clear();
    _networkController.clear();
    _installationMethodController.clear();
    _configurationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (_doorNameController.text != "" &&
        _siteController.text != "" &&
        _networkController.text != "" &&
        _installationMethodController.text != "" &&
        _configurationController.text != "") {
      showNextButton = true;
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
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: const Color(0xFF6E88C9),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Add New Door',
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
                          'Door Details (1/3)',
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
                            TextFormField(
                              controller: _doorNameController,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                              ),
                              decoration: InputDecoration(
                                labelText: "Door Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFE0E0E0)), // Set the enabled border color to black
                                ),
                              ),
                            ),

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
                        GestureDetector(
                          onTap: () {
                            if (showNextButton) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateNewDoorPage2(
                                        orgId: widget.orgId,
                                        doorNameController: _doorNameController,
                                        siteIdController: siteIdController,
                                        networkIdController:
                                            networkIdController,
                                        installationMethodValue:
                                            installationMethodValue,
                                        configurationValue: configurationValue,
                                      )));
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
                                "NEXT",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
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
    "Retrofit Type -1",
    "Retrofit Type -2"
  ];
  List<int> InstallationMethodvalue = [1, 2, 3];
  int? selectOption;
  var _selectedInstallationMethod;

  var _selectedInstallationvalue;
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
                                  _selectedInstallationvalue =
                                      InstallationMethodvalue[index];
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
                  installationMethodValue = _selectedInstallationvalue;

                  _configurationController.clear();
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
    // "Entry + Exit reader",
    // "Entry reader + REX",
    // "Entry Reader + Door Controller + REX",
    // "Door Controller + REX",
    // "Clock-In device",
    // "Door Lock",
  ];
  List<int> ConfigurationValue = [];

  if (installationMethodValue == 1) {
    for (int i = 0; i < newInstallConfigs.length; i++) {
      ConfigurationList.add(newInstallConfigs[i].name);
      ConfigurationValue.add(newInstallConfigs[i].value);
    }
  } else if (installationMethodValue == 2 || installationMethodValue == 3) {
    for (int i = 0; i < retrofitType1Configs.length; i++) {
      ConfigurationList.add(retrofitType1Configs[i].name);
      ConfigurationValue.add(retrofitType1Configs[i].value);
    }
  }
  int? selectOption;
  var _selectedConfiguration;
  var _selectedConfigurationValue;
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
                  child: Text("Country",
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
                                  _selectedConfigurationValue =
                                      ConfigurationValue[index];
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
                  configurationValue = _selectedConfigurationValue;
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
