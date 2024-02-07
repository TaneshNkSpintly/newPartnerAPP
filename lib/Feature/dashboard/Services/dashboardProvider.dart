// dashboard_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/dashboard/Modal/dashboarDetail_Model.dart';
import 'package:partner_app/Feature/dashboard/Modal/orgainsations_Model.dart';
import 'package:partner_app/Feature/dashboard/Services/dashboardAPI_Service.dart';

import '../../../Gobal File/GobalVariable.dart';
import '../Modal/ConfigurationResponse_Model.dart';
import '../Modal/userDetail_Model.dart';

class DashboardData {
  final UserDetailsModel? userDetailsModel;
  final int? selectedPartnerIndex;
  final CongurationModel? congurationModel;
  final DashboarDetailModel? dashboarDetailModel;
  final List<Organisation>? organizationList;

  DashboardData({
    this.userDetailsModel,
    this.congurationModel,
    this.dashboarDetailModel,
    this.organizationList,
    this.selectedPartnerIndex,
  });

  DashboardData copyWith({
    UserDetailsModel? userDetailsModel,
    CongurationModel? congurationModel,
    DashboarDetailModel? dashboarDetailModel,
    List<Organisation>? organizationList,
    final int? selectedPartnerIndex,
  }) {
    return DashboardData(
      userDetailsModel: userDetailsModel ?? this.userDetailsModel,
      congurationModel: congurationModel ?? this.congurationModel,
      dashboarDetailModel: dashboarDetailModel ?? this.dashboarDetailModel,
      organizationList: organizationList ?? this.organizationList,
      selectedPartnerIndex: selectedPartnerIndex ?? this.selectedPartnerIndex,
    );
  }
}

class DashBoardProvider extends StateNotifier<DashboardData> {
  DashBoardProvider() : super(DashboardData());
  final DashBoardApiService _dashboard_ApiService = DashBoardApiService();

  Future<DashboardData?> fetchUserDetails() async {
    print("fetchUserDetails ${tokenId?.length}");

    if (tokenId != null) {
      final _UserDetails =
          await _dashboard_ApiService.fetchUserDetails(tokenId.toString());

      if (_UserDetails != null) {
        // state = state.copyWith(userDetailsModel: _UserDetails);

        if (_UserDetails.partners != null) {
          print("state.userDetailsModel.partner[0].namet");
          print(_UserDetails!.partners[0].name);

          state = state.copyWith(
              userDetailsModel: _UserDetails, selectedPartnerIndex: 0);
          return state;
        } else {
          print("userDetailsModel is null");
        }
      } else {
        print("User details is null");
      }
    } else {
      print("Token ID is null. Cannot fetch user details.");
    }
  }

  DashboardData? UpdatePartnerIndex(int index) {
    state = state.copyWith(selectedPartnerIndex: index);
    // return state;
  }

  DashboardData? RefreshState() {
    return state = state;
  }

  Future<DashboardData?> fetchDashboardDetails() async {
    print("fetchDashboardDetails ${tokenId?.length}");

    if (tokenId != null) {
      final _DashboardDetails =
          await _dashboard_ApiService.fetchDashboardDetails(tokenId.toString());

      if (_DashboardDetails != null) {
        state = state.copyWith(dashboarDetailModel: _DashboardDetails);

        if (state.dashboarDetailModel != null) {
          print("state.dashboarDetailModel.noOfAccessPoints");
          print(state.dashboarDetailModel!.noOfAccessPoints);
        } else {
          print("DashboarDetailModel is null");
        }
        return state;
      } else {
        print("Dashboard details is null");
      }
    } else {
      print("Token ID is null. Cannot fetch dashboard details.");
    }
  }

  Future<void> fetchConfigurationDetails() async {
    print("fetchConfigurationDetails ${tokenId?.length}");

    if (tokenId != null) {
      final _ConfigurationDetails = await _dashboard_ApiService
          .fetchConfigurationDetails(tokenId.toString());

      if (_ConfigurationDetails != null) {
        state = state.copyWith(congurationModel: _ConfigurationDetails);
      } else {
        print("Configuration details is null");
      }
    } else {
      print("Token ID is null. Cannot fetch configuration details.");
    }
  }

  Future<DashboardData?> fetchOrganisationDetails() async {
    print("fetchOrganisationDetails ");

    var partnerId = state
        .userDetailsModel!.partners[state.selectedPartnerIndex!].partnerId
        .toString();
    var partner = state.userDetailsModel!.partners[state.selectedPartnerIndex!];
    PARTNERid = partnerId;
    selectedPartners = partner;

    List<Organisation>? _organizationListResponse = await _dashboard_ApiService
        .fetchOrganisationDetails(tokenId.toString(), partnerId);

    if (_organizationListResponse != null) {
      _organizationListResponse =
          sortSiteListDescending(_organizationListResponse);

      state = state.copyWith(organizationList: _organizationListResponse);
      return state;
    }
  }
}

final dashboardProvider =
    StateNotifierProvider<DashBoardProvider, DashboardData>(
        (ref) => DashBoardProvider());

List<Organisation>? sortSiteListDescending(
    List<Organisation>? OrganisationList) {
  if (OrganisationList == null || OrganisationList.isEmpty) {
    return OrganisationList;
  }

  OrganisationList.sort((a, b) => b.id.compareTo(a.id));

  return OrganisationList;
}
