import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Feature/dashboard/Modal/userDetail_Model.dart';

// String? storedUsername;
// String? storedUserPassword;

String? tokenId = "initaltoken";
CognitoUserSession? sessionCurrent;
String? PARTNERid = "initalPARTNERid";
Partner? selectedPartners;
var themeColor = Color(0xFF10122D);
var primaryButtonColor = Color(0xFF2F3789);

//conatiner style
var subtextStleGrey = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xFF8E8D92));

var subtextStleBlack = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black);

List<String> SetDeviceConfigurationType = [
  "ENTRY_EXIT_READER",
  "ENTRY_READER_AND_REX",
  "ENTRY_READER_AND_1_DOOR_CONTROLLER",
  "1_DOOR_CONTROLLER_AND_REX",
  "CLOCK_IN_DEVICE",
  "DOORLOCK",
  "ENTRY_EXIT_CONTROLLER",
];

List<String> installMethodType = [
  "New install",
  "Retrofit Type 1",
  "Retrofit Type 2"
];
List<int> installMethodValue = [1, 2, 3];

// List<String> configurationType_NewInstall = [
//   "Entry + Exit reader (RS485 Disabled)",
//   "Entry + Exit reader (RS485 Enabled)",
//   "Entry reader and REX",
//   "Clock-in device",
//   "Door Lock"
// ];
// List<int> configurationValue__NewInstall = [1, 7, 2, 5, 6];
// List<String> configurationType_RetrofitType_1 = [
//   "Entry reader and REX",
//   "Entry and Exit reader"
// ];
// List<int> configurationValue_RetrofitType_1 = [
//   2,
// ];
// List<String> configurationType_RetrofitType_2 = [];
// List<String> configurationValue_RetrofitType_2 = [];
