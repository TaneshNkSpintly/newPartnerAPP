import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Services/createNewCustomerProvider.dart';
import 'createNewCustomerPage2.dart';

TextEditingController _customerNameController = TextEditingController();
TextEditingController _accountTypeController = TextEditingController();

TextEditingController _customerTypeController = TextEditingController();
TextEditingController _countryController = TextEditingController();
var selectedCountryFlagController;
TextEditingController _startDateController = TextEditingController();
TextEditingController _endDateController = TextEditingController();
bool showNextButton = false;

class CreateNewCustomer extends StatefulWidget {
  const CreateNewCustomer({super.key});

  @override
  State<CreateNewCustomer> createState() => _CreateNewCustomerState();
}

class _CreateNewCustomerState extends State<CreateNewCustomer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accountTypeController.clear();
    _startDateController.clear();
    _endDateController.clear();
    _endDateController.clear();
    _customerNameController.clear();
    _countryController.clear();
    _customerTypeController.clear();
    selectedCountryFlagController = null;
    showNextButton = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _accountTypeController.clear();
    // _startDateController.clear();
    // _endDateController.clear();
    // _endDateController.clear();
    // _customerNameController.clear();
    // _countryController.clear();
    // _customerTypeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    if (_accountTypeController.text == "Trial Account" &&
        _startDateController.text != "" &&
        _endDateController.text != "" &&
        _customerNameController.text != "" &&
        _countryController.text != "" &&
        _customerTypeController.text != "") {
      showNextButton = true;
      setState(() {});
    } else if (_accountTypeController.text != "" &&
        _customerNameController.text != "" &&
        _countryController.text != "" &&
        _customerTypeController.text != "") {
      showNextButton = true;
      setState(() {});
    } else {
      showNextButton = false;
      setState(() {});
    }

    return Consumer(
      builder: (context, ref, child) {
        final createNewCustomerData = ref.watch(createNewCustomerProvider);
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
                            for (int i = 0; i < 4; i++)
                              Container(
                                height: 6,
                                width: screenSize.width * 0.23,
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
                              'Create New Customer',
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
                              'Customer Details',
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
                                    _showCustomerType(context, refresh);
                                  },
                                  child: TextFormField(
                                    controller: _customerTypeController,
                                    enabled: false,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: 'Customer type',
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
                                if (_accountTypeController.text == "trial")
                                  Row(
                                    //date
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.calendar_month,
                                                color: primaryButtonColor,
                                              ),
                                              onPressed: () {
                                                showDatePicker(context, refresh,
                                                    "startDate");
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
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.calendar_month,
                                                color: primaryButtonColor,
                                              ),
                                              onPressed: () {
                                                showDatePicker(context, refresh,
                                                    "endDate");
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (selectedCountryFlagController !=
                                            null) ...[
                                          Column(
                                            children: [
                                              CountryPickerUtils
                                                  .getDefaultFlagImage(
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
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              labelText: 'Country',
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none,
                                              suffixIcon:
                                                  Icon(Icons.arrow_drop_down),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                              onTap: () async {
                                if (showNextButton) {
                                  var res = await ref
                                      .read(createNewCustomerProvider.notifier)
                                      .updateCustomerDetails(
                                          _customerNameController.text
                                              .toString(),
                                          _accountTypeController.text
                                              .toString(),
                                          _customerTypeController.text
                                              .toString(),
                                          _countryController.text.toString());

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CreateNewCustomerPage2()));
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
      },
    );
  }
}

//
void _showCustomerType(BuildContext context, void Function() refresh) {
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

  var _selectedOption = "office";

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
                child: Text("Customer Type",
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
                title: Text('Office', style: titleStyle),
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
                        _selectedOption = "office";
                      });
                    })),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                _customerTypeController.text = _selectedOption;
                setState(() {});
                refresh();
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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

//
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

  var _selectedOption = "demo";

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
                        _selectedOption = "demo";
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
                        _selectedOption = "customer";
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
                        _selectedOption = "partner";
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
                        _selectedOption = "trial";
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
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                                  _selectedCountry =
                                      _filteredCountries[index].isoCode;
                                  _selectedCountryFlag =
                                      _filteredCountries[index];

                                  // print(_filteredCountries[index].isoCode);
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
          // height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              TableCalendar(
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
