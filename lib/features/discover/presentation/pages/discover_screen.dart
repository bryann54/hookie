import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/discover/presentation/widgets/radial_user_avatar.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final UserRepository _userRepository = UserRepository();
  late List<User> users;
  late User centralUser;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    users = _userRepository.getUsers();
    centralUser = users[Random().nextInt(users.length)];
    users.remove(centralUser);

    // Slower animation for waves
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateCentralUser(User newCentralUser) {
    setState(() {
      users.add(centralUser);
      centralUser = newCentralUser;
      users.remove(newCentralUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: RadialUsersDisplay(
                  centralUser: centralUser,
                  users: users,
                  animationController: _animationController,
                  onCentralUserChanged: _updateCentralUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
