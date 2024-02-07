import 'package:dio/dio.dart';

import '../../../Gobal File/GlobalApiDetails.dart';
import '../../../Gobal File/GobalModel.dart';
import '../../../Gobal File/gobalconfigData.dart';
import '../Model/accessPointList_Model.dart';

class CustDoorApiService {
  final Dio _dio = Dio();
  CustDoorApiService() {}

  Future<List<AccessPointListModel>?> fetchDoorsList(
      String token, String orgId) async {
    print("Token in fetchAccessPointsList: $orgId:$apiHearder");

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
        List<dynamic> accessPointsListJson =
            response.data['message']['accessPoints'];
        List<AccessPointListModel> accessPoints = accessPointsListJson
            .map((organisationJson) =>
                AccessPointListModel.fromJson(organisationJson))
            .toList();
        return accessPoints;
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

  Future<MessageResponse?> createAccessPointPost(
    String token,
    String orgId,
    String name,
    int installationMethod,
    int configuration,
    int siteId,
    int networkId,
    String serialNumberDevice1,
    String serialNumberDevice2,
    int? lockingMechanism,
    int? relayOnTime,
    bool? invertRelayLogic,
    bool? enableAttendance,
  ) async {
    print(
        "Token in createAccessPointPost Api: ${token.length} ,$orgId $networkId");

    ConfigDetails configValidation = newInstallConfigs.firstWhere(
      (configList) => configList.value == configuration,
    );
    List<Map<String, dynamic>> deviceList = [
      {
        'serialNumber': '$serialNumberDevice1',
        'deviceType': 1,
      },
    ];

    if (serialNumberDevice2 != null && serialNumberDevice2.isNotEmpty) {
      deviceList.add({
        'serialNumber': '$serialNumberDevice2',
        'deviceType': 2,
      });
    }

    var rawData = [
      {
        "name": "$name",
        'installationMethod': installationMethod,
        'configuration': configuration,
        'siteId': siteId,
        'networkId': networkId,
        'devices': deviceList,
      }
    ];
    if (configValidation.formOptions["lockingMechanism"] == true) {
      rawData[0]['lockingMechanism'] = lockingMechanism!;
    }
    if (configValidation.formOptions["relayTime"] == true) {
      rawData[0]['relaySettings'] = {
        'relayOnTime': relayOnTime,
        'invertRelayLogic': invertRelayLogic,
      };
    }
    if (configValidation.formOptions["attendanceAvailable"] == true) {
      rawData[0]['enableAttendance'] = enableAttendance!;
    }

    print("Rawwww DATA: $rawData");

    try {
      final response = await _dio.post(
        '$apiHearder/infrastructureManagement/v1/networks/$networkId/accessPoints',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response from createAccessPointPost: ${response.data}");

        print("response data type: ${response.data.runtimeType}");
        if (response.data['type'] == "success") {
          var result = MessageResponse.fromJsonOnSuccess(response.data);

          print("appptype: ${result.type}");

          return result;
        } else {
          print("apppui: failure"); // Print failure or handle error accordingly
          return MessageResponse.fromJsonError(response.data);
        }
      }
    } catch (error) {
      print('Error from API createNewSitePost: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
        MessageResponse Errormodel =
            MessageResponse.fromJsonError(error.response!.data);
        return Errormodel;
      }
    }
  }

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
