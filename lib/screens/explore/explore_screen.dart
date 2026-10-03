import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/screens/coffee_details_screen.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    Color textColor =
        Theme.of(context).colorScheme.onSurface;

    Color mutedColor =
    isDark ? Colors.white54 : Colors.black54;

    return Scaffold(

      // DRAWER
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [

              // DRAWER HEADER
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFFD4773A),
                ),
                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.coffee_rounded,
                      color: Colors.white,
                      size: 40,
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Coffee Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 3),

                    Text(
                      'Explore your favorite coffee',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // HOME
              ListTile(
                leading: const Icon(
                  Icons.home_rounded,
                  color: Color(0xFFD4773A),
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),

              // FAVORITES
              ListTile(
                leading: const Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFFD4773A),
                ),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    '/favorites',
                  );
                },
              ),

              // ORDERS
              ListTile(
                leading: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Color(0xFFD4773A),
                ),
                title: const Text('Orders'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    '/orders',
                  );
                },
              ),

              // PROFILE
              ListTile(
                leading: const Icon(
                  Icons.person_rounded,
                  color: Color(0xFFD4773A),
                ),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    '/profile',
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // APP BAR
      appBar: AppBar(
        title: const Text(
          'Explore Coffee',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            // HEADING
            Text(
              'What would you like?',
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Explore our coffee collection',
              style: TextStyle(
                color: mutedColor,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 22),

            // CATEGORIES
            Row(
              children: [
                _CategoryBox(
                  icon: Icons.coffee_rounded,
                  title: 'Hot Coffee',
                ),

                const SizedBox(width: 12),

                _CategoryBox(
                  icon: Icons.local_cafe_rounded,
                  title: 'Cold Coffee',
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _CategoryBox(
                  icon:
                  Icons.emoji_food_beverage_rounded,
                  title: 'Latte',
                ),

                const SizedBox(width: 12),

                _CategoryBox(
                  icon: Icons.favorite_rounded,
                  title: 'Favorites',
                ),
              ],
            ),

            const SizedBox(height: 30),

            // POPULAR COFFEE
            Text(
              'Popular Coffee',
              style: TextStyle(
                color: textColor,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 15),

            // COFFEE LIST
            Column(
              children: coffees.map((coffee) {
                return _CoffeeItem(
                  coffee: coffee,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


// CATEGORY BOX
class _CategoryBox extends StatelessWidget {
  final IconData icon;
  final String title;

  const _CategoryBox({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    Color textColor =
        Theme.of(context).colorScheme.onSurface;

    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF171D22)
              : Colors.white,
          borderRadius:
          BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            Icon(
              icon,
              color: const Color(0xFFD4773A),
              size: 28,
            ),

            const Spacer(),

            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// COFFEE ITEM
class _CoffeeItem extends StatelessWidget {
  final Coffee coffee;

  const _CoffeeItem({
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    Color textColor =
        Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CoffeeDetailScreen(
                  coffee: coffee,
                ),
          ),
        );
      },

      child: Container(
        margin:
        const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF171D22)
              : Colors.white,
          borderRadius:
          BorderRadius.circular(16),
        ),

        child: Row(
          children: [

            // IMAGE
            ClipRRect(
              borderRadius:
              BorderRadius.circular(12),
              child: Image.network(
                coffee.image,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            // INFORMATION
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    coffee.name,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight:
                      FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    coffee.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '\$${coffee.price}',
                    style: const TextStyle(
                      color: Color(0xFFD4773A),
                      fontSize: 15,
                      fontWeight:
                      FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            // ARROW
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Color(0xFFD4773A),
            ),
          ],
        ),
      ),
    );
  }
}