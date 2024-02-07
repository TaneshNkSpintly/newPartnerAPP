import 'package:flutter/material.dart';

class OverviewDetailModel {
  final int noOfAccessPoints;
  final int noOfDetachedDevices;
  final int noOfDevices;
  final int noOfGateways;
  final int noOfMeshIOs;
  final int noOfSites;

  OverviewDetailModel({
    required this.noOfAccessPoints,
    required this.noOfDetachedDevices,
    required this.noOfGateways,
    required this.noOfMeshIOs,
    required this.noOfDevices,
    required this.noOfSites,
  });

  factory OverviewDetailModel.fromJson(Map<String, dynamic> json) {
    return OverviewDetailModel(
      noOfAccessPoints: json['NoOfAccessPoints'],
      noOfDetachedDevices: json['NoOfDetachedDevices'],
      noOfGateways: json['NoOfGateways'],
      noOfMeshIOs: json['NoOfMeshIOs'],
      noOfDevices: json['NoOfDevices'],
      noOfSites: json['NoOfSites'],
    );
  }
}

//

class SelectedOrganisationDetail {
  final GeneralSetting generalSetting;
  final bool showDevices;
  final List<Module> modules;
  final String resourceState;
  final String cardType;
  final int handoverStatus;
  final bool saamsIntegration;

  SelectedOrganisationDetail({
    required this.generalSetting,
    required this.showDevices,
    required this.modules,
    required this.resourceState,
    required this.cardType,
    required this.handoverStatus,
    required this.saamsIntegration,
  });

  factory SelectedOrganisationDetail.fromJson(Map<String, dynamic> json) {
    return SelectedOrganisationDetail(
      generalSetting: GeneralSetting.fromJson(json['generalSetting']),
      showDevices: json['showDevices'],
      modules: (json['modules'] as List<dynamic>)
          .map((module) => Module.fromJson(module))
          .toList(),
      resourceState: json['resourceState'],
      cardType: json['cardType'],
      handoverStatus: json['handoverStatus'],
      saamsIntegration: json['saamsIntegration'],
    );
  }
}

class GeneralSetting {
  final String name;
  final String type;
  final String accountType;
  final String country;
  final List<Admin> admins;
  final int partnerId;
  final int integratorId;

  GeneralSetting({
    required this.name,
    required this.type,
    required this.accountType,
    required this.country,
    required this.admins,
    required this.partnerId,
    required this.integratorId,
  });

  factory GeneralSetting.fromJson(Map<String, dynamic> json) {
    return GeneralSetting(
      name: json['name'],
      type: json['type'],
      accountType: json['accountType'],
      country: json['country'],
      admins: (json['admins'] as List<dynamic>)
          .map((admin) => Admin.fromJson(admin))
          .toList(),
      partnerId: json['partnerId'],
      integratorId: json['integratorId'],
    );
  }
}

class Admin {
  final String name;
  final String phone;
  final String email;
  final int adminType;

  Admin({
    required this.name,
    required this.phone,
    required this.email,
    required this.adminType,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      adminType: json['adminType'],
    );
  }
}

class Module {
  final int id;
  final String name;
  final String status;

  Module({
    required this.id,
    required this.name,
    required this.status,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
