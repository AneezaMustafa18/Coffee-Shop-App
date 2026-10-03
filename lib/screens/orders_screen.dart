import 'package:bigbrains_coffeeshop_task/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =========================================================
      // APP BAR
      // =========================================================

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/favorites',
            );
          },
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor:
        Colors.transparent,
        elevation: 0,
      ),

      // =========================================================
      // BODY
      // =========================================================

      body: Center(
        child: Icon(
          Icons.shopping_bag_rounded,
          size: 80,
          color: const Color(0xFFD4773A),
        ),
      ),

      // =========================================================
      // BOTTOM NAVIGATION
      // =========================================================

      bottomNavigationBar:
      const BottomNavBar(
        selectedIndex: 2,
      ),
    );
  }
}