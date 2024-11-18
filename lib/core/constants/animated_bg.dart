import 'package:flutter/material.dart';
import 'package:hookee/core/constants/colors.dart';

class AnimatedBackground extends StatelessWidget {
  final AnimationController controller;

  const AnimatedBackground({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: -50 + (70 * controller.value),
              right: -50,
              child: _buildCircle(
                width: 150,
                height: 150,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              bottom: -50 - (-50 * controller.value),
              left: -120,
              child: _buildCircle(
                width: 300,
                height: 200,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCircle({
    required double width,
    required double height,
    required Color color,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
