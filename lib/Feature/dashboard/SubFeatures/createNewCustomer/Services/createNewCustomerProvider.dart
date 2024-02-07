import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Gobal File/GobalModel.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../ui/createNewCustomerPage3.dart';
import 'createNewCustomerAPI_Service.dart';

class CustomerData {
  final String? CustomerName;
  final String? AccountTYPE;
  final String? CustomerTpe;
  final String? Country;

  //
  final String? SiteName;
  final String? SiteLocation;
  final String? SiteTimezone;
  final String? NetworkName;
  //
  List<PartnerAdminData>? partnerAdminData;
  final TextEditingController? SuperAdminName;
  final TextEditingController? SuperAdminPhone;
  final TextEditingController? SuperAdminEmail;

  CustomerData({
    this.CustomerName,
    this.AccountTYPE,
    this.CustomerTpe,
    this.Country,
    this.SiteName,
    this.SiteLocation,
    this.SiteTimezone,
    this.NetworkName,
    this.partnerAdminData,
    this.SuperAdminName,
    this.SuperAdminPhone,
    this.SuperAdminEmail,
  });

  CustomerData copyWith({
    String? CustomerName,
    String? AccountTYPE,
    String? CustomerTpe,
    String? Country,

    //
    String? SiteName,
    String? SiteLocation,
    String? SiteTimezone,
    String? NetworkName,
    //
    List<PartnerAdminData>? partnerAdminData,
    TextEditingController? SuperAdminName,
    TextEditingController? SuperAdminPhone,
    TextEditingController? SuperAdminEmail,
  }) {
    return CustomerData(
      CustomerName: CustomerName ?? this.CustomerName,
      AccountTYPE: AccountTYPE ?? this.AccountTYPE,
      CustomerTpe: CustomerTpe ?? this.CustomerTpe,
      Country: Country ?? this.Country,
      //
      SiteName: SiteName ?? this.SiteName,
      SiteLocation: SiteLocation ?? this.SiteLocation,
      SiteTimezone: SiteTimezone ?? this.SiteTimezone,
      NetworkName: NetworkName ?? this.NetworkName,
      //

      partnerAdminData: partnerAdminData ?? this.partnerAdminData,
      SuperAdminName: SuperAdminName ?? this.SuperAdminName,
      SuperAdminPhone: SuperAdminPhone ?? this.SuperAdminPhone,
      SuperAdminEmail: SuperAdminEmail ?? this.SuperAdminEmail,
      //
    );
  }
}

class CreateNewCustomerProvider extends StateNotifier<CustomerData> {
  CreateNewCustomerProvider() : super(CustomerData());
  final CreateNewCustomerApiService _createNewCustomer_ApiService =
      CreateNewCustomerApiService();

  Future<MessageResponse?> CreateNewCustomerPost() async {
    print("CreateNewCustomerPost ${tokenId?.length}");

    var partnersIntegratorId =
        selectedPartners!.integrator[0].id; // asume only one integrator in list

    MessageResponse? _CreateNewCustRESULT =
        await _createNewCustomer_ApiService.createNewCustomerPost(
            tokenId.toString(),
            PARTNERid!,
            partnersIntegratorId.toString(),
            state);

    if (_CreateNewCustRESULT != null &&
        _CreateNewCustRESULT!.type == "success") {
      print("Customer Created Succesfully");
      // state = state.copyWith(userDetailsModel: _UserDetails);
    }
    return _CreateNewCustRESULT;
  }

  bool updateCustomerDetails(String CustomerName, String AccountTYPE,
      String CustomerTpe, String Country) {
    state = state.copyWith(
        CustomerName: CustomerName,
        AccountTYPE: AccountTYPE,
        CustomerTpe: CustomerTpe,
        Country: Country);
    return true;
  }

  bool updateSiteDetails(
    String SiteName,
    String SiteLocation,
    String SiteTimezone,
    String NetworkName,
  ) {
    state = state.copyWith(
        SiteName: SiteName,
        SiteLocation: SiteLocation,
        SiteTimezone: SiteTimezone,
        NetworkName: NetworkName);
    return true;
  }

  bool updatePartnerAdminDetails(
      List<PartnerAdminData> partnerAdminData, int partnerListLength) {
    print("updateSuperAdminDetails:$partnerListLength");
    List<PartnerAdminData> partnerAdminList = [];
    for (int i = 0; i <= partnerListLength; i++) // check condition <=//<
      partnerAdminList.add(partnerAdminData[i]);
    state = state.copyWith(partnerAdminData: partnerAdminList);
    return true;
  }

  bool updateSuperAdminDetails(
    TextEditingController SuperAdminName,
    TextEditingController SuperAdminPhone,
    TextEditingController SuperAdminEmail,
  ) {
    state = state.copyWith(
        SuperAdminName: SuperAdminName,
        SuperAdminPhone: SuperAdminPhone,
        SuperAdminEmail: SuperAdminEmail);

    // remove
    if (SuperAdminName.text.toString().length > 3 &&
        SuperAdminPhone.text.toString().length > 3 &&
        SuperAdminPhone.text.toString().length > 3) {
      List<PartnerAdminData>? adminList = state.partnerAdminData;
      PartnerAdminData SuperAdminData = PartnerAdminData(
          SuperAdminName, SuperAdminEmail, SuperAdminPhone, "2");

      print(
          "admindatafrom provider:${SuperAdminData.partnerAdminNameController.text}");
      adminList!.add(SuperAdminData);
      state = state.copyWith(partnerAdminData: adminList);
    }
// SuperAdminData.
    return true;
  }
}

final createNewCustomerProvider =
    StateNotifierProvider<CreateNewCustomerProvider, CustomerData>(
        (ref) => CreateNewCustomerProvider());
