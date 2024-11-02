import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/home/presentation/widgets/action_button_widgets.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Stack(
                children: [
                  Hero(
                    tag: 'userImage',
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: const DecorationImage(
                          image: AssetImage('assets/model.webp'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Action buttons positioned directly on the image
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Hero(
                      tag: 'actionButtons',
                      child: Material(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionButton(
                              icon: Icons.close,
                              iconColor: Colors.red,
                              bgColor: Colors.white,
                            ),
                            SizedBox(width: 12),
                            ActionButton(
                              icon: Icons.favorite,
                              iconColor: Colors.pink,
                              bgColor: Colors.white,
                            ),
                            SizedBox(width: 12),
                            ActionButton(
                              icon: Icons.star,
                              iconColor: Colors.amber,
                              bgColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Back button
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
