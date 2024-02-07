// dashboard_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'customerDoorAPI_Service.dart';

class CustomerSiteData {
  // final SelectedOrganisationDetail? organisationDetailsModel;
  // final OverviewDetailModel? overviewDetailModel;
  // final List<SitesModel>? SiteList;

  CustomerSiteData(
      //{
      // this.overviewDetailModel,
      // this.SiteList,
      // this.organisationDetailsModel,
      // }
      );

  CustomerSiteData copyWith(
      //   {

      //   SelectedOrganisationDetail? organisationDetailsModel,
      //   OverviewDetailModel? overviewDetailModel,
      //   final List<SitesModel>? SiteList,
      // }
      ) {
    return CustomerSiteData(
        // organisationDetailsModel:
        //     organisationDetailsModel ?? this.organisationDetailsModel,
        // overviewDetailModel: overviewDetailModel ?? this.overviewDetailModel,
        // SiteList: SiteList ?? this.SiteList,
        );
  }
}

class CustomerDoorProvider extends StateNotifier<CustomerSiteData> {
  CustomerDoorProvider() : super(CustomerSiteData());
  final CustDoorApiService _custDoor_ApiService = CustDoorApiService();

  // Future<OverviewDetailModel?> fetchSiteOverviewDetails(String orgId) async {
  //   print("fetchSiteOverviewDetails orgId$orgId,, ${tokenId?.length}");

  //   final _overivewDetails = await _custSite_ApiService
  //       .fetchSiteOverviewDetails(tokenId.toString(), orgId);

  //   if (_overivewDetails != null) {
  //     state = state.copyWith(overviewDetailModel: _overivewDetails);
  //     return _overivewDetails;
  //   }
  // }

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

  // Future<MessageResponse?> createNewSitePost(
  //   String orgId,
  //   String name,
  //   String location,
  //   String timezone,
  //   String networksname1,
  //   String? networksname2,
  // ) async {
  //   print("createNewSitePost$networksname1:  $networksname2");

  //   final _SitesDetails = await _custSite_ApiService.createNewSitePost(
  //     tokenId!,
  //     orgId,
  //     name,
  //     location,
  //     timezone,
  //     networksname1,
  //     networksname2,
  //   );
  //   print("provider :${_SitesDetails!.type}");
  //   if (_SitesDetails!.type == "success") {
  //     // state = state.copyWith(SiteList: _SitesDetails);
  //     await fetchSitesDetails(orgId);
  //   }
  //   return _SitesDetails;
  // }

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
    StateNotifierProvider<CustomerDoorProvider, CustomerSiteData>(
        (ref) => CustomerDoorProvider());
