import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/core/theme/theme_toggle_switch.dart';
import 'package:hookee/features/profile/presentation/widgets/logout_button_widget.dart';
import 'package:hookee/features/profile/presentation/widgets/option_widget.dart';
import 'package:hookee/features/profile/presentation/widgets/static_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.accentColor.withOpacity(0.2),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: AppColors.accentColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'john.doe@example.com',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Theme Toggle
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundDark.withOpacity(.1),
                    border: Border.all(
                        color: AppColors.accentColor.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.dark_mode,
                              color: AppColors.accentColor,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        ThemeToggle(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Statistics Section
                Text(
                  'Your Activity',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                const ProfileStatisticsSection(),
                const SizedBox(height: 24),

                // Options Section
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                const ProfileOptionsSection(),
                const SizedBox(height: 24),

                // Logout Button
                const LogOutButton(),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
