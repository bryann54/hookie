class UserModel {
  final String id;
  final String identifier; // email or phone
  final String signupMethod;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.identifier,
    required this.signupMethod,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      identifier: json['identifier'],
      signupMethod: json['signupMethod'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'identifier': identifier,
      'signupMethod': signupMethod,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
