class GatewaylistModel {
  final String serialNumber;
  final int networkId;
  final String networkName;
  final int siteId;
  final String siteName;
  final int configurationStatus;
  final int connectivityStatus;
  final int firmwareVersion;
  final String resourceState;
  final bool showResetButton;

  GatewaylistModel({
    required this.serialNumber,
    required this.networkId,
    required this.networkName,
    required this.siteId,
    required this.siteName,
    required this.configurationStatus,
    required this.connectivityStatus,
    required this.firmwareVersion,
    required this.resourceState,
    required this.showResetButton,
  });

  factory GatewaylistModel.fromJson(Map<String, dynamic> json) {
    return GatewaylistModel(
      serialNumber: json['serialNumber'],
      networkId: json['networkId'],
      networkName: json['networkName'],
      siteId: json['siteId'],
      siteName: json['siteName'],
      configurationStatus: json['configurationStatus'],
      connectivityStatus: json['connectivityStatus'],
      firmwareVersion: json['firmwareVersion'],
      resourceState: json['resourceState'],
      showResetButton: json['showResetButton'],
    );
  }
}
