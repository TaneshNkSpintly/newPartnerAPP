import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/Feature/customerGateway/ui/customerGatewayPage.dart';
import 'package:partner_app/Feature/customerMenu/ui/menuCustomer.dart';
import '../../../Gobal File/GobalVariable.dart';
import '../../customerCredential/SubFeatures/ble_remote/ui/customeBLE_Page.dart';
import '../../customerCredential/SubFeatures/card/ui/customerCardPage.dart';
import '../../customerDevice/SubFeatures/controller/ui/customerControllerPage.dart.dart';
import '../../customerDevice/SubFeatures/meshIo/ui/customerMeshIoPage.dart';
import '../../customerDoor/ui/customerDoorPage.dart';
import '../../customerSite/ui/customerSitePage.dart';

class CustomerBottomNavigationBarPage extends StatefulWidget {
  String orgId;
  CustomerBottomNavigationBarPage({required this.orgId});

  @override
  State<CustomerBottomNavigationBarPage> createState() =>
      _CustomerBottomNavigationBarPageState();
}

class _CustomerBottomNavigationBarPageState
    extends State<CustomerBottomNavigationBarPage> {
  var iconColor = Color(0xFF7780D6);
  var iconColorSelected = Color(0xFF2F3789);

  MenuItem Menu = MenuItem();
  var menuItemSelected;
  var MenuItemSelectedWidget;

  void IntializeGatewayMenuPageLinks() async {
    // 1st page
    var firstpage = MenuItemSelectedWidget = CustomerSitesPage(
      orgId: widget.orgId,
    );

    Menu.menuPageLinks.insert(0, firstpage);

    //2page
    var replacementDoorPage = CustomerDoorPage(
      orgId: widget.orgId,
    );
    Menu.menuPageLinks.insert(1, replacementDoorPage);

    //3page
    var replacementGatewayPage = CustomerGatewayPage(
      orgId: widget.orgId,
    );
    Menu.menuPageLinks.insert(2, replacementGatewayPage);

    //4page
    var replacementDevicePage = CustomerMeshIOPage(
      onReplace: _replaceWidgetOfDevice,
      orgId: widget.orgId,
    );
    Menu.menuPageLinks.insert(
      3,
      replacementDevicePage,
    );
    var replacementCredetialPage = CustomerCardPage(
      onReplace: _replaceWidgetOfCredtialPage,
      //orgId: widget.orgId,
    );
    Menu.menuPageLinks.insert(4, replacementCredetialPage);
  }

  void _replaceWidgetOfDevice() {
    setState(() {
      if (Menu.menuPageLinks[3] is CustomerMeshIOPage) {
        print("inside");
        Menu.menuPageLinks[3] = CustomerControllerPage(
          onReplace: _replaceWidgetOfDevice,
          orgId: widget.orgId,
        );
      } else {
        Menu.menuPageLinks[3] = CustomerMeshIOPage(
          onReplace: _replaceWidgetOfDevice,
          orgId: widget.orgId,
        );
      }
      MenuItemSelectedWidget = Menu.menuPageLinks[3];
    });
  }

  void _replaceWidgetOfCredtialPage() {
    setState(() {
      if (Menu.menuPageLinks[4] is CustomerCardPage) {
        print("inside");
        Menu.menuPageLinks[4] =
            CustomerBLE_Page(onReplace: _replaceWidgetOfCredtialPage);
      } else {
        Menu.menuPageLinks[4] = MenuItemSelectedWidget = CustomerSitesPage(
          orgId: widget.orgId,
        );
      }
      MenuItemSelectedWidget = Menu.menuPageLinks[4];
    });
  }

  Widget selectMenuItem() {
    return menuItemSelected;
  }

  @override
  void initState() {
    // TODO: implement initState
    menuItemSelected = "Sites";
    MenuItemSelectedWidget = CustomerSitesPage(
      orgId: widget.orgId,
    );
    IntializeGatewayMenuPageLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
        color: themeColor,
        child: Stack(
          children: [
            Container(
              //   margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: screenSize.width * 0.9,
              //color: themeColor, // Color(0xFF2F3789),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10),
                    for (int i = 0; i < Menu.menuItem.length; i++) ...[
                      // SizedBox(
                      //   width: screenSize.width * 0.1,
                      // ),
                      if (menuItemSelected == Menu.menuItem[i])
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icon/bottomNavBar/${Menu.menuImage[i]}.png",
                                color: iconColorSelected,
                                height: 23,
                                width: 23,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${Menu.menuItem[i]}",
                                style: TextStyle(
                                  color: iconColorSelected,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      else ...[
                        GestureDetector(
                          onTap: () {
                            menuItemSelected = Menu.menuItem[i];
                            //      Navigator.push(context, Menu.menuPageLinks[i]);
                            MenuItemSelectedWidget = Menu.menuPageLinks[i];
                            setState(() {});
                          },
                          child: Image.asset(
                            "assets/icon/bottomNavBar/${Menu.menuImage[i]}.png",
                            color: iconColor,
                            height: 23,
                            width: 23,
                            // height: screenSize.width * 0.39,
                            // width: screenSize.width * 0.39,
                          ),
                        ),
                      ],

                      SizedBox(
                        width: screenSize.width * 0.09,
                      ),
                    ],
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                  ],
                ),
              ),
            ),

            //
            Positioned(
              top: 10,
              right: 0,
              bottom: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CustomerMenuPage(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  width: screenSize.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Color(0xFF2F3789),
                  ),
                  child: Image.asset(
                    "assets/icon/bottomNavBar/more.png",
                    color: Colors.white,
                    height: 23,
                    width: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: MenuItemSelectedWidget,
            ),
          ),
        ],
      ),
      //),
    );
  }
}

