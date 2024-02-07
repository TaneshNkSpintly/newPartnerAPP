import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../DetachedDevice/ui/detachedDevicePage.dart';
import '../../dashboard/Services/dashboardProvider.dart';

class CustomerMenuPage extends ConsumerWidget {
  CustomerMenuPage({Key? key}) : super(key: key);
  var listItemStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0xFF000000),
  );

  bool showPartners = false;
  bool LoadingPartnerData = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardData = ref.watch(dashboardProvider);
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
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Icon(
            //     Icons.close,
            //     size: 20,
            //     color: Color(0xFF6E88C9),
            //   ),
            // ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      ),
      body: 
       GestureDetector(
                       onHorizontalDragUpdate: (details) {
                        if (details.delta.dx > 0) {
                          // Swiped from left to right (right to left on RTL languages)
                        } else if (details.delta.dx < 0) {
                          // Swiped from right to left (left to right on RTL languages)
                          print("object");
                          Navigator.pop(context);
                        }
                      },
                      onTap: () {
                         print("objectjj");
                      },
        child: Stack(
          children: [
            GestureDetector(
                         onHorizontalDragUpdate: (details) {
                          if (details.delta.dx > 0) {
                            // Swiped from left to right (right to left on RTL languages)
                          } else if (details.delta.dx < 0) {
                            // Swiped from right to left (left to right on RTL languages)
                            print("object");
                            Navigator.pop(context);
                          }
                        },
                         onTap: () {
                         print("objectkk");
                      },
                        
              child: Container(
             //   margin: EdgeInsets.only(left: 15, right: 15),
                height: screenSize.height,
                width: screenSize.width,
                color: Colors.transparent,
                padding:EdgeInsets.only(left: 15, right: 15), 
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
                                  "${dashboardData.userDetailsModel!.partners[dashboardData.selectedPartnerIndex!].name}",
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
                        Divider(
                          color: Color(0xFFC6CDDB), // Custom dotted line color
                          thickness: 1,
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            showPartners = !showPartners;
              
                            // print("vvyy$showPartners");
              
                            var refresh = await ref
                                .read(dashboardProvider.notifier)
                                .UpdatePartnerIndex(
                                    dashboardData.selectedPartnerIndex!);
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10 // to make sub text appear in line
                                  ),
                              Text(
                                "${dashboardData.userDetailsModel!.partners[dashboardData.selectedPartnerIndex!].partnerName}",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF768ABC),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                showPartners
                                    ? Icons.arrow_drop_up_outlined
                                    : Icons.arrow_drop_down_outlined,
                                size: 25,
                                color: Color(0xFF6DBDF3),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: showPartners
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.1,
                              ),
                              child: LoadingPartnerData
                                  ? Center(child: CircularProgressIndicator())
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          //height: screenSize.height * 0.05,
                                          height: 10,
                                        ),
                                        for (int index = 0;
                                            index <
                                                dashboardData.userDetailsModel!
                                                    .partners.length;
                                            index++) ...[
                                          GestureDetector(
                                            onTap: () async {
                                              LoadingPartnerData = true;
                                              var updateIndex = await ref
                                                  .read(dashboardProvider.notifier)
                                                  .UpdatePartnerIndex(index);
                                              var fetchOrgani = await ref
                                                  .read(dashboardProvider.notifier)
                                                  .fetchOrganisationDetails();
                                              LoadingPartnerData = false;
                                              showPartners = !showPartners;
                                            },
                                            child: Text(
                                              "${dashboardData.userDetailsModel!.partners[index].partnerName}",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF6DBDF3),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ]
                                      ],
                                    ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetachedDevicePage(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icon/dettechedDeivcesIcon.png', // Replace with your image path
                                        width: screenSize.width * 0.12,
                                        height: screenSize.width * 0.12,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Detteched Deivces",
                                          style: listItemStyle),
                                    ],
                                  ),
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
                                  color:
                                      Color(0xFFC6CDDB), // Custom dotted line color
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => CustomerMenuPage(),
                  // ));
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
                    color: Color(0xFF10122D),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Close',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
