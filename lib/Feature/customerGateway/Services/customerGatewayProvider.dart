import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Gobal File/GobalModel.dart';
import '../../../Gobal File/GobalVariable.dart';
import '../Model/gatewayList_Model.dart';
import 'customerGatewayAPI_Service.dart';

class CustomerGatewayData {
  // final SelectedOrganisationDetail? organisationDetailsModel;
  // final OverviewDetailModel? overviewDetailModel;
  final List<GatewaylistModel>? gatewaylist;

  CustomerGatewayData({
    // this.overviewDetailModel,
    this.gatewaylist,
    // this.organisationDetailsModel,
  });

  CustomerGatewayData copyWith({
    // SelectedOrganisationDetail? organisationDetailsModel,
    // OverviewDetailModel? overviewDetailModel,
    final List<GatewaylistModel>? gatewaylist,
  }) {
    return CustomerGatewayData(
      // organisationDetailsModel:
      //     organisationDetailsModel ?? this.organisationDetailsModel,
      // overviewDetailModel: overviewDetailModel ?? this.overviewDetailModel,
      gatewaylist: gatewaylist ?? this.gatewaylist,
    );
  }
}

class CustomerGatewayProvider extends StateNotifier<CustomerGatewayData> {
  CustomerGatewayProvider() : super(CustomerGatewayData());
  final CustGatewayApiService _custGateway_ApiService = CustGatewayApiService();

  Future<List<GatewaylistModel>?> fetchGatewayList(String orgId) async {
    print("fetchGatewayList orgId$orgId,, ${tokenId?.length}");

    final _gatewaylistDetails = await _custGateway_ApiService.fetchGatewayList(
        tokenId.toString(), orgId);

    if (_gatewaylistDetails != null) {
      state = state.copyWith(gatewaylist: _gatewaylistDetails);
      print("JK${_gatewaylistDetails[0].networkName}");
      return _gatewaylistDetails;
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

  Future<MessageResponse?> createAccessGatewayPost(
    String orgId,
    int siteId,
    int networkId,
    String serialNumbeGateway,
  ) async {
    print("createAccessGatewayPost$siteId:  $siteId");

    final _resultCreateGateway =
        await _custGateway_ApiService.createAccessGatewayPost(
            tokenId!, siteId, networkId, serialNumbeGateway);
    print("provider :${_resultCreateGateway!.type}");
    if (_resultCreateGateway!.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
      await fetchGatewayList(orgId);
    }
    return _resultCreateGateway;
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

final customerGatewayProvider =
    StateNotifierProvider<CustomerGatewayProvider, CustomerGatewayData>(
        (ref) => CustomerGatewayProvider());
