import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundWidget(
      child: SafeArea(
          child: Column(
        children: [
          const Center(child: Text('favorite Screen')),
        ],
      )),
    );
  }
}
