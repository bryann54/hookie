import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hookee/features/discover/presentation/widgets/radial_users_display.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/discover/presentation/widgets/central_user_widget.dart';

class RadialUsersDisplay extends StatelessWidget {
  final User centralUser;
  final List<User> users;
  final Function(User) onCentralUserChanged;
  final AnimationController animationController;

  const RadialUsersDisplay({
    super.key,
    required this.centralUser,
    required this.users,
    required this.onCentralUserChanged,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final radius = screenSize.width * 0.35;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final centerX = constraints.maxWidth / 2;
        final centerY = constraints.maxHeight / 2.5;
        
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Central user waves
              Positioned(
                left: centerX - 100,
                top: centerY - 90,
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(
                    3,
                    (index) => WaveEffect(
                      color: Colors.purple.withOpacity(0.2),
                      size: 180,
                      animationController: animationController,
                      delay: Duration(milliseconds: 500 * index),
                      waveCount: 3,
                    ),
                  ),
                ),
              ),

              // Central user
              Positioned(
                left: centerX -80,
                top: centerY - 70,
                child: CentralUserWidget(user: centralUser),
              ),

              // Peripheral users with waves
              ...List.generate(
                min(7, users.length),
                (index) {
                  final angle = (2 * pi / 7) * index;
                  final xOffset = radius * cos(angle);
                  final yOffset = radius * sin(angle);

                  return Positioned(
                    left: centerX + xOffset - 50,
                    top: centerY + yOffset -9,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        WaveEffect(
                          color: Colors.purple.withOpacity(0.15),
                          size: 100,
                          animationController: animationController,
                          delay: Duration(milliseconds: 300 * index),
                          waveCount: 2,
                        ),
                        RadialUserAvatar(
                          user: users[index],
                          onTap: () => onCentralUserChanged(users[index]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class WaveEffect extends StatelessWidget {
  final Color color;
  final double size;
  final AnimationController animationController;
  final Duration? delay;
  final int waveCount;

  const WaveEffect({
    super.key,
    required this.color,
    required this.size,
    required this.animationController,
    this.delay,
    this.waveCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    if (delay != null) {
      Future.delayed(delay!, () {
        if (animationController.status != AnimationStatus.forward &&
            animationController.status != AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return CustomPaint(
          size: Size(size, size),
          painter: WavePainter(
            animation: animationController,
            color: color,
            waveCount: waveCount,
          ),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final int waveCount;

  WavePainter({
    required this.animation,
    required this.color,
    required this.waveCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    for (int i = 0; i < waveCount; i++) {
      final progress = (animation.value + i / waveCount) % 1.0;
      final opacity = 1.0 - progress;
      
      final Paint paint = Paint()
        ..color = color.withOpacity(opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;

      final radius = maxRadius * progress;
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}