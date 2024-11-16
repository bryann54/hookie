import 'package:flutter/material.dart';
import 'package:hookee/core/constants/colors.dart';

class ProfileOptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Personal Information Card
        _SettingsCard(
          title: 'Personal Information',
          children: [
            ProfileOptionItem(
              icon: Icons.person_outline,
              title: "Edit Profile Info",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.image_outlined,
              title: "Manage Photos",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.location_on_outlined,
              title: "Location Settings",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Preferences Card
        _SettingsCard(
          title: 'Preferences',
          children: [
            ProfileOptionItem(
              icon: Icons.favorite_border,
              title: "Dating Preferences",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.visibility_outlined,
              title: "Profile Visibility",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.notifications_outlined,
              title: "Notification Settings",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Privacy & Security Card
        _SettingsCard(
          title: 'Privacy & Security',
          children: [
            ProfileOptionItem(
              icon: Icons.lock_outline,
              title: "Privacy Settings",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.block_outlined,
              title: "Blocked Users",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.security_outlined,
              title: "Account Security",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Support Card
        _SettingsCard(
          title: 'Support',
          children: [
            ProfileOptionItem(
              icon: Icons.help_outline,
              title: "Help Center",
              onTap: () {},
            ),
            _CustomDivider(),
            ProfileOptionItem(
              icon: Icons.policy_outlined,
              title: "Terms & Privacy Policy",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.backgroundDark.withOpacity(.2)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentColor.withOpacity(0.8),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

class ProfileOptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const ProfileOptionItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.accentColor,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
      onTap: onTap,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,
      vertical: 1
      ),
      child: Divider(
        color: Colors.grey[200],
        thickness: 3
      ),
    );
  }
}
