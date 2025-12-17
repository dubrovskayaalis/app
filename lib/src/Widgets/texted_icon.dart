import 'package:flutter/material.dart';

class TextedIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final void Function() onPressed;

  const TextedIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}