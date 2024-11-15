import 'package:flutter/material.dart';
import 'package:hookee/features/home/data/models/user_model.dart';

class CommunicationButtonsWidget extends StatelessWidget {
  final User user;
  const CommunicationButtonsWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: theme.colorScheme.primary,
              ),
              onPressed: () {
                // Add your text action logic here
              },
              child: Text(
                'Text ${user.name}',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: theme.colorScheme.secondary,
              ),
              onPressed: () {
                // Add your call action logic here
              },
              child: Text(
                'Call ${user.name}',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
