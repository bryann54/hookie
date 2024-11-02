import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final Set<String> selectedInterests = {};

  final List<InterestItem> interests = [
    InterestItem(icon: Icons.local_dining, label: 'Dining'),
    InterestItem(icon: Icons.movie, label: 'Movies'),
    InterestItem(icon: Icons.music_note, label: 'Music'),
    InterestItem(icon: Icons.sports_basketball, label: 'Sports'),
    InterestItem(icon: Icons.pets, label: 'Pets'),
    InterestItem(icon: Icons.flight, label: 'Travel'),
    InterestItem(icon: Icons.fitness_center, label: 'Fitness'),
    InterestItem(icon: Icons.brush, label: 'Art'),
    InterestItem(icon: Icons.camera_alt, label: 'Photography'),
    InterestItem(icon: Icons.book, label: 'Reading'),
    InterestItem(icon: Icons.restaurant, label: 'Cooking'),
    InterestItem(icon: Icons.nature_people, label: 'Outdoors'),
    InterestItem(icon: Icons.nightlife, label: 'Nightlife'),
    InterestItem(icon: Icons.coffee, label: 'Coffee'),
    InterestItem(icon: Icons.wine_bar, label: 'Wine'),
    InterestItem(icon: Icons.spa, label: 'Wellness'),
    InterestItem(icon: Icons.theater_comedy, label: 'Comedy'),
    InterestItem(icon: Icons.psychology, label: 'Deep Talks'),
  ];

  Widget _buildInterestTag(InterestItem interest) {
    final bool isSelected = selectedInterests.contains(interest.label);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (isSelected) {
              selectedInterests.remove(interest.label);
            } else {
              if (selectedInterests.length < 5) {
                selectedInterests.add(interest.label);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You can select up to 5 interests'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.pinkAccent : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
            color:
                isSelected ? Colors.pink.withOpacity(0.1) : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                interest.icon,
                color: isSelected ? Colors.pinkAccent : Colors.grey.shade600,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                interest.label,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.pinkAccent : Colors.grey.shade600,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleContinue() {
    if (selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one interest'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Handle navigation or data saving
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected interests: ${selectedInterests.join(", ")}'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                const Text(
                  'Select Your Interests',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Select up to 5 interests to match with people who share your passions',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Selected: ${selectedInterests.length}/5',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 0,
                      children: interests.map(_buildInterestTag).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed:
                          selectedInterests.isNotEmpty ? _handleContinue : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedInterests.isNotEmpty
                            ? Colors.pinkAccent
                            : Colors.grey.shade300,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: selectedInterests.isNotEmpty
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InterestItem {
  final IconData icon;
  final String label;

  InterestItem({required this.icon, required this.label});
}
