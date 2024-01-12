import 'package:flutter/material.dart';

import 'glass.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      start: .4,
      end: .4,
      borderRadius: 20,
      child: child,
    );
  }
}
