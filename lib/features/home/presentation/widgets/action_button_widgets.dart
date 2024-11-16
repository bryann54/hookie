import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onTap;
  final bool changeColorOnTap;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
    this.changeColorOnTap = true, // Default: enable color change
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.changeColorOnTap) {
          setState(() {
            _isPressed = !_isPressed;
          });
        }
        widget.onTap(); // Trigger the provided onTap callback
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _isPressed && widget.changeColorOnTap
              ? widget.iconColor.withOpacity(0.2)
              : widget.bgColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: widget.bgColor.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: 30,
        ),
      ),
    );
  }
}
