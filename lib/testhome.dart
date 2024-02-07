import 'package:flutter/material.dart';
import 'package:partner_app/testfiles/silvers.dart';

class testhome extends StatefulWidget {
  const testhome({super.key});

  @override
  State<testhome> createState() => _testhomeState();
}

class _testhomeState extends State<testhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, '/LoginPage'),
              child: Text("LoginPage")),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, '/UserManagement'),
              child: Text("UserManagement")),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, '/DashBoardTest'),
              child: Text("DashBoardTest")),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/DashBoardPage'),
            child: Text(
              "DashBoardPage",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 21,
                  fontStyle: FontStyle.italic),
            ),
          ),
          TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/CreateNewCustomer'),
              child: Text(
                "CreateNewCustomer",
                style: TextStyle(
                  //  fontFamily: 'Inter',
                  fontSize: 21,
                ),
              )),
          // TextButton(
          //     onPressed: () => Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 DashBoardBackTest(), //DashBoardBackTest DashBoardPage DashBoardTest1(),
          //           ),
          //         ),
          //     child: Text(
          //       "CreateNewCustomer",
          //     )),
        ],
      )),
    );
  }
}
