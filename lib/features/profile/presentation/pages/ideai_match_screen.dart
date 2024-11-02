import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';

class IdealMatchScreen extends StatefulWidget {
  const IdealMatchScreen({super.key});

  @override
  State<IdealMatchScreen> createState() => _IdealMatchScreenState();
}

class _IdealMatchScreenState extends State<IdealMatchScreen> {
  int? selectedIndex;

  final List<Map<String, dynamic>> matchOptions = [
    {
      'title': 'Love',
      'subtitle': 'You\'re not here to play around',
      'icon': Icons.favorite,
      'color': Colors.pinkAccent,
    },
    {
      'title': 'Friends',
      'subtitle': 'I want to meet new people',
      'icon': Icons.people,
      'color': Colors.pinkAccent,
    },
    {
      'title': 'Business',
      'subtitle': 'Meet business oriented people',
      'icon': Icons.business_center,
      'color': Colors.pinkAccent,
    },
  ];

  void _handleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
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
                  'Ideal match',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'What are you expecting to find here?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 32),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: matchOptions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final option = matchOptions[index];
                    final isSelected = selectedIndex == index;

                    return InkWell(
                      onTap: () => _handleSelection(index),
                      borderRadius: BorderRadius.circular(12),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(12),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 80,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.pink.shade50
                                : Colors.white70,
                            borderRadius: BorderRadius.circular(12),
                            border: isSelected
                                ? Border.all(
                                    color: Colors.pinkAccent,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.pinkAccent
                                    : option['color'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                option['icon'],
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            title: Text(
                              option['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              option['subtitle'],
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: selectedIndex != null ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
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
                          color: Colors.white,
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
