import 'package:flutter/material.dart';

class CategoriesButton extends StatefulWidget {
  const CategoriesButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _isPressed = !_isPressed;
      }),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: _isPressed
              ? Colors.white.withOpacity(0.5)
              : Colors.white.withOpacity(0.3),
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
