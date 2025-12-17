import 'package:flutter/material.dart';

class RotationAnimationIcon extends StatefulWidget {
  final double size;
  final Color color;
  final Duration cycleDuration;

  const RotationAnimationIcon({
    super.key,
    this.size = 150,
    this.color = const Color.fromARGB(255, 255, 0, 0),
    this.cycleDuration = const Duration(seconds: 3),
  });

  @override
  State<StatefulWidget> createState() => _RotationAnimationIconState();
}

class _RotationAnimationIconState extends State<RotationAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.cycleDuration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        
        final phase = t * 4;
        
        double angle;
        if (phase < 1) {
          angle = 3.14159 * Curves.easeInOut.transform(phase);
        } else if (phase < 2) {
          angle = 3.14159;
        } else if (phase < 3) {
          angle = 3.14159 + 3.14159 * Curves.easeInOut.transform(phase - 2);
        } else {
          angle = 6.28318;
        }
        
        double jumpHeight = 0;
        if (phase > 1 && phase < 2) {
          final jumpT = (phase - 1) * 2; 
          if (jumpT < 1) {
            jumpHeight = -20 * Curves.easeOut.transform(jumpT);
          } else {
            jumpHeight = -20 * Curves.easeIn.transform(2 - jumpT);
          }
        } else if (phase > 3) {
          final jumpT = (phase - 3) * 2;
          if (jumpT < 1) {
            jumpHeight = -20 * Curves.easeOut.transform(jumpT);
          } else {
            jumpHeight = -20 * Curves.easeIn.transform(2 - jumpT);
          }
        }
        
        double scale = 1.0;
        if ((phase > 1 && phase < 2) || (phase > 3)) {
          scale = 1.0 + 0.1 * (1 - (2 * (phase % 1) - 1).abs());
        }
        
        return Transform.translate(
          offset: Offset(0, jumpHeight),
          child: Transform.rotate(
            angle: angle,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
        );
      },
      child: Icon(
        Icons.sports_esports,
        size: widget.size,
        color: widget.color,
        shadows: [
          Shadow(
            color: widget.color.withAlpha(200),
            blurRadius: 50,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }
}