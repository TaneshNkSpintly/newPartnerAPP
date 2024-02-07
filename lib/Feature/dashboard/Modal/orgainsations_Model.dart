class Organisation {
  final int id;
  final String name;
  final String resourceState;

  Organisation({
    required this.id,
    required this.name,
    required this.resourceState,
  });

  factory Organisation.fromJson(Map<String, dynamic> json) {
    return Organisation(
      id: json['id'],
      name: json['name'],
      resourceState: json['resourceState'],
    );
  }
}
