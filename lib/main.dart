import 'package:flutter/material.dart';
import 'package:hookee/app.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/profile/data/models/new_user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();

  // Fetch users and select the first user
  final List<User> users = userRepository.getUsers();
  final NewUserModel userModel =NewUserModel(name: 'name', email: 'email', dob: 'dob', mobileNumber: 'mobileNumber', address: 'address');
  final User user =
      users.isNotEmpty ? users.first : throw Exception('No users available');

  runApp(App(user: user, userModel: userModel));
}
