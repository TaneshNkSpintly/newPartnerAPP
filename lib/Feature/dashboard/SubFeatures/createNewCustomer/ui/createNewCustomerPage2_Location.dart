import 'package:flutter/material.dart';

import '../../../../../Gobal File/GobalVariable.dart';

class createNewCustomerPage2_Location extends StatefulWidget {
  const createNewCustomerPage2_Location({super.key});

  @override
  State<createNewCustomerPage2_Location> createState() =>
      _createNewCustomerPage2_LocationState();
}

class _createNewCustomerPage2_LocationState
    extends State<createNewCustomerPage2_Location> {
  TextEditingController _searchController = TextEditingController();
  List<String> SavedSites = ["Goa", "Pune", "Mumbai", "Hyderabad", "Noida"];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: screenSize.height * 0.06,
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
                child: Icon(Icons.close,
                    size: 20, color: Colors.black // const Color(0xFF6E88C9),
                    ),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'Select a Location',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFCACEDA),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Color(0xFF6DBDF3)),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      //
                    },
                    style: TextStyle(color: Color(0xFF8E8D92)),
                    decoration: InputDecoration(
                      hintText: "Search for Site",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_searching, color: primaryButtonColor),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use you current Location',
                      style: TextStyle(
                          color: primaryButtonColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Sector 137, Noida',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              width: screenSize.width * 0.9,
              child: Divider(
                color: Color(0xFFCACEDA),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  Text(
                    'SAVED SITES',
                    style: TextStyle(
                        color: Color(0xFF929CA4),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  for (int i = 0; i < SavedSites.length; i++) ...[
                    Row(
                      children: [
                        Icon(Icons.location_city_outlined,
                            color: primaryButtonColor),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${SavedSites[i]}',
                          style: TextStyle(
                              color: Color(0xFF050621),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: screenSize.width * 0.9,
                      child: Divider(
                        color: Color(0xFFCACEDA),
                      ),
                    ),
                  ],
                ]),
          )
        ]),
      ),
    );
  }
}