class MenuItem {
  var menuItem = [
    "Sites",
    "Door",
    "Gateways",
    "Devices",
    "Credentials"
  ]; //"Menu"
  var menuImage = [
    "sites",
    "Door",
    "wifi-router",
    "material-symbols_google-wifi-outline",
    "Credentials"
  ];
  //"more"
  var menuPageLinks = [
    // CustomerSitesPage(),
    // CustomerDoorPage(),
    // CustomerGatewayPage(),
    // CustomerGatewayPage(),// CustomerControllerPage(), // replace with CustomerMeshIOPage
    // CustomerCredentialsPage(),
  ];

  var menuNavigation;
  var menuItemOverview_Name = [
    "Overview",
    "Door",
    "Gateways",
    "Devices",
    "Menu"
  ];

  var menuImageOverview = [
    "sites",
    "Door",
    "wifi-router",
    "material-symbols_google-wifi-outline",
    "more"
  ];
  var x = [
    "overview",
    "Door",
    "wifi-router",
    "material-symbols_google-wifi-outline",
    "more"
  ];
  MenuItem();
}

class CustomerBottomOveriewNavigationBarPage extends StatefulWidget {
  String menuSelected;
  CustomerBottomOveriewNavigationBarPage({required this.menuSelected});

  @override
  State<CustomerBottomOveriewNavigationBarPage> createState() =>
      _CustomerBottomOveriewNavigationBarPageState();
}

class _CustomerBottomOveriewNavigationBarPageState
    extends State<CustomerBottomOveriewNavigationBarPage> {
  var iconColor = Color(0xFF7780D6);
  var iconColorSelected = Color(0xFF2F3789);

  MenuItem Menu = MenuItem();
  var menuItemSelected;

  @override
  void initState() {
    // TODO: implement initState
    menuItemSelected = widget.menuSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       color: Color(0xFF2F3789).withOpacity(0.5),
          //       spreadRadius: 3,
          //       blurRadius: 5),
          // ],
          color: Colors.white, // Color(0xFF2F3789),
          // border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < Menu.menuItem.length; i++) ...[
            if (menuItemSelected == Menu.menuItem[i])
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                decoration: BoxDecoration(
                  color: Color(0xFF2F3789),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon/bottomNavBar/${Menu.x[i]}.png",
                      color: Colors.white,
                      height: 23,
                      width: 23,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${Menu.menuItemOverview_Name[i]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              GestureDetector(
                onTap: () {
                  menuItemSelected = Menu.menuItem[i];
                  //  Navigator.push(context, Menu.menuPageLinks[i]);
                  setState(() {});
                },
                child: Image.asset(
                  "assets/icon/bottomNavBar/${Menu.menuImage[i]}.png",
                  color: iconColor,
                  height: 23,
                  width: 23,
                ),
              ),
            ],
          ],

          //
          // Image.asset(
          //   "assets/icon/bottomNavBar/Door.png",
          //   color: iconColor,
          //   height: 23,
          //   width: 23,
          // ),
          // Image.asset(
          //   "assets/icon/bottomNavBar/wifi-router.png",
          //   color: iconColor,
          //   height: 23,
          //   width: 23,
          // ),
          // Image.asset(
          //   "assets/icon/bottomNavBar/material-symbols_google-wifi-outline.png",
          //   color: iconColor,
          //   height: 23,
          //   width: 23,
          // ),
          // Image.asset(
          //   "assets/icon/bottomNavBar/more.png",
          //   color: iconColor,
          //   height: 23,
          //   width: 23,
          // ),

          // Icon(
          //   Icons.access_alarm_outlined,
          //   size: 23,
          //   color: iconColor,
          //),
        ],
      ),
    );
  }
}
