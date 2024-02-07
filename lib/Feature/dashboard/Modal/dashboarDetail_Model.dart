class DashboarDetailModel {
  final int noOfAccessPoints;
  final int noOfDetachedDevices;
  final int noOfGateways;
  final int noOfOrganisations;

  DashboarDetailModel({
    required this.noOfAccessPoints,
    required this.noOfDetachedDevices,
    required this.noOfGateways,
    required this.noOfOrganisations,
  });

  factory DashboarDetailModel.fromJson(Map<String, dynamic> json) {
    return DashboarDetailModel(
      noOfAccessPoints: json['NoOfAccessPoints'],
      noOfDetachedDevices: json['NoOfDetachedDevices'],
      noOfGateways: json['NoOfGateways'],
      noOfOrganisations: json['NoOforganisations'],
    );
  }
}
