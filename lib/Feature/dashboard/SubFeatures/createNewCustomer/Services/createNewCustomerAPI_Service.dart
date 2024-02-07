import 'package:dio/dio.dart';

import '../../../../../Gobal File/GobalModel.dart';
import 'createNewCustomerProvider.dart';

class CreateNewCustomerApiService {
  final Dio _dio = Dio();
  CreateNewCustomerApiService() {}

  Future<MessageResponse?> createNewCustomerPost(String token, String partnerId,
      String integratorId, CustomerData customerData) async {
    print(
        "Token in CreateNewCustomerPost Api: ${token.length} ,$partnerId:,$integratorId");
    print(
        "Api partnerAdminDatalenTh: ${customerData.partnerAdminData!.length} ");

    var rawData = {
      'integratorId': int.tryParse(integratorId) ?? 0,
      'partnerId': int.tryParse(partnerId) ?? 0,
      'name': customerData.CustomerName,
      'type': customerData.CustomerTpe,
      'accountType': customerData.AccountTYPE,
      'country': customerData.Country,
      'admins': customerData.partnerAdminData!.map((admin) {
        return {
          'id': "",
          'name': admin.partnerAdminNameController.text.toString(),
          'phone': admin.partnerAdminPhoneNumberController.text.toString(),
          'email': admin.adminEmailController.text.toString(),
          'adminType': int.tryParse(admin.adminType) ?? 1,
          'countryCode': admin.partnerAdminPhoneNumberController.text
              .toString()
              .substring(1, 3),
        };
      }).toList(),
      'sites': [
        {
          'name': customerData.SiteName,
          'location': customerData.SiteLocation,
          'timezone': customerData.SiteTimezone,
          'networks': [
            {
              'name': customerData.NetworkName,
            },
          ],
        },
      ],
    };

    print("Rawwww DATA: ${rawData.toString()} ");

    try {
      final response = await _dio.post(
        'https://dev1.iot.api.spintly.com/infrastructureManagement/v1/organisations',
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
        data: rawData,
      );

      if (response.statusCode == 200) {
        print("response: ${response.data}");
        if (response.data['type'] == "success") {
          var result = MessageResponse.fromJsonOnSuccess(response.data);

          print("appptype: ${result.type}");

          return result;
        }
      }
    } catch (error) {
      print('Error from API createNewSitePost: $error');
      if (error is DioError) {
        print('Error body: ${error.response?.data}');
        MessageResponse Errormodel =
            MessageResponse.fromJsonError(error.response!.data);
        print("rere:${Errormodel.errorMessage!.errorCode}");
        print("remess:${Errormodel.errorMessage!.errorMessage}");
        return Errormodel;
      }
    }
  }
}
