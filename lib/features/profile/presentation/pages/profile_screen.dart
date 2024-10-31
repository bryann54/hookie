

import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widger.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundWidget(
      child: SafeArea(
          child: Column(
        children: [
          const Center(child: Text('profile Screen')),
        ],
      )),
    );
  }
}
