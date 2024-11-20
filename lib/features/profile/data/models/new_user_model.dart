class NewUserModel {
  final String name;
  final String email;
  final String dob;
  final String mobileNumber;
  final String address;

  NewUserModel({
    required this.name,
    required this.email,
    required this.dob,
    required this.mobileNumber,
    required this.address,
  });

  // Factory method for creating a NewUserModel from a Map (if needed for APIs)
  factory NewUserModel.fromMap(Map<String, dynamic> map) {
    return NewUserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      dob: map['dob'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      address: map['address'] ?? '',
    );
  }

  // Convert NewUserModel to Map (if needed for APIs)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'dob': dob,
      'mobileNumber': mobileNumber,
      'address': address,
    };
  }
}
