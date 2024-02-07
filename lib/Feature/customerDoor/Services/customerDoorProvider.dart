// dashboard_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/dashboard/Services/dashboardAPI_Service.dart';

import '../../../Gobal File/GobalModel.dart';
import '../../../Gobal File/GobalVariable.dart';
import '../../dashboard/SubFeatures/createNewCustomer/Services/createNewCustomerProvider.dart';
import '../Model/accessPointList_Model.dart';
import 'customerDoorAPI_Service.dart';

class CustomerDoorData {
  // final SelectedOrganisationDetail? organisationDetailsModel;
  // final OverviewDetailModel? overviewDetailModel;
  final List<AccessPointListModel>? accessPointList;

  CustomerDoorData({
    // this.overviewDetailModel,
    this.accessPointList,
    // this.organisationDetailsModel,
  });

  CustomerDoorData copyWith({
    //   SelectedOrganisationDetail? organisationDetailsModel,
    //   OverviewDetailModel? overviewDetailModel,
    final List<AccessPointListModel>? accessPointList,
  }) {
    return CustomerDoorData(
      // organisationDetailsModel:
      //     organisationDetailsModel ?? this.organisationDetailsModel,
      // overviewDetailModel: overviewDetailModel ?? this.overviewDetailModel,
      accessPointList: accessPointList ?? this.accessPointList,
    );
  }
}

class CustomerDoorProvider extends StateNotifier<CustomerDoorData> {
  CustomerDoorProvider() : super(CustomerDoorData());
  final CustDoorApiService _custDoor_ApiService = CustDoorApiService();

  Future<List<AccessPointListModel>?> fetchDoorsList(String orgId) async {
    print("fetchAccessPointsList orgId$orgId");

    final _accessPointListDetails =
        await _custDoor_ApiService.fetchDoorsList(tokenId.toString(), orgId);

    if (_accessPointListDetails != null) {
      List<AccessPointListModel>? doorsList =
          filterDoors(_accessPointListDetails);
      state = state.copyWith(accessPointList: doorsList);
      return doorsList;
    }
  }

  // Future<bool?> updateCustomerDetailsPatch(
  //   String orgId,
  //   CustomerData updatecustomer,
  // ) async {
  //   print("updateCustomerDetailsPatch");

  //   final _SitesDetails = await _custSite_ApiService.updateCustomerDetailsPatch(
  //       tokenId!, orgId, updatecustomer);

  //   if (_SitesDetails != null) {
  //     // state = state.copyWith(SiteList: _SitesDetails);
  //     fetchSelectedOrgDetails(orgId);
  //   }
  // }

  Future<MessageResponse?> createAccessPointPost(
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
    print("createNewSitePost$configuration");

    final _CreateDoorResponse =
        await _custDoor_ApiService.createAccessPointPost(
      tokenId!,
      orgId,
      name,
      installationMethod,
      configuration,
      siteId,
      networkId,
      serialNumberDevice1,
      serialNumberDevice2,
      lockingMechanism,
      relayOnTime,
      invertRelayLogic,
      enableAttendance,
    );
    print("provider :${_CreateDoorResponse!.type}");
    if (_CreateDoorResponse!.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
      await fetchDoorsList(orgId);
    }
    return _CreateDoorResponse;
  }

  // Future<MessageResponse?> deleteAnSite(
  //   String siteId,
  //   String orgId,
  // ) async {
  //   print("deleteAnSite$siteId");

  //   final _SitesDetails =
  //       await _custSite_ApiService.deleteAnSite(tokenId!, siteId);

  //   print("provider deleteAnSite :${_SitesDetails!.type}");
  //   if (_SitesDetails!.type == "success") {
  //     // state = state.copyWith(SiteList: _SitesDetails);
  //     // await fetchSitesDetails(orgId);
  //   }
  //   return _SitesDetails;
  // }
}

final customerDoorProvider =
    StateNotifierProvider<CustomerDoorProvider, CustomerDoorData>(
        (ref) => CustomerDoorProvider());

List<AccessPointListModel>? filterDoors(
    List<AccessPointListModel>? accessPointListDetails) {
  List<AccessPointListModel>? doorListDetails = [];
  if (accessPointListDetails == null || accessPointListDetails.isEmpty) {
    return accessPointListDetails;
  }

  for (int i = 0; i < accessPointListDetails.length; i++) {
    if (accessPointListDetails[i].configuration != 3 &&
        accessPointListDetails[i].configuration != 4) {
      doorListDetails.add(accessPointListDetails[i]);
    }
  }
  return doorListDetails;
}
