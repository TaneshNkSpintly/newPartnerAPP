class UserDetailsModel {
  final List<Partner> partners;
  final String phoneNumber;
  final int userID;

  UserDetailsModel(
      {required this.partners,
      required this.phoneNumber,
      required this.userID});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    var partnerList = json['partners'] as List<dynamic>;
    List<Partner> partners =
        partnerList.map((partner) => Partner.fromJson(partner)).toList();

    return UserDetailsModel(
      partners: partners,
      phoneNumber: json['phoneNumber'],
      userID: json['userID'],
    );
  }
}

class Partner {
  final int partnerId;
  final String partnerName;
  final String name;
  final String email;
  final Role role;
  final List<Integrator> integrator;

  Partner({
    required this.partnerId,
    required this.partnerName,
    required this.name,
    required this.email,
    required this.role,
    required this.integrator,
  });

  factory Partner.fromJson(Map<String, dynamic> json) {
    var integratorList = json['integrator'] as List<dynamic>;
    List<Integrator> integrator =
        integratorList.map((item) => Integrator.fromJson(item)).toList();

    return Partner(
      partnerId: json['partnerId'],
      partnerName: json['partnerName'],
      name: json['name'],
      email: json['email'],
      role: Role.fromJson(json['role']),
      integrator: integrator,
    );
  }
}

class Role {
  final int id;
  final String name;

  Role({required this.id, required this.name});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Integrator {
  final int id;
  final String name;

  Integrator({required this.id, required this.name});

  factory Integrator.fromJson(Map<String, dynamic> json) {
    return Integrator(
      id: json['id'],
      name: json['name'],
    );
  }
}
