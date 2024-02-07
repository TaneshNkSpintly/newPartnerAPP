import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/Feature/customerSite/SubFeature/createNewSite/ui/createNewSitePage2.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';

import '../../../../dashboard/SubFeatures/createNewCustomer/ui/createNewCustomerPage2_Location.dart';

TextEditingController _siteNameController = TextEditingController();
TextEditingController _siteLocationController = TextEditingController();
TextEditingController _timezoneController = TextEditingController();
bool showNextButton = false;

class CreateNewSite extends StatefulWidget {
  String orgId;
  CreateNewSite({super.key, required this.orgId});

  @override
  State<CreateNewSite> createState() => _CreateNewSiteState();
}

class _CreateNewSiteState extends State<CreateNewSite> {
  @override
  void dispose() {
    // TODO: implement dispose
    _siteNameController.clear();
    _siteLocationController.clear();
    _timezoneController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    _siteLocationController.text = "Goa"; // remove

    if (_siteNameController.text != " " &&
        _siteLocationController.text != "" &&
        _timezoneController.text != "") {
      showNextButton = true;
      setState(() {});
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 2; i++)
                  Container(
                    height: 6,
                    width: screenSize.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: i == 1 ? Color(0xFFEFEBEB) : Color(0xFF6DBDF3),
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
                  'Create New Site',
                  style: TextStyle(
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
                  'Site Details',
                  style: TextStyle(
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
                      controller: _siteNameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Site Name",
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
                        //   navigation to location page

                        // ignore: unused_local_variable
                        var result = Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    createNewCustomerPage2_Location()));
                      },
                      child: TextFormField(
                        controller: _siteLocationController,
                        enabled: false,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Site Location',
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showTimezonePicker(context, refresh);
                      },
                      child: TextFormField(
                        controller: _timezoneController,
                        enabled: false,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Timezone',
                          labelStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 25,
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
                  onTap: () async {
                    if (showNextButton) {
                      var result =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CreateNewSitePage2(
                                    orgId: widget.orgId,
                                    siteLocationController:
                                        _siteLocationController,
                                    siteNameController: _siteNameController,
                                    timezoneController: _timezoneController,
                                  )));

                      if (result == 1) Navigator.pop(context);
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
                        "PROCEED",
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
    );
  }
}

//

void showTimezonePicker(BuildContext context, void Function() refresh) {
  List<String> TimezoneOptionList = [
    "IST (UTC+05:30) Mumbai",
    "EDT (UTC-04:00) New York",
    "CDT (UTC-05:00) Chicago",
    "PDT (UTC-07:00) Los Angeles",
    "AKDT (UTC-08:00) Anchorage",
    "HST (UTC-10:00) Honolulu",
    "Option 2",
    "Option 3"
  ];
  int? selectOption;
  var _selectedTimezone;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.7, // Adjust the height as needed
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
                  child: Text("Timezone",
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
              //content
              Expanded(
                child: ListView.builder(
                  itemCount: TimezoneOptionList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(TimezoneOptionList[index]),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectOption = value!;
                                  _selectedTimezone = TimezoneOptionList[index];
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
                  _timezoneController.text = _selectedTimezone;
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
      });
    },
  );
}
