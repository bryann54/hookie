import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final UserRepository _userRepository = UserRepository();
  late List<User> users;
  late User centralUser;

  @override
  void initState() {
    super.initState();
    users = _userRepository.getUsers();
    // Randomly select a central user
    centralUser = users[Random().nextInt(users.length)];
    // Remove central user from the display list to avoid duplication
    users.remove(centralUser);
  }

  @override
  Widget build(BuildContext context) {
     Theme.of(context);
    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: Stack(
          children: [
        
            // Content
            SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Chat screen header
                        Text(
                          'Discover',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildRadialUsersDisplay(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadialUsersDisplay(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width, // Make it square
        child: Stack(
          children: [
            // Central user
            _buildCentralUser(),

            // Radial users
            ...List.generate(
              min(5, users.length), // Display up to 5 users
              (index) => _buildRadialPositionedAvatar(
                context,
                users[index],
                angle: (360 / 5) * index,
                distance: MediaQuery.of(context).size.width * 0.35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCentralUser() {
     final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(centralUser.imageUrl),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            centralUser.name,
           style: theme.textTheme.displaySmall?.copyWith(
              height: .5,
            ),
          ),
          Text(
            '${centralUser.age} • ${centralUser.profession}',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 2.6,
            
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadialPositionedAvatar(
    BuildContext context,
    User user, {
    required double angle,
    required double distance,
  }) {
    final radians = angle * (pi / 180);
    final centerX = MediaQuery.of(context).size.width / 2;
    final centerY = MediaQuery.of(context).size.width / 2;

    final xOffset = distance * cos(radians);
    final yOffset = distance * sin(radians);

    return Positioned(
      left: centerX + xOffset - 40,
      top: centerY + yOffset - 40,
      child: GestureDetector(
        onTap: () {
          setState(() {
            users.add(centralUser);
            centralUser = user;
            users.remove(user);
          });
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                user.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
