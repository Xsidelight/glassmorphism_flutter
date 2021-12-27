import 'package:flutter/material.dart';

import 'glass.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      start: .3,
      end: .3,
      borderRadius: 20,
      child: child,
    );
  }
}
