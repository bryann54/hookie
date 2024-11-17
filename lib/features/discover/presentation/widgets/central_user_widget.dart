import 'package:flutter/material.dart';
import 'package:hookee/features/home/data/models/user_model.dart';

class CentralUserWidget extends StatelessWidget {
  final User user;

  const CentralUserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            user.name,
            style: theme.textTheme.displaySmall?.copyWith(height: 0.5),
          ),
          Text(
            '${user.age} years',
            style: theme.textTheme.bodyMedium?.copyWith(height: 2.6),
          ),
        ],
      ),
    );
  }
}
