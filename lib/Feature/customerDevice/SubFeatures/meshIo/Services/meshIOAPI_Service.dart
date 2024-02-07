import 'package:dio/dio.dart';

import '../../../../../Gobal File/GlobalApiDetails.dart';
import '../../../../../Gobal File/GobalModel.dart';
import '../Model/meshIoList_Model.dart';

class MeshIOApiService {
  final Dio _dio = Dio();
  MeshIOApiService() {}

  Future<List<MeshioListModel>?> fetchMeshIoList(
      String token, String orgId) async {
    print("Token in fetchGatewayPointsList: $orgId:$apiHearder");

    try {
      final response = await _dio.get(
        '$apiHearder/infrastructureManagement/v1/organisations/$orgId/meshios',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        List<dynamic> meshIolistListJson = response.data['message']['meshios'];
        List<MeshioListModel> meshIoList = meshIolistListJson
            .map((meshIo) => MeshioListModel.fromJson(meshIo))
            .toList();
        return meshIoList;
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

  Future<MessageResponse?> createNewMeshIoPost(
    String token,
    String meshioName,
    int siteId,
    int networkId,
    String serialNumbeMeshIo,
  ) async {
    print("Token in createAccessGatewayPost Api: ${token.length} , $networkId");

    var rawData = {
      'name': "$meshioName",
      'serialNumber': "$serialNumbeMeshIo",
    };

    print("Rawwww DATA: $rawData");

    try {
      final response = await _dio.post(
        '$apiHearder/infrastructureManagement/v1/networks/$networkId/meshios',
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
