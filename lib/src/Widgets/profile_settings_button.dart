import 'package:flutter/material.dart';

class ProfileSettingsButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final BorderRadius radius;

  const ProfileSettingsButton({
    super.key,
    required this.icon,
    required this.text,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        onTap: () {
          // Ваш обработчик нажатия
        },
        borderRadius: radius,
        hoverColor: const Color.fromARGB(255, 29, 29, 29),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: const Color.fromARGB(255, 255, 0, 0)),
                  const SizedBox(width: 20),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Color.fromARGB(199, 255, 255, 255),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_right, color: Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }
}
