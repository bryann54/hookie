import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/core/theme/theme_toggle_switch.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundWidget(
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                    children: [
                     Material(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark.withOpacity(.1),
                  border:
                      Border.all(color: AppColors.backgroundDark.withOpacity(.2)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Toggle Dark Mode:',
                        style: TextStyle(fontSize: 18),
                      ),
                      ThemeToggle(),
                    ],
                  ),
                ),
              ),
            ),
                    ],
                  ),
          )),
    );
  }
}
