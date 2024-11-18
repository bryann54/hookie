import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the package
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_controller.currentIndex], // Show the current screen
      bottomNavigationBar: CurvedNavigationBar(
        index: _controller.currentIndex,
        height: 75.0,
        backgroundColor: Colors.transparent, // Matches the screen background
        color: const Color(0xFFFF4B8A), // NavBar background color
        buttonBackgroundColor:
            const Color(0xFFFF4B8A), // Selected icon background color
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            _controller.setIndex(index);
          });
        },
        items: const [
          Icon(Icons.local_fire_department, size: 35, color: Colors.white),
          Icon(Icons.location_on, size: 35, color: Colors.white),
          Icon(Icons.favorite, size: 35, color: Colors.white),
          Icon(Icons.chat_bubble, size: 35, color: Colors.white),
          Icon(Icons.person, size: 35, color: Colors.white),
        ],
      ),
    );
  }
}
