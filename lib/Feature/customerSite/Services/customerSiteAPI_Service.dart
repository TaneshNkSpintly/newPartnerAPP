import 'package:dio/dio.dart';
import 'package:partner_app/Gobal%20File/GlobalApiDetails.dart';

import '../../../Gobal File/GobalModel.dart';
import '../../dashboard/SubFeatures/createNewCustomer/Services/createNewCustomerProvider.dart';
import '../Modal/siteOverview_Model.dart';
import '../Modal/sites_Model.dart';

class CustSiteApiService {
  final Dio _dio = Dio();
  CustSiteApiService() {}

  Future<OverviewDetailModel?> fetchSiteOverviewDetails(
      String token, String orgId) async {
    print("Token in fetchSiteOverviewDetailsapi: $orgId");

    try {
      final response = await _dio.get(
        '$apiHearder/infrastructureManagement/v1/organisations/$orgId/overview',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        return OverviewDetailModel.fromJson(response.data['message']);
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<SelectedOrganisationDetail?> fetchSelectedOrgDetails(
      String token, String orgId) async {
    print("Token in fetchSelectedOrgDetails: dashboardapi");

    try {
      final response = await _dio.get(
        '$apiHearder/infrastructureManagement/v1/organisations/$orgId',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        return SelectedOrganisationDetail.fromJson(response.data['message']);
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<List<SitesModel>?> fetchSitesDetails(
      String token, String orgId) async {
    print("Token in fetchSitesDetails: api$orgId");

    try {
      final response = await _dio.get(
        '$apiHearder/infrastructureManagement/v1/organisations/$orgId/sites',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(" fetchSitesDetails response  :${response.data}");
        List<dynamic> siteListJson = response.data['message']['sites'];
        List<SitesModel> sites = siteListJson
            .map((organisationJson) => SitesModel.fromJson(organisationJson))
            .toList();

        return sites;
        // return SitesModel.fromJson(response.data['message']);
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<bool?> updateCustomerDetailsPatch(
    String token,
    String OrgId,
    CustomerData updatecustomer,
  ) async {
    print("Token in updateCustomerDetailsPatch Api: ${token.length} ,$OrgId");
    // CustomerData updatecustomer = CustomerData(CustomerName: "hi");
    var rawData = {
      'name': '${updatecustomer.CustomerName}',
      // 'type': '${updatecustomer.CustomerTpe}',
      // 'accountType': '${updatecustomer.AccountTYPE}',
      // 'country': '${updatecustomer.Country}',
      // 'admins': [
      //   {
      // 'name': '${updatecustomer.SuperAdminName!.text.toString()}', // note
      // 'phone': '${updatecustomer.SuperAdminPhone!.text.toString()}',
      // 'email': '${updatecustomer.SuperAdminEmail!.text.toString()}',
      // 'adminType': 1,
      // 'countryCode': '91',
      //   }
      // ],
    };

    print("Rawwww DATA: ${rawData.toString()} ");

    try {
      final response = await _dio.patch(
        '$apiHearder/infrastructureManagement/v1/organisations/$OrgId',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response from updateCustomerDetailsPatch: ${response.data}");
        if (response.data['type'] == "success") return true;
      }
    } catch (error) {
      print('Error from API CreateNewCustomerPost: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<MessageResponse?> createNewSitePost(
    String token,
    String orgId,
    String name,
    String location,
    String timezone,
    String networksname1,
    String? networksname2,
  ) async {
    print("Token in createNewSitePost Api: ${token.length} ,$orgId");

    List<Map<String, String>> networksList = [
      {
        'name': '$name - $networksname1',
      },
    ];

    if (networksname2 != null && networksname2.isNotEmpty) {
      networksList.add({
        'name': '$name - $networksname2',
      });
    }

    var rawData = {
      'name': '$name',
      'location': '$location',
      'timezone': '$timezone',
      'networks': networksList,
    };

    print("Rawwww DATA: $rawData");

    try {
      final response = await _dio.post(
        '$apiHearder/infrastructureManagement/v1/organisations/$orgId/sites',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response from createNewSitePost: ${response.data}");

        print("response data type: ${response.data.runtimeType}");
        if (response.data['type'] == "success") {
          print("response type: ${response.data['type']}");

          var result = MessageResponse.fromJsonOnSuccess(response.data);

          print("appptype: ${result.type}");

          // print("successMessage: ${result.successMessage}");

          // print("errorMessage: ${result.errorMessage!.errorMessage}");
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
      }
      throw error;
    }
  }

  Future<MessageResponse?> deleteAnSite(
    String token,
    String siteId,
  ) async {
    print("Token in deleteAnSite Api: ${token.length} ,$siteId");

    try {
      final response = await _dio.delete(
        '$apiHearder/infrastructureManagement/v1/sites/$siteId',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response from deleteAnSite: ${response.data}");
        if (response.data['type'] == "success")
          return MessageResponse.fromJsonOnSuccess(response.data);
        else
          return MessageResponse.fromJsonError(response.data);
      }
    } catch (error) {
      print('Error from API deleteAnSite: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<MessageResponse?> updateSiteDetailsPATCH(
   String token,
    String siteId,
    String name,
    String initaialSitename,
    String location,
    String timezone,
    String networksname1,
    int? networkId1,
    String? networksname2,
    int? networkId2,
  ) async {
    print("Token in updateSiteDetailsPATCH Api: ${token.length} ,$siteId");


    List<Map<String, dynamic>> networksList = [
      { 'id':networkId1,
        'name': '$networksname1',
      },
    ];

    if (networksname2 != null && networksname2.isNotEmpty) {
          if(networkId2!=null){
       networksList.add({
        'id':networkId1,
        'name': '$networksname2',
      });
     
      }
      else{
      networksList.add({
        'id':"",
        'name': '$networksname2',
      });
      }
    }

    var rawData = {
      "name": '$name',
      'location': '$location',
      'timezone': '$timezone',
      'networks': networksList,
    };

    if (networksname1 != null && networksname1.isNotEmpty)  {
      rawData['networks'] = networksList;
    }
    
    print("Rawwww DATA: $rawData");
    //importanat
    if (rawData.isEmpty) {
      return null;
    }

    try {
      final response = await _dio.patch(
        '$apiHearder/infrastructureManagement/v1/sites/$siteId',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response from updateSiteNamePost: ${response.data}");
        if (response.data['type'] == "success") {
          var result = MessageResponse.fromJsonOnSuccess(response.data);

         return result;
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
      throw error;
    }
  }

  Future<MessageResponse?> updateSiteDetails_AddNetwork(
    String token,
    String siteId,
    String siteName,
    String networksname, 
  ) async {
    print("Token in updateSiteDetailsAddNetwork Api: ${token.length} ,$siteId");

    var rawData = {
      'name': '$networksname'
    };

    print("Rawwww DATA: $rawData");

    try {
      final response = await _dio.post(
        '$apiHearder/infrastructureManagement/v1/sites/$siteId/networks',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response from updateSiteDetails_AddNetwork: ${response.data}");
        if (response.data['type'] == "success") {
          var result = MessageResponse.fromJsonOnSuccess(response.data);

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
      }
      throw error;
    }
  }

  Future<MessageResponse?> updateSiteDetails_deleteNetwork(
    String token,
    String siteId,
  ) async {
    print(
        "Token in updateSiteDetails_deleteNetwork Api: ${token.length} ,$siteId");

    try {
      final response = await _dio.delete(
        '$apiHearder/infrastructureManagement/v1/networks/$siteId',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(
            "response from updateSiteDetails_deleteNetwork: ${response.data}");
        if (response.data['type'] == "success")
          return MessageResponse.fromJsonOnSuccess(response.data);
        else
          return MessageResponse.fromJsonError(response.data);
      }
    } catch (error) {
      print('Error from API updateSiteDetails_deleteNetwork: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
         MessageResponse Errormodel =
            MessageResponse.fromJsonError(error.response!.data);
        return Errormodel;
      }
      throw error;
    }
  }
}
