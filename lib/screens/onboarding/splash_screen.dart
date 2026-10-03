import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // 3 seconds ke baad next screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        '/onboarding',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF0F1418) : const Color(0xFFF8F5F2),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // COFFEE ICON
            Container(
              width: 100,
              height: 100,

              decoration: BoxDecoration(
                color: const Color(0xFFD4773A),
                borderRadius: BorderRadius.circular(30),
              ),

              child: const Icon(
                Icons.coffee_rounded,
                color: Colors.white,
                size: 55,
              ),
            ),

            const SizedBox(height: 25),

            // APP NAME
            Text(
              'Coffee Shop',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            // TAGLINE
            Text(
              'Your perfect coffee, every time.',
              style: TextStyle(
                color: isDark
                    ? Colors.white54
                    : Colors.black54,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}