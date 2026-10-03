import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/screens/cart_screen.dart';
import 'package:bigbrains_coffeeshop_task/screens/special_offer_screen.dart';
import 'package:bigbrains_coffeeshop_task/state/app_state.dart';
import 'package:bigbrains_coffeeshop_task/widgets/bottom_nav_bar.dart';
import 'package:bigbrains_coffeeshop_task/widgets/category_item.dart';
import 'package:bigbrains_coffeeshop_task/widgets/coffee_card.dart';
import 'package:bigbrains_coffeeshop_task/widgets/header_icon.dart';
import 'package:bigbrains_coffeeshop_task/widgets/special_offer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const Homescreen({
    super.key,
    required this.onToggleTheme,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedCategory = 0;

  final categories = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White',
  ];

  List<Coffee> get selectedCoffeeList {
    switch (selectedCategory) {
      case 0:
        return cappuccinoCoffees;
      case 1:
        return espressoCoffees;
      case 2:
        return latteCoffees;
      case 3:
        return flatWhiteCoffees;
      default:
        return cappuccinoCoffees;
    }
  }

  void selectCategory(int index) {
    setState(() {
      selectedCategory = index;
    });
  }

  void addToCart(Coffee coffee) {
    context.read<AppState>().addToCart(coffee);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${coffee.name} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = theme.colorScheme.onSurface;

    final mutedColor = isDark
        ? Colors.white70
        : Colors.black54;

    final screenWidth = MediaQuery.sizeOf(context).width;

    // ===========================================================
    // RESPONSIVE VALUES
    // ===========================================================

    final horizontalPadding =
    screenWidth >= 600 ? 28.0 : 20.0;

    final titleSize =
    screenWidth >= 600 ? 32.0 : 28.0;

    return Scaffold(
      // =========================================================
      // DRAWER
      // =========================================================

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Icon(
                Icons.local_cafe_rounded,
                size: 55,
                color: Color(0xFFD4773A),
              ),

              const SizedBox(height: 12),

              Text(
                'Coffee Shop',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 30),

              ...List.generate(
                categories.length,
                    (index) {
                  final isSelected =
                      selectedCategory == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    child: Material(
                      color: isSelected
                          ? (isDark
                          ? const Color(0xFF171D22)
                          : const Color(0xFFF4E8DF))
                          : Colors.transparent,
                      borderRadius:
                      BorderRadius.circular(22),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        contentPadding:
                        const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 7,
                        ),
                        leading: const Icon(
                          Icons.coffee_rounded,
                          color: Color(0xFFD4773A),
                        ),
                        title: Text(
                          categories[index],
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                        selected: isSelected,
                        selectedTileColor:
                        Colors.transparent,
                        onTap: () {
                          selectCategory(index);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // =========================================================
      // BODY
      // =========================================================

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ===================================================
            // HEADER
            // ===================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  16,
                  horizontalPadding,
                  0,
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) {
                        return HeaderIcon(
                          icon: Icons.grid_view_rounded,
                          onTap: () {
                            Scaffold.of(context)
                                .openDrawer();
                          },
                        );
                      },
                    ),

                    const Spacer(),

                    // =================================================
                    // CART
                    // =================================================

                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        HeaderIcon(
                          icon:
                          Icons.shopping_cart,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const CartScreen(),
                              ),
                            );
                          },
                        ),

                        if (appState.cartCount > 0)
                          Positioned(
                            right: -3,
                            top: -3,
                            child: Container(
                              constraints:
                              const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              padding:
                              const EdgeInsets.all(4),
                              alignment:
                              Alignment.center,
                              decoration:
                              const BoxDecoration(
                                color:
                                Color(0xFFD4773A),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${appState.cartCount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(width: 10),

                    // =================================================
                    // THEME
                    // =================================================

                    HeaderIcon(
                      icon: isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      onTap: widget.onToggleTheme,
                    ),
                  ],
                ),
              ),
            ),

            // ===================================================
            // GREETING
            // ===================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  28,
                  horizontalPadding,
                  0,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find the best coffee',
                      maxLines: 1,
                      overflow:
                      TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight:
                        FontWeight.w800,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'for your perfect moment',
                      style: TextStyle(
                        fontSize:
                        screenWidth >= 600
                            ? 17
                            : 16,
                        color: mutedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ===================================================
            // SEARCH
            // ===================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  22,
                  horizontalPadding,
                  0,
                ),
                child: SizedBox(
                  height: 54,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search coffee...',
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                      ),
                      filled: true,
                      fillColor: isDark
                          ? const Color(0xFF171D22)
                          : Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(18),
                        borderSide:
                        BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ===================================================
            // CATEGORIES
            // ===================================================

            SliverToBoxAdapter(
              child: SizedBox(
                height: 65,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    20,
                    horizontalPadding,
                    0,
                  ),
                  scrollDirection:
                  Axis.horizontal,
                  physics:
                  const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: 10),
                  itemBuilder:
                      (context, index) {
                    return CategoryItem(
                      title: categories[index],
                      selected:
                      selectedCategory == index,
                      onTap: () {
                        selectCategory(index);
                      },
                    );
                  },
                ),
              ),
            ),

            // ===================================================
            // COFFEE GRID
            // ===================================================

            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                20,
                horizontalPadding,
                0,
              ),
              sliver: SliverGrid(
                delegate:
                SliverChildBuilderDelegate(
                      (context, index) {
                    final coffee =
                    selectedCoffeeList[index];

                    return CoffeeCard(
                      coffee: coffee,
                      onAdd: () {
                        addToCart(coffee);
                      },
                    );
                  },
                  childCount:
                  selectedCoffeeList.length,
                ),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                  screenWidth >= 700
                      ? 3
                      : 2,
                  crossAxisSpacing:
                  screenWidth >= 600
                      ? 18
                      : 14,
                  mainAxisSpacing:
                  screenWidth >= 600
                      ? 22
                      : 18,
                  childAspectRatio:
                  screenWidth >= 600
                      ? 0.78
                      : 0.68,
                ),
              ),
            ),

            // ===================================================
            // SPECIAL OFFER
            // ===================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  24,
                  horizontalPadding,
                  20,
                ),
                child: SpecialOfferCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                        const SpecialOfferScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
          ],
        ),
      ),

      // =========================================================
      // BOTTOM NAVIGATION
      // =========================================================

      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}