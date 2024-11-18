import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/discover/presentation/widgets/radial_user_avatar.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final UserRepository _userRepository = UserRepository();
  late List<User> users;
  late User? centralUser;
  late AnimationController _animationController;
  late Animation<double> _searchAnimation;
  bool _isSearching = true;

  @override
  void initState() {
    super.initState();
    users = [];
    centralUser = null;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    );

    _searchAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _startSearchAnimation();
  }

  Future<void> _startSearchAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      _animationController.forward();
      _loadUsers();
    }
  }

  Future<void> _loadUsers() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        users = _userRepository.getUsers();
        centralUser = users[Random().nextInt(users.length)];
        users.remove(centralUser);
        _isSearching = false;
      });
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateCentralUser(User newCentralUser) {
    setState(() {
      if (centralUser != null) {
        users.add(centralUser!);
      }
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_isSearching) ...[
                      const SizedBox(width: 12),
                      _buildSearchingIndicator(),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: _isSearching
                    ? _buildSearchingAnimation()
                    : RadialUsersDisplay(
                        centralUser: centralUser!,
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

  Widget _buildSearchingIndicator() {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
      ),
    );
  }

  Widget _buildSearchingAnimation() {
    return Center(
      child: AnimatedBuilder(
        animation: _searchAnimation,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.purple.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Ripple effect
                    ...List.generate(3, (index) {
                      return Transform.scale(
                        scale: 1 + (_searchAnimation.value * 0.5 * (index + 1)),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple
                                  .withOpacity(0.5 - (index * 0.15)),
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    }),
                    // Center icon
                    const Icon(
                      Icons.search,
                      size: 50,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Discovering new people...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.purple.shade200,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Add this extension for smooth transitions
extension on Widget {
  Widget fadeInTransition(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: this,
    );
  }
}
