import 'package:flutter/material.dart';

class NavbarPage extends StatefulWidget {
  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  var listItemStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0xFF000000),
  );
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Menu',
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 20,
                color: Color(0xFF6E88C9),
              ),
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE4F1FA).withOpacity(0.6)),
                padding: EdgeInsets.all(20),
                child: Column(//CONTENT

                    children: [
                  Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.width * 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF6DBDF3), // Border color: #6DBDF3
                            width: 3, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icon/profileImg.png', // Replace with your image path
                            // width: 100,
                            //  height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Emily Bibbler",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: screenSize.width * 0.03,
                          ),
                          Text(
                            "Super Admin",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text("doted line"),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Divider(
                    color: Color(0xFFC6CDDB), // Custom dotted line color
                    thickness: 1,
                    height: 20,
                  ),

                  Row(
                    children: [
                      SizedBox(width: 10 // to make sub text appear in line
                          ),
                      Text(
                        "Mrinq Technologies",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF768ABC),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 25,
                        color: Color(0xFF6DBDF3),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/dashboardIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/customersIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Customers",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/dettechedDeivcesIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Detteched Deivces", style: listItemStyle),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/usersIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Users", style: listItemStyle),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/settingsIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Settings", style: listItemStyle),
                ],
              ),
              Divider(
                color: Color(0xFFC6CDDB), // Custom dotted line color
                thickness: 1,
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/aboutIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("About", style: listItemStyle),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icon/logoutIcon.png', // Replace with your image path
                    width: screenSize.width * 0.12,
                    height: screenSize.width * 0.12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Logout",
                    style: listItemStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
