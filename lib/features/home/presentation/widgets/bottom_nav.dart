import 'package:flutter/material.dart';
import 'package:hookee/features/chat/presentation/pages/chats_screen.dart';
import 'package:hookee/features/discover/presentation/pages/discover_screen.dart';
import 'package:hookee/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/presentation/pages/home_screen.dart';
import 'package:hookee/features/profile/presentation/pages/profile_screen.dart';

class NavigationController extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class BottomNav extends StatefulWidget {
  final User user;
  const BottomNav({super.key, required this.user});

  @override
  State createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final NavigationController _controller = NavigationController();

  // Create the list of screens dynamically, passing `widget.user` to ChatsScreen
  List<Widget> get _screens {
    return [
      const HomeScreen(),
      const DiscoverScreen(),
      const FavoriteScreen(),
      ChatsScreen(user: widget.user), // Pass the user to ChatsScreen
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    if (_controller.currentIndex == index) return;

    setState(() {
      _controller.setIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_controller.currentIndex], // Show the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _controller.currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF4B8A),
        unselectedItemColor: Colors.grey.shade600,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_fire_department_outlined),
            activeIcon: const Icon(Icons.local_fire_department),
            label: 'For You',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.location_on_outlined),
            activeIcon: const Icon(Icons.location_on),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            activeIcon: const Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            activeIcon: const Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
