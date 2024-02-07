import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/testfiles/dashboard.dart';
import 'package:partner_app/testhome.dart';
import 'Feature/CongitoService/CongitoService.dart';
import 'Feature/dashboard/SubFeatures/createNewCustomer/ui/createNewCustomer.dart';
import 'Feature/dashboard/ui/dashboardPage.dart';
import 'Gobal File/GobalVariable.dart';
import 'SCREENS/Login/login.dart';
// import 'package:Custom_Plugins/spintly_ouath_sdk/spintly_ouath_sdk.dart';

//x- check why? import 'Custom_Plugins/spintly_ouath_sdk/lib/spintly_ouath_sdk.dart';

//final dashboardProvider = StateNotifierProvider((ref) => DashBoardProvider());
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
            useMaterial3: true,
          ),
          home: YourWidget(), //testhome(), //LoginPage(),
          routes: <String, WidgetBuilder>{
            '/DashBoardPage': (BuildContext context) =>  DashBoardPage(),// DashBoardPage(),
            '/LoginPage': (BuildContext context) => LoginPage(),
            '/CreateNewCustomer': (BuildContext context) => CreateNewCustomer(),

            // Bottom navBar PAGES

            '/DashBoardTest': (BuildContext context) => DashBoardTest1(),
          }),
    );
  }
}

class MyRootPage extends StatelessWidget {
  const MyRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // Call your function to check if the user has a valid session
    checkAndNavigate(context);

    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: themeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Spintly",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "PARTNER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Future<void> checkAndNavigate(BuildContext context) async {
    // Implement your logic to check if the user has a valid session.

    final AuthService _authService = AuthService();
    bool isValidSession = await _authService.isValidSession();

    if (isValidSession) {
      print("SESSION VALIDATED");

      // Navigator.pushReplacementNamed(context, '/DashBoardPage');
    } else {
      // If no valid session, navigate to LoginPage
      print("SESSION login");
      Navigator.pushReplacementNamed(context, '/LoginPage');
    }
  }
}

//
//
class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  bool _isVisible = true;
  void SetTimerAnimation() {
    print("xjhhj");
    Timer(Duration(seconds: 1), () {
      setState(() {
        _isVisible = !_isVisible;
        SetTimerAnimation();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetTimerAnimation();

    checkAndNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
//SpintlyOuathSdk spintlyOuathSdk = SpintlyOuathSdk();

    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: themeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                "Spintly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                "PARTNER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    //         ElevatedButton(
    //       onPressed: () async {
    //         // Use the plugin functionality
            
    //  String? platformVersion = await spintlyOuathSdk.getPlatformVersion();
    //         print('Platform Version: $platformVersion');
    //       },
    //       child: Text('Get Platform Version'),
    //     ),
            
          ],
        ),
      ),
    );
  }

  Future<void> checkAndNavigate(BuildContext context) async {
    // Implement your logic to check if the user has a valid session.

    final AuthService _authService = AuthService();
    bool isValidSession = await _authService.isValidSession();

    if (isValidSession) {
      print("SESSION VALIDATED");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
             DashBoardPage(),// DashBoardPage(), //DashBoardBackTest DashBoardPage DashBoardTest1(),
          settings: RouteSettings(
            name: '/dashboard',
          ), // Assign a unique route name
        ),
      );
    } else {
      // If no valid session, navigate to LoginPage
      print("SESSION login");
      Navigator.pushReplacementNamed(context, '/LoginPage');
    }
  }
}
