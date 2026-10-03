import 'package:flutter/material.dart';
import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/widgets/coffee_card.dart';

class FlatWhiteScreen extends StatelessWidget {
  const FlatWhiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flat White'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: flatWhiteCoffees.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 14,
            childAspectRatio: .70,
          ),
          itemBuilder: (context, index) {
            return CoffeeCard(
              coffee: flatWhiteCoffees[index],
            );
          },
        ),
      ),
    );
  }
}