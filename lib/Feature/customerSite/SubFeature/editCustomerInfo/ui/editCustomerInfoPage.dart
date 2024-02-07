import 'dart:async';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:partner_app/Gobal%20File/GlobalFunctionMessages.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../../../../dashboard/SubFeatures/createNewCustomer/Services/createNewCustomerProvider.dart';
import '../../../Services/customerSiteProvider.dart';

TextEditingController _customerNameController = TextEditingController();
TextEditingController _accountTypeController = TextEditingController();
TextEditingController _countryController = TextEditingController();
TextEditingController _adminNameController = TextEditingController();
TextEditingController _adminPhoneController = TextEditingController();
TextEditingController _adminEmailController = TextEditingController();
var selectedCountryFlagController = Country(
  isoCode: "IN",
  phoneCode: "91",
  name: "India",
  iso3Code: "IND",
);
TextEditingController _startDateController = TextEditingController();
TextEditingController _endDateController = TextEditingController();
bool showNextButton = false;

class EditCustomerInfoPage extends StatefulWidget {
  String orgId;
  EditCustomerInfoPage({super.key, required this.orgId});

  @override
  State<EditCustomerInfoPage> createState() => _EditCustomerInfoPageState();
}

class _EditCustomerInfoPageState extends State<EditCustomerInfoPage> {
  bool showMessage = false;
  bool initFetch = true;

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
  void initState() {
    // remove
    // TODO: implement initState
    super.initState();
    initFetch = true;
  }

  initsta(WidgetRef ref) {
    final customerSiteOverViewData = ref.watch(customerSiteProvider);
    _customerNameController.text =
        "${customerSiteOverViewData.organisationDetailsModel!.generalSetting.name}";
    _accountTypeController.text =
        "${customerSiteOverViewData.organisationDetailsModel!.generalSetting.accountType}";
    _adminNameController.text =
        "${customerSiteOverViewData.organisationDetailsModel!.generalSetting.admins[0].name}";
    _adminEmailController.text =
        "${customerSiteOverViewData.organisationDetailsModel!.generalSetting.admins[0].email}";
    _adminPhoneController.text =
        "${customerSiteOverViewData.organisationDetailsModel!.generalSetting.admins[0].phone}";
    _countryController.text = findCountryByValue(customerSiteOverViewData
            .organisationDetailsModel!.generalSetting.country)
        .name;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    Country _CountrieSelected = Country(
      isoCode: "IN",
      phoneCode: "91",
      name: "India",
      iso3Code: "IND",
    );

    return Consumer(
      builder: (context, ref, child) {
        if (initFetch) {
          initsta(ref);

          initFetch = false;
        }
        final customerSiteOverViewData = ref.watch(customerSiteProvider);
        return Scaffold(
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
                  'Edit Customer Info',
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _customerNameController,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                            ),
                            decoration: InputDecoration(
                              labelText: "Customer Name",
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
                              _showAccountType(context, refresh);
                            },
                            child: TextFormField(
                              controller: _accountTypeController,
                              enabled: false,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: 'Account type',
                                labelStyle: TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    _showAccountType(context, refresh);
                                  },
                                ),
                              ),
                            ),
                          ),
                          //
                          if (_accountTypeController.text == "Trial Account")
                            Row(
                              //date
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  width: screenSize.width * 0.35,
                                  child: TextField(
                                    controller: _startDateController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: 'Start Date',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: primaryButtonColor,
                                        ),
                                        onPressed: () {
                                          showDatePicker(
                                              context, refresh, "startDate");
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  width: screenSize.width * 0.35,
                                  child: TextField(
                                    controller: _endDateController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: 'End Date',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: primaryButtonColor,
                                        ),
                                        onPressed: () {
                                          showDatePicker(
                                              context, refresh, "endDate");
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          GestureDetector(
                            onTap: () async {
                              showCountryPicker(context, refresh);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (selectedCountryFlagController !=
                                      null) ...[
                                    Column(
                                      children: [
                                        CountryPickerUtils.getDefaultFlagImage(
                                            selectedCountryFlagController),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                  Expanded(
                                    child: TextFormField(
                                      controller: _countryController,
                                      enabled: false,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: 'Country',
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _adminNameController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Admin Name",
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xFFE0E0E0)), // Set the enabled border color to black
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _adminPhoneController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Admin Phone Number",
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xFFE0E0E0)), // Set the enabled border color to black
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _adminEmailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Admin Email Adddress",
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xFFE0E0E0)), // Set the enabled border color to black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          // var TitleMessage = "Delete Door?";
                          // var subTitleMessage =
                          //    "Are you sure you want to delete this door ? This will detach it from Falcon X and delete all it’s data. Detached devices will be available in the detached devices tab.";
                          // showDeketeBottomSnackBAR(
                          //     context, //void Function() refresh,
                          //     TitleMessage,
                          //     subTitleMessage);
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: primaryButtonColor,
                            border: Border.all(
                              color: primaryButtonColor, // Color(0xFFF94444),
                              width: 2.0,
                            ),
                          ),
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
                      GestureDetector(
                        onTap: () async {
                          CustomerData updatecustomerData = CustomerData(
                              CustomerName:
                                  _customerNameController.text.toString(),
                              AccountTYPE:
                                  _accountTypeController.text.toString(),
                              Country: _countryController.text.toString(),
                              SuperAdminName: _adminNameController,
                              SuperAdminEmail: _adminEmailController,
                              SuperAdminPhone: _adminPhoneController);

                          //
                          var updateCustomerDetailsResult = await ref
                              .read(customerSiteProvider.notifier)
                              .updateCustomerDetailsPatch(
                                widget.orgId,
                                updatecustomerData,
                              );

                          Navigator.pop(context, 1);
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryButtonColor,
                          ),
                          child: Center(
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
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
      },
    );
  }
}

void _showAccountType(BuildContext context, void Function() refresh) {
  var titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  var subtiltleStyle = TextStyle(
    color: Colors.grey,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  var _selectedOption = "Account Type";

  int selectOption = 0;

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                child: Text("Account Type",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
                title: Text('Demo Account', style: titleStyle),
                subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non dapibus nibh.',
                    style: subtiltleStyle),
                trailing: Radio<int>(
                    value: 0,
                    groupValue: selectOption,
                    onChanged: (value) {
                      //  Navigator.pop(context);
                      setState(() {
                        selectOption = value!;
                        _selectedOption = "Demo Account";
                      });
                    })),
            ListTile(
                title: Text('Customer Account', style: titleStyle),
                subtitle: Text('Lorem ipsum dolor sit amet, consectetur .',
                    style: subtiltleStyle),
                trailing: Radio<int>(
                    value: 1,
                    groupValue: selectOption,
                    onChanged: (value) {
                      setState(() {
                        selectOption = value!;
                        _selectedOption = "Customer Account";
                      });
                    })),
            ListTile(
                title: Text('Partner Account', style: titleStyle),
                subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                    style: subtiltleStyle),
                trailing: Radio<int>(
                    value: 2,
                    groupValue: selectOption,
                    onChanged: (value) {
                      setState(() {
                        selectOption = value!;
                        _selectedOption = "Partner Account";
                      });
                    })),
            ListTile(
                title: Text(
                  'Trial Account',
                  style: titleStyle,
                ),
                subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non dapibus nibh.',
                    style: subtiltleStyle),
                trailing: Radio<int>(
                    value: 3,
                    groupValue: selectOption,
                    onChanged: (value) {
                      setState(() {
                        selectOption = value!;
                        _selectedOption = "Trial Account";
                      });
                    })),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                _accountTypeController.text = _selectedOption;
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
        );
      });
    },
  );
}

