// dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Feature/dashboard/Services/dashboardProvider.dart';

class DashBoardTest1 extends ConsumerWidget {
  DashBoardTest1({Key? key}) : super(key: key);
  bool customInitSate = false;

  Future<void> initsta(WidgetRef ref) async {
    //await ref.read(dashboardProvider.notifier).fetchDashboardDetails();
    // await ref.read(dashboardProvider.notifier).fetchConfigurationDetails();
    //  await ref.read(dashboardProvider.notifier).fetchUserDetails();

    await ref.read(dashboardProvider.notifier).fetchOrganisationDetails();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardData = ref.watch(dashboardProvider);

    if (customInitSate == false) {
      initsta(ref);
      customInitSate = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (dashboardData != null &&
                dashboardData.userDetailsModel != null &&
                dashboardData.userDetailsModel!.partners.isNotEmpty)
              Text(
                'User Name: ${dashboardData.userDetailsModel!.partners[0].name}',
              ),

            // Add other UI components based on user and client details
            if (dashboardData != null &&
                dashboardData.dashboarDetailModel != null) ...[
              Text(
                'noOfAccessPoints: ${dashboardData.dashboarDetailModel!.noOfAccessPoints.toString()}',
              ),
            ] else ...[
              Center(
                child: CircularProgressIndicator(),
              )
            ],
            if (dashboardData != null &&
                dashboardData.organizationList != null) ...[
              Text(
                'organizationListResponse: ${dashboardData.organizationList![2].name.toString()}',
              ),
              Text(
                'organizationListid: ${dashboardData.organizationList![2].id.toString()}',
              ),
            ] else ...[
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(dashboardProvider.notifier).fetchDashboardDetails();
        },
        tooltip: 'Fetch User Details',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
