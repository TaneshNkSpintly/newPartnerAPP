import 'package:dio/dio.dart';

class CustDoorApiService {
  final Dio _dio = Dio();
  CustDoorApiService() {}

  // Future<OverviewDetailModel?> fetchSiteOverviewDetails(
  //     String token, String orgId) async {
  //   print("Token in fetchSiteOverviewDetailsapi: $orgId");

  //   try {
  //     final response = await _dio.get(
  //       'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/organisations/$orgId/overview',
  //       options: Options(
  //         headers: {
  //           'Authorization': '$token',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       print("response :${response.data}");
  //       return OverviewDetailModel.fromJson(response.data['message']);
  //     }
  //   } catch (error) {
  //     print('Error from api: $error');
  //     if (error is DioError) {
  //       print('Error body: ${error.response?.data}');
  //     }
  //     throw error;
  //   }
  // }

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

  // Future<MessageResponse?> createNewSitePost(
  //   String token,
  //   String orgId,
  //   String name,
  //   String location,
  //   String timezone,
  //   String networksname1,
  //   String? networksname2,
  // ) async {
  //   print("Token in createNewSitePost Api: ${token.length} ,$orgId");

  //   List<Map<String, String>> networksList = [
  //     {
  //       'name': '$name - $networksname1',
  //     },
  //   ];

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
