import 'package:flutter/material.dart';
import 'package:hookee/core/constants/bg_widget.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  // Gender selection widget
  Widget _buildGenderCard({
    required String gender,
    required IconData icon,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.pinkAccent : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
            color:
                isSelected ? Colors.pink.withOpacity(0.05) : Colors.transparent,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 70,
                  color: isSelected ? Colors.pinkAccent : Colors.black,
                ),
                const SizedBox(height: 8),
                Text(
                  gender,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color:
                        isSelected ? Colors.pinkAccent : Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleContinue() {
    if (selectedGender != null) {
      // Handle navigation or data saving
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected gender: $selectedGender'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      // Show error if no gender is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your gender'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
                  'Select Gender',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please select your gender',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
                const Spacer(flex: 1),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGenderCard(
                      gender: 'Male',
                      icon: Icons.male,
                      isSelected: selectedGender == 'Male',
                      onTap: () => setState(() => selectedGender = 'Male'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGenderCard(
                      gender: 'Female',
                      icon: Icons.female,
                      isSelected: selectedGender == 'Female',
                      onTap: () => setState(() => selectedGender = 'Female'),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _handleContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender != null
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
                          color: selectedGender != null
                              ? Colors.white
                              : Colors.grey.shade700,
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
