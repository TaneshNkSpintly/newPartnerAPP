class AccessPointListModel {
  final int id;
  final String name;
  final int networkId;
  final String networkName;
  final int accessPointType;
  final int siteId;
  final String siteName;
  final bool enableAttendance;
  final int installationMethod;
  final int configuration;
  final int channelNo;
  final int lockingMechanism;
  final RelaySettings relaySettings;
  final String resourceState;
  final List<Device> devices;

  AccessPointListModel({
    required this.id,
    required this.name,
    required this.networkId,
    required this.networkName,
    required this.accessPointType,
    required this.siteId,
    required this.siteName,
    required this.enableAttendance,
    required this.installationMethod,
    required this.configuration,
    required this.channelNo,
    required this.lockingMechanism,
    required this.relaySettings,
    required this.resourceState,
    required this.devices,
  });

  factory AccessPointListModel.fromJson(Map<String, dynamic> json) {
    return AccessPointListModel(
      id: json['id'],
      name: json['name'],
      networkId: json['networkId'],
      networkName: json['networkName'],
      accessPointType: json['accessPointType'],
      siteId: json['siteId'],
      siteName: json['siteName'],
      enableAttendance: json['enableAttendance'],
      installationMethod: json['installationMethod'],
      configuration: json['configuration'],
      channelNo: json['channelNo'],
      lockingMechanism: json['lockingMechanism'],
      relaySettings: RelaySettings.fromJson(json['relaySettings']),
      resourceState: json['resourceState'],
      devices: (json['devices'] as List<dynamic>)
          .map((device) => Device.fromJson(device))
          .toList(),
    );
  }
}

class RelaySettings {
  final int relayOnTime;
  final bool invertRelayLogic;

  RelaySettings({
    required this.relayOnTime,
    required this.invertRelayLogic,
  });

  factory RelaySettings.fromJson(Map<String, dynamic> json) {
    return RelaySettings(
      relayOnTime: json['relayOnTime'],
      invertRelayLogic: json['invertRelayLogic'],
    );
  }
}

class Device {
  final String serialNumber;
  final int type;
  final int configurationStatus;
  final int connectivityStatus;
  final String resourceState;
  final int firmwareVersion;
  final bool showResetButton;

  Device({
    required this.serialNumber,
    required this.type,
    required this.configurationStatus,
    required this.connectivityStatus,
    required this.resourceState,
    required this.firmwareVersion,
    required this.showResetButton,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      serialNumber: json['serialNumber'],
      type: json['type'],
      configurationStatus: json['configurationStatus'],
      connectivityStatus: json['connectivityStatus'],
      resourceState: json['resourceState'],
      firmwareVersion: json['firmwareVersion'],
      showResetButton: json['showResetButton'],
    );
  }
}
