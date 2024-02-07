import 'package:dio/dio.dart';
import 'package:partner_app/Feature/dashboard/Modal/orgainsations_Model.dart';

import '../Modal/ConfigurationResponse_Model.dart';
import '../Modal/dashboarDetail_Model.dart';
import '../Modal/userDetail_Model.dart';

class DashBoardApiService {
  final Dio _dio = Dio();
  DashBoardApiService() {}

  Future<UserDetailsModel?> fetchUserDetails(String token) async {
    print("Token in fetchDashboardDetails: dashboardapi");

    try {
      final response = await _dio.get(
        'https://dev1.iot.api.spintly.com/partnerManagement/v3/users/profile',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        //  Iterable CardjobsList = response.data['message']['jobs'];
        // return CardjobsList.map((job) => UserDetailsModel.fromJson(job))
        //     .toList();
        var res = UserDetailsModel.fromJson(response.data['message']);
        print("object${res.phoneNumber}");
        return res;
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<dynamic> fetchDashboardDetails(String token) async {
    print("Token in fetchDashboardDetails: dashboardapi");

    try {
      final response = await _dio.get(
        'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/partners/3/dashboard',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        return DashboarDetailModel.fromJson(response.data['message']);
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<dynamic> fetchConfigurationDetails(String token) async {
    print("Token in fetchConfigurationDetails: dashboardapi ");

    try {
      final response = await _dio.get(
        'https://dev1.iot.api.spintly.com/partnerManagement/v4/configurations',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response :${response.data}");
        return CongurationModel.fromJson(response.data['message']);
      }
    } catch (error) {
      print('Error from api: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }

  Future<List<Organisation>?> fetchOrganisationDetails(
      String token, String partnerId) async {
    print("Token in fetchOrganisationDetails: ${token.length} ,$partnerId");

    try {
      final response = await _dio.get(
        'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/partners/$partnerId/organisations',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("response: ${response.data}");

        List<dynamic> organisationListJson =
            response.data['message']['organisations'];
        List<Organisation> organisations = organisationListJson
            .map((organisationJson) => Organisation.fromJson(organisationJson))
            .toList();

        return organisations;
      }
    } catch (error) {
      print('Error from API: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
      }
      throw error;
    }
  }
}
