import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double start;
  final double borderRadius;
  final double end;

  const GlassMorphism({
    super.key,
    required this.child,
    required this.start,
    required this.end,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(start),
                Colors.white.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
