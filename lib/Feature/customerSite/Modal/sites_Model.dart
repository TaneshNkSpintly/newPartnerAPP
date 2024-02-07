class SitesModel {
  final int id;
  final String name;
  final String location;
  final String timezone;
  final String resourceState;
  final List<Network> networks;

  SitesModel({
    required this.id,
    required this.name,
    required this.location,
    required this.timezone,
    required this.resourceState,
    required this.networks,
  });

  factory SitesModel.fromJson(Map<String, dynamic> json) {
    return SitesModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      timezone: json['timezone'],
      resourceState: json['resourceState'],
      networks: (json['networks'] as List<dynamic>)
          .map((network) => Network.fromJson(network))
          .toList(),
    );
  }
}

class Network {
  final int id;
  final String name;
  final String extServicesState;

  Network({
    required this.id,
    required this.name,
    required this.extServicesState,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      extServicesState: json['extServicesState'],
    );
  }
}
