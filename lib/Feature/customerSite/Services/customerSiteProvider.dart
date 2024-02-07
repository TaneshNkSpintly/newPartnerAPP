// dashboard_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/dashboard/Services/dashboardAPI_Service.dart';

import '../../../Gobal File/GobalModel.dart';
import '../../../Gobal File/GobalVariable.dart';
import '../../dashboard/SubFeatures/createNewCustomer/Services/createNewCustomerProvider.dart';
import '../Modal/siteOverview_Model.dart';
import '../Modal/sites_Model.dart';
import 'customerSiteAPI_Service.dart';

class CustomerSiteData {
  final SelectedOrganisationDetail? organisationDetailsModel;
  final OverviewDetailModel? overviewDetailModel;
  final List<SitesModel>? SiteList;

  CustomerSiteData({
    this.overviewDetailModel,
    this.SiteList,
    this.organisationDetailsModel,
  });

  CustomerSiteData copyWith({
    SelectedOrganisationDetail? organisationDetailsModel,
    OverviewDetailModel? overviewDetailModel,
    final List<SitesModel>? SiteList,
  }) {
    return CustomerSiteData(
      organisationDetailsModel:
          organisationDetailsModel ?? this.organisationDetailsModel,
      overviewDetailModel: overviewDetailModel ?? this.overviewDetailModel,
      SiteList: SiteList ?? this.SiteList,
    );
  }
}

class CustomerSiteProvider extends StateNotifier<CustomerSiteData> {
  CustomerSiteProvider() : super(CustomerSiteData());
  final CustSiteApiService _custSite_ApiService = CustSiteApiService();

  Future<OverviewDetailModel?> fetchSiteOverviewDetails(String orgId) async {
    print("fetchSiteOverviewDetails orgId$orgId,, ${tokenId?.length}");

    final _overivewDetails = await _custSite_ApiService
        .fetchSiteOverviewDetails(tokenId.toString(), orgId);

    if (_overivewDetails != null) {
      state = state.copyWith(overviewDetailModel: _overivewDetails);
      return _overivewDetails;
    }
  }

  Future<SelectedOrganisationDetail?> fetchSelectedOrgDetails(
      String orgId) async {
    print("fetchSelectedOrgDetails ${tokenId?.length}");

    final _selectedOrganisationDetail = await _custSite_ApiService
        .fetchSelectedOrgDetails(tokenId.toString(), orgId);

    if (_selectedOrganisationDetail != null) {
      state =
          state.copyWith(organisationDetailsModel: _selectedOrganisationDetail);
      return _selectedOrganisationDetail;
    }
  }

  Future<List<SitesModel>?> fetchSitesDetails(String orgId) async {
    print("fetchSitesDetails ${tokenId?.length}");

    final _SitesDetails =
        await _custSite_ApiService.fetchSitesDetails(tokenId.toString(), orgId);

    if (_SitesDetails != null) {
      state = state.copyWith(SiteList: _SitesDetails);
    }
    return _SitesDetails;
  }

  Future<bool?> updateCustomerDetailsPatch(
    String orgId,
    CustomerData updatecustomer,
  ) async {
    print("updateCustomerDetailsPatch");

    final _SitesDetails = await _custSite_ApiService.updateCustomerDetailsPatch(
        tokenId!, orgId, updatecustomer);

    if (_SitesDetails != null) {
      // state = state.copyWith(SiteList: _SitesDetails);
      fetchSelectedOrgDetails(orgId);
    }
  }

  Future<MessageResponse?> createNewSitePost(
    String orgId,
    String name,
    String location,
    String timezone,
    String networksname1,
    String? networksname2,
  ) async {
    print("createNewSitePost$networksname1:  $networksname2");

    final _SitesDetails = await _custSite_ApiService.createNewSitePost(
      tokenId!,
      orgId,
      name,
      location,
      timezone,
      networksname1,
      networksname2,
    );
    print("provider :${_SitesDetails!.type}");
    if (_SitesDetails!.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
      await fetchSitesDetails(orgId);
    }
    return _SitesDetails;
  }

  Future<MessageResponse?> deleteAnSite(
    String siteId,
    String orgId,
  ) async {
    print("deleteAnSite$siteId");

    final _SitesDetails =
        await _custSite_ApiService.deleteAnSite(tokenId!, siteId);

    print("provider deleteAnSite :${_SitesDetails!.type}");
    if (_SitesDetails!.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
      // await fetchSitesDetails(orgId);
    }
    return _SitesDetails;
  }

  
  Future<MessageResponse?> updateSiteDetails_deleteNetwork(
    String networkId,
    String orgId,
  ) async {
    print("updateSiteDetails_deleteNetwork$networkId");

    final _SitesDetails =
        await _custSite_ApiService.updateSiteDetails_deleteNetwork(tokenId!, networkId);

    print("provider deleteAnnetwork:${_SitesDetails!.type}");
    if (_SitesDetails!.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
     await Future.delayed(Duration(seconds: 2));
       await fetchSitesDetails(orgId);
    }
    return _SitesDetails;
  }

  
  Future<MessageResponse?> updateSiteDetailsPATCH(
   String orgId,
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
    print("updateSiteDetailsPATCH$siteId");
 print("network2$networksname2;;;$networkId2");

    final _SitesDetails =
        await _custSite_ApiService.updateSiteDetailsPATCH(tokenId!, siteId, name,initaialSitename,
   location,timezone,networksname1,networkId1,networksname2, networkId2,);

    print("provider deleteAnnetwork:${_SitesDetails!.type}");
    if (_SitesDetails!.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
    // await Future.delayed(Duration(seconds: 2));
       await fetchSitesDetails(orgId);
    }
    return _SitesDetails;
  }

  Future<MessageResponse?> updateSiteDetails_AddNetwork(
    String orgId,
    String siteId,
    String siteName,
    String networksname,
    //FOR updateSiteDetailsPATCH
    bool onlycreatedNetwork,
    String name,
    String initaialSitename,
    String location,
    String timezone,
    String networksname1,
    int? networkId1,
    String? networksname2,
    int? networkId2,
  ) async {
    print("updateSiteDetails_AddNetwork$siteId");
 print("network2$networksname2;;;$networkId2");

    MessageResponse? ResponsefromUPDATEsiteDETAILS  =
        await _custSite_ApiService.updateSiteDetailsPATCH(tokenId!, siteId, name,initaialSitename,
   location,timezone,networksname1,networkId1,networksname2, networkId2,);

   print("provider :${ResponsefromUPDATEsiteDETAILS!.type}");

    
    
    print("start updateSiteDetailsAddNetwork");
    //
    MessageResponse? ResponsefromUPDATEsiteAddNETWORK  =
        await _custSite_ApiService.updateSiteDetails_AddNetwork( tokenId!, siteId,siteName, networksname);

    print("provider ResponsefromUPDATEsiteAddNETWORK:${ResponsefromUPDATEsiteAddNETWORK!.type}");
    if (ResponsefromUPDATEsiteAddNETWORK!.type == "success") {
   //   state = state.copyWith(SiteList: _SitesDetails);
    await Future.delayed(Duration(seconds: 2));
      await fetchSitesDetails(orgId);
    }
    
    return ResponsefromUPDATEsiteAddNETWORK;
  }

}

final customerSiteProvider =
    StateNotifierProvider<CustomerSiteProvider, CustomerSiteData>(
        (ref) => CustomerSiteProvider());
