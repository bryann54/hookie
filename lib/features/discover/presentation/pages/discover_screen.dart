import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widger.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: SafeArea(
            child: Column(
          children: [
            const Center(child: Text('discover Screen')),
          ],
        )),
      ),
    );
  }
}
