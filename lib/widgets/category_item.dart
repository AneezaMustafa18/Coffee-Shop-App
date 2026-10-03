import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFD4773A)
              : isDark
              ? const Color(0xFF171D22)
              : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected
                ? const Color(0xFFD4773A)
                : isDark
                ? Colors.white.withOpacity(0.05)
                : Colors.black.withOpacity(0.04),
          ),
          boxShadow: selected
              ? [
            BoxShadow(
              color: const Color(0xFFD4773A).withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected
                ? Colors.white
                : isDark
                ? Colors.white70
                : Colors.black54,
            fontSize: 14,
            fontWeight: selected
                ? FontWeight.w700
                : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}