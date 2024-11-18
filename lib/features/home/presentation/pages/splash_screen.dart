import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hookee/core/constants/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToHome();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.elasticOut),
      ),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
    });
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      // Navigation code here
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final theme = Theme.of(context);
    // final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          // Using the new AnimatedBackground widget
          // AnimatedBackground(controller: _controller),

          // Main content
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100.withOpacity(0.5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade200.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Stack(
                        children: [
                          Text(
                            hookie,
                            style: TextStyle(
                              fontFamily: 'Dancing Script',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.fill
                                ..strokeWidth = 3
                                ..color = Colors.pink.shade200.withOpacity(0.2),
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                Colors.pink.shade400,
                                Colors.purple.shade300,
                                Colors.pink.shade300,
                              ],
                              stops: const [0.0, 0.5, 1.0],
                            ).createShader(bounds),
                            child: Text(
                              hookie,
                              style: TextStyle(
                                fontFamily: 'Dancing Script',
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.pink.shade300,
                                    blurRadius: 12,
                                    offset: const Offset(2, 2),
                                  ),
                                  Shadow(
                                    color: Colors.purple.shade300,
                                    blurRadius: 12,
                                    offset: const Offset(-2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
