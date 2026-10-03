import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const HeaderIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? const Color(0xFF171D22)
              : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                isDark ? 0.15 : 0.06,
              ),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 19,
          color: const Color(0xFFD4773A),
        ),
      ),
    );
  }
}