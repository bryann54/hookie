import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/presentation/widgets/action_buttons_widget.dart';
import 'package:hookee/features/home/presentation/widgets/communication_buttons_widget.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Stack(
                children: [
               Hero(
                    tag: 'userImage-${widget.user.id}',
                    child: Container(
                      height: 450,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image:
                              CachedNetworkImageProvider(widget.user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Positioned Action Buttons
             Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Hero(
                      tag: 'actionButtons',
                      child: ActionButtonsWidget(
                        isDarkMode: isDarkMode,
                        user: widget.user,
                      ),
                    ),
                  ),


          
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: Icon(
                        size: 30,
                        Icons.arrow_back_ios,
                        color: isDarkMode
                            ? AppColors.textPrimaryDark
                            : Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            // User Information Section
            SlideTransition(
              position: animationController.drive(
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: const Offset(0, 0),
                ).chain(CurveTween(curve: Curves.easeOut)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${widget.user.name}, ${widget.user.age}',
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.user.profession,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: isDarkMode
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        // Additional icon or detail section
                        // Container(
                        //   height: 40,
                        //   width: 40,
                        //   decoration: BoxDecoration(
                        //     color: isDarkMode
                        //         ? AppColors.cardColorDark
                        //         : Colors.grey.withOpacity(0.2),
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        //   child: Icon(
                        //     Icons.more_vert,
                        //     color: isDarkMode
                        //         ? AppColors.textSecondaryDark
                        //         : AppColors.textSecondary,
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  Text(
                      'About ${widget.user.name} :',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text(
                     widget.user.bio,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.4,
                      ),
                    ),
        Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Interests:',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: widget.user.hobbies.asMap().entries.map((entry) {
          final hobby = entry.value;
          final index = entry.key;
          
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 200 + (index * 100)),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Opacity(
                  opacity: value,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.cardColorDark.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDarkMode
                            ? AppColors.accentColor.withOpacity(0.3)
                            : AppColors.accentColorDark.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        if (!isDarkMode)
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          hobby.split(' ').last,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          hobby.split(' ').sublist(0, hobby.split(' ').length - 1).join(' '),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
      CommunicationButtonsWidget(user: widget.user,)
    ],
  ),
),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
