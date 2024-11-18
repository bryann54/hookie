// user_model.dart
class User {
  final int id;
  final String name;
  final int age;
  final String profession;
  final String imageUrl;
  final String bio;
  final String city;
  final String country;
  final List<String> hobbies;

  User(
      {required this.id,
      required this.country,
      required this.name,
      required this.city,
      required this.age,
      required this.profession,
      required this.imageUrl,
      required this.bio,
      required this.hobbies});
}
