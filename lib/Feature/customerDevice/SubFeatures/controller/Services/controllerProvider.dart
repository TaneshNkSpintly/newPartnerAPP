// dashboard_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/customerDoor/Model/accessPointList_Model.dart';

import '../../../../../Gobal File/GobalModel.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import 'controllerAPI_Service.dart';

class ControllerData {
  // final SelectedOrganisationDetail? organisationDetailsModel;
  // final OverviewDetailModel? overviewDetailModel;
  final List<AccessPointListModel>? controllerList;

  ControllerData({
    // this.overviewDetailModel,
    this.controllerList,
    // this.organisationDetailsModel,
  });

  ControllerData copyWith({
    //   SelectedOrganisationDetail? organisationDetailsModel,
    //   OverviewDetailModel? overviewDetailModel,
    final List<AccessPointListModel>? controllerList,
  }) {
    return ControllerData(
      // organisationDetailsModel:
      //     organisationDetailsModel ?? this.organisationDetailsModel,
      // overviewDetailModel: overviewDetailModel ?? this.overviewDetailModel,
      controllerList: controllerList ?? this.controllerList,
    );
  }
}

class CustomerControllerProvider extends StateNotifier<ControllerData> {
  CustomerControllerProvider() : super(ControllerData());
  final ControllerApiService _custController_ApiService =
      ControllerApiService();

  Future<List<AccessPointListModel>?> fetchControllerList(String orgId) async {
    print("fetchControllerList orgId$orgId,, ${tokenId?.length}");

    final _accessPointListDetails = await _custController_ApiService
        .fetchControllerList(tokenId.toString(), orgId);

    if (_accessPointListDetails != null) {
      List<AccessPointListModel>? controllerList =
          filterController(_accessPointListDetails);
      state = state.copyWith(controllerList: controllerList);
      return controllerList;
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

  Future<MessageResponse?> createNewControllerPost(
    String orgId,
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
    print("createNewControllerPost$siteId:  $siteId");

    MessageResponse? _resultCreateMeshIO =
        await _custController_ApiService.createNewControllerPost(
            tokenId!,
            chanelName1,
            chanelSerialNumber1,
            chanelName2,
            chanelSerialNumber2,
            installationMethod,
            configuration,
            lockingMechanism,
            siteId,
            networkId,
            serialNumbeController,
            relayOnTime,
            invertRelayLogic);
    print("provider :${_resultCreateMeshIO!.type}");
    if (_resultCreateMeshIO.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
      await fetchControllerList(orgId);
    }
    return _resultCreateMeshIO;
  } //tokenId!

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

final customerControllerProvider =
    StateNotifierProvider<CustomerControllerProvider, ControllerData>(
        (ref) => CustomerControllerProvider());

List<AccessPointListModel>? filterController(
    List<AccessPointListModel>? accessPointListDetails) {
  List<AccessPointListModel>? controllerListDetails = [];
  if (accessPointListDetails == null || accessPointListDetails.isEmpty) {
    return accessPointListDetails;
  }

  for (int i = 0; i < accessPointListDetails.length; i++) {
    if (accessPointListDetails[i].configuration == 3 ||
        accessPointListDetails[i].configuration == 4) {
      controllerListDetails.add(accessPointListDetails[i]);
    }
  }

  return controllerListDetails;
}