void showCountryPicker(BuildContext context, void Function() refresh) {
  List<Country> _countryList = countryList;
  TextEditingController _searchController = TextEditingController();
  List<Country> _filteredCountries = _countryList;
  int? selectOption;
  var _selectedCountry;
  var _selectedCountryFlag;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        void filterCountries(String query) {
          setState(() {
            print("test$query");
            _filteredCountries = _countryList
                .where((country) =>
                    country.name.toLowerCase().contains(query.toLowerCase()))
                .toList();
            print("by${_filteredCountries.length}");
          });
        }

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
                  child: Text("Country",
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
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFEDEEF2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (query) {
                          filterCountries(query);
                        },
                        style: TextStyle(color: Color(0xFF8E8D92)),
                        decoration: InputDecoration(
                          hintText: "Search Country",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(_filteredCountries[index].name),
                            leading: CountryPickerUtils.getDefaultFlagImage(
                              _filteredCountries[index],
                            ),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectOption = value!;
                                  _selectedCountry = _filteredCountries[index]
                                      .isoCode
                                      .toString();
                                  _selectedCountryFlag =
                                      _filteredCountries[index];
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
                  _countryController.text = _selectedCountry;
                  selectedCountryFlagController = _selectedCountryFlag;
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

void showDatePicker(
    BuildContext context, void Function() refresh, String dateType) {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _firstDay = DateTime(2000);
  DateTime _lastDay = DateTime(2101);

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        final Size screenSize = MediaQuery.of(context).size;
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      setState(() {
                        _selectedDay = DateTime(
                            _selectedDay.year, _selectedDay.month - 1, 1);
                      });
                    },
                  ),
                  Text(
                    DateFormat.yMMMM().format(_selectedDay),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      setState(() {
                        _selectedDay = DateTime(
                            _selectedDay.year, _selectedDay.month + 1, 1);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                width: screenSize.width * 0.9,
                child: Divider(
                  height: 10,
                  color: Color(0xFFE5E7EB),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // Calendar
              Expanded(
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _selectedDay,
                  firstDay: _firstDay,
                  lastDay: _lastDay,
                  headerVisible: false,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: screenSize.height * 0.05,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      if (dateType == "startDate") {
                        _startDateController.text =
                            "${_selectedDay.toLocal()}".split(' ')[0];
                      } else {
                        _endDateController.text =
                            "${_selectedDay.toLocal()}".split(' ')[0];
                      }
                      setState(() {});
                      refresh();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: screenSize.height * 0.05,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryButtonColor,
                      ),
                      child: Center(
                        child: Text(
                          "OK",
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
            ],
          ),
        );
      });
    },
  );
}
