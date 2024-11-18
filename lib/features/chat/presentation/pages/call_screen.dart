import 'package:flutter/material.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CallScreen extends StatelessWidget {
  final User user;
  const CallScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // User image as background
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: user.imageUrl, // Use the user's image URL
              fit: BoxFit.cover, // Ensure the image covers the screen
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          // Gradient overlay for better contrast between text and image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.6)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Content on top of the image (User details and Call UI)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: CachedNetworkImageProvider(user.imageUrl),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name, // Display user's name
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user.profession, // Display user's profession
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Calling...", // Indicating the call is in progress
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const Spacer(),
                // Call action buttons (Mute, Speaker, End Call)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CallActionButton(
                      icon: Icons.mic_off,
                      onPressed: () {
                        // Mute action
                      },
                    ),
                    const SizedBox(width: 40),
                    _CallActionButton(
                      icon: Icons.call_end,
                      color: Colors.red,
                      onPressed: () {
                        // End call action
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 40),
                    _CallActionButton(
                      icon: Icons.volume_up,
                      onPressed: () {
                        // Speaker action
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _CallActionButton({
    required this.icon,
    required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color),
      iconSize: 40,
      onPressed: onPressed,
    );
  }
}
