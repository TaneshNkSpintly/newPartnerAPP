import 'package:dio/dio.dart';

import '../../../../../Gobal File/GlobalApiDetails.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../../../../customerDoor/Model/accessPointList_Model.dart';

class ControllerApiService {
  final Dio _dio = Dio();
  ControllerApiService() {}

  Future<List<AccessPointListModel>?> fetchControllerList(
      String token, String orgId) async {
    print("Token in fetchControllerList2: $orgId:$apiHearder");

    try {
      final response = await _dio.get(
        '$apiHearder/infrastructureManagement/v1/organisations/$orgId/accessPoints',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        List<dynamic> accessPointslistListJson =
            response.data['message']['accessPoints'];
        List<AccessPointListModel> controllerList = accessPointslistListJson
            .map((controller) => AccessPointListModel.fromJson(controller))
            .toList();
        return controllerList;
        // return OverviewDetailModel.fromJson(response.data['message']);
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  // Future<bool?> updateCustomerDetailsPatch(
  //   String token,
  //   String OrgId,
  //   CustomerData updatecustomer,
  // ) async {
  //   print("Token in updateCustomerDetailsPatch Api: ${token.length} ,$OrgId");
  //   // CustomerData updatecustomer = CustomerData(CustomerName: "hi");
  //   var rawData = {
  //     'name': '${updatecustomer.CustomerName}',
  //     // 'type': '${updatecustomer.CustomerTpe}',
  //     // 'accountType': '${updatecustomer.AccountTYPE}',
  //     // 'country': '${updatecustomer.Country}',
  //     // 'admins': [
  //     //   {
  //     // 'name': '${updatecustomer.SuperAdminName!.text.toString()}', // note
  //     // 'phone': '${updatecustomer.SuperAdminPhone!.text.toString()}',
  //     // 'email': '${updatecustomer.SuperAdminEmail!.text.toString()}',
  //     // 'adminType': 1,
  //     // 'countryCode': '91',
  //     //   }
  //     // ],
  //   };

  //   print("Rawwww DATA: ${rawData.toString()} ");

  //   try {
  //     final response = await _dio.patch(
  //       'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/organisations/$OrgId',
  //       options: Options(
  //         headers: {
  //           'Authorization': '$token',
  //         },
  //       ),
  //       data: rawData,
  //     );

  //     if (response.statusCode == 200) {
  //       print("response from updateCustomerDetailsPatch: ${response.data}");
  //       if (response.data['type'] == "success") return true;
  //     }
  //   } catch (error) {
  //     print('Error from API CreateNewCustomerPost: $error');
  //     if (error is DioError) {
  //       print('Error body: ${error.response?.data}');
  //     }
  //     throw error;
  //   }
  // }

  Future<MessageResponse?> createNewControllerPost(
    String token,
    String chanelName1,
    String chanelSerialNumber1,
    String chanelName2,
    String chanelSerialNumber2,
    int installationMethod,
    int configuration,
    int lockingMechanism,
    int siteId,
    int networkId,
    String serialNumbeController,
    int relayOnTime,
    bool invertRelayLogic,
  ) async {
    print("Token in createNewControllerPost Api: ${token.length} , $networkId");

    List<Map<String, dynamic>> deviceList = [
      {
        'serialNumber': '$serialNumbeController',
        'deviceType': 3,
      },
    ];

    if (chanelSerialNumber1 != null && chanelSerialNumber1.isNotEmpty) {
      deviceList.add({
        'serialNumber': '$chanelSerialNumber1',
        'deviceType': 1,
      });
    }

    var rawData = [
      {
        "name": "$chanelName1",
        "installationMethod": installationMethod,
        "configuration": configuration,
        "lockingMechanism": lockingMechanism,
        "siteId": siteId,
        "networkId": networkId,
        "channelNo": 0,
        "devices": deviceList,
        "RelaySettings": {
          "relayOnTime": relayOnTime,
          "invertRelayLogic": invertRelayLogic
        },
        "enableAttendance": false
      }
    ];
    //impt chanel -2
    // if (chanelName2 != null) {
    //   var addElementToRawDATA = {
    //     "name": "$chanelName2",
    //     "installationMethod": installationMethod,
    //     "configuration": configuration,
    //     "lockingMechanism": lockingMechanism,
    //     "siteId": siteId,
    //     "networkId": networkId,
    //     "channelNo": 1, //?????
    //     "devices": [
    //       {
    //         "serialNumber": "$serialNumbeController",
    //         "deviceType": 3,
    //       },
    //       {
    //         "serialNumber": "$chanelSerialNumber2",
    //         "deviceType": 1, //??????
    //       }
    //     ],
    //     "RelaySettings": {
    //       "relayOnTime": relayOnTime,
    //       "invertRelayLogic": invertRelayLogic
    //     },
    //     "enableAttendance": false
    //   };
    //   rawData.add(addElementToRawDATA);
    // }
    print("Rawwww DATA: $rawData");
    String newtrkID = networkId.toString();

    try {
      final response = await _dio.post(
        '$apiHearder/infrastructureManagement/v1/networks/$newtrkID/accessPoints',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response from createAccessGatewayPost: ${response.data}");

        print("response data type: ${response.data.runtimeType}");
        if (response.data['type'] == "success") {
          var result = MessageResponse.fromJsonOnSuccess(response.data);

          print("appptype: ${result.type}");

          return result;
        } else {
          return MessageResponse.fromJsonError(response.data);
        }
      }
    } catch (error) {
      print('Error from API createAccessGatewayPost: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
        MessageResponse Errormodel =
            MessageResponse.fromJsonError(error.response!.data);
        return Errormodel;
      }
    }
  }

  //   if (networksname2 != null && networksname2.isNotEmpty) {
  //     networksList.add({
  //       'name': '$name - $networksname2',
  //     });
  //   }

  //   var rawData = {
  //     'name': '$name',
  //     'location': '$location',
  //     'timezone': '$timezone',
  //     'networks': networksList,
  //   };

  //   print("Rawwww DATA: $rawData");

  //   try {
  //     final response = await _dio.post(
  //       'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/organisations/$orgId/sites',
  //       options: Options(
  //         headers: {
  //           'Authorization': '$token',
  //         },
  //       ),
  //       data: rawData,
  //     );

  //     if (response.statusCode == 200) {
  //       print("response from createNewSitePost: ${response.data}");

  //       print("response data type: ${response.data.runtimeType}");
  //       if (response.data['type'] == "success") {
  //         print("response type: ${response.data['type']}");

  //         var result = MessageResponse.fromJsonOnSuccess(response.data);

  //         print("appptype: ${result.type}");

  //         // print("successMessage: ${result.successMessage}");

  //         // print("errorMessage: ${result.errorMessage!.errorMessage}");
  //         return result;
  //       } else {
  //         print("apppui: failure"); // Print failure or handle error accordingly
  //         return MessageResponse.fromJsonError(response.data);
  //       }
  //     }
  //   } catch (error) {
  //     print('Error from API createNewSitePost: $error');
  //     if (error is DioError) {
  //       print('Error body: ${error.response?.data}');
  //     }
  //     throw error;
  //   }
  // }

  // Future<MessageResponse?> deleteAnSite(
  //   String token,
  //   String siteId,
  // ) async {
  //   print("Token in deleteAnSite Api: ${token.length} ,$siteId");

  //   try {
  //     final response = await _dio.delete(
  //       'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/sites/$siteId',
  //       options: Options(
  //         headers: {
  //           'Authorization': '$token',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       print("response from deleteAnSite: ${response.data}");
  //       if (response.data['type'] == "success")
  //         return MessageResponse.fromJsonOnSuccess(response.data);
  //       else
  //         return MessageResponse.fromJsonError(response.data);
  //     }
  //   } catch (error) {
  //     print('Error from API deleteAnSite: $error');
  //     if (error is DioError) {
  //       print('Error body: ${error.response?.data}');
  //     }
  //     throw error;
  //   }
  // }
}
