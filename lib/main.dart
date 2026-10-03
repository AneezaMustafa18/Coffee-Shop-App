import 'package:bigbrains_coffeeshop_task/state/app_state.dart';
import 'package:bigbrains_coffeeshop_task/screens/auth/login_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/auth/signup_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/favourites_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/homescreen.dart';
import 'package:bigbrains_coffeeshop_task/screens/onboarding/onboarding_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/onboarding/splash_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/orders_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/profile_screen.dart';
import 'package:bigbrains_coffeeshop_task/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  final AppState appState = AppState();

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  void dispose() {
    appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>.value(
      value: appState,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Shop',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        initialRoute: '/splash',
        routes: {
          '/': (context) => Homescreen(
            onToggleTheme: toggleTheme,
          ),

          '/splash': (context) =>
          const SplashScreen(),

          '/onboarding': (context) =>
          const OnboardingScreen(),

          '/login': (context) => LoginScreen(
            appState: appState,
            onToggleTheme: toggleTheme,
          ),

          '/signup': (context) => SignupScreen(
            appState: appState,
            onToggleTheme: toggleTheme,
          ),

          '/favorites': (context) =>
          const FavoritesScreen(),

          '/orders': (context) =>
          const OrdersScreen(),

          '/profile': (context) =>
          const ProfileScreen(),
        },
      ),
    );
  }
}