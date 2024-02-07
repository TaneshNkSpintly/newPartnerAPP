import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Gobal File/GobalModel.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../Model/meshIoList_Model.dart';
import 'meshIOAPI_Service.dart';

class MeshIOData {
  // final SelectedOrganisationDetail? organisationDetailsModel;
  // final OverviewDetailModel? overviewDetailModel;
  final List<MeshioListModel>? meshioList;

  MeshIOData({
    // this.overviewDetailModel,
    this.meshioList,
    // this.organisationDetailsModel,
  });

  MeshIOData copyWith({
    //   SelectedOrganisationDetail? organisationDetailsModel,
    //   OverviewDetailModel? overviewDetailModel,
    final List<MeshioListModel>? meshioList,
  }) {
    return MeshIOData(
      // organisationDetailsModel:
      //     organisationDetailsModel ?? this.organisationDetailsModel,
      // overviewDetailModel: overviewDetailModel ?? this.overviewDetailModel,
      meshioList: meshioList ?? this.meshioList,
    );
  }
}

class MeshIODataProvider extends StateNotifier<MeshIOData> {
  MeshIODataProvider() : super(MeshIOData());
  final MeshIOApiService _meshIO_ApiService = MeshIOApiService();

  Future<List<MeshioListModel>?> fetchMeshIoList(String orgId) async {
    print("fetchSiteOverviewDetails orgId$orgId,, ${tokenId?.length}");

    final _meshioList =
        await _meshIO_ApiService.fetchMeshIoList(tokenId.toString(), orgId);

    if (_meshioList != null) {
      state = state.copyWith(meshioList: _meshioList);
      return _meshioList;
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

  Future<MessageResponse?> createNewMeshIoPost(
    String orgId,
    String meshioName,
    int siteId,
    int networkId,
    String serialNumbeMeshIo,
  ) async {
    print("createNewMeshIoPost$siteId:  $siteId");

    MessageResponse? _resultCreateMeshIO =
        await _meshIO_ApiService.createNewMeshIoPost(
            tokenId!, meshioName, siteId, networkId, serialNumbeMeshIo);
    print("provider :${_resultCreateMeshIO!.type}");
    if (_resultCreateMeshIO.type == "success") {
      // state = state.copyWith(SiteList: _SitesDetails);
      await fetchMeshIoList(orgId);
    }
    return _resultCreateMeshIO;
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

final meshIODataProvider =
    StateNotifierProvider<MeshIODataProvider, MeshIOData>(
        (ref) => MeshIODataProvider());
