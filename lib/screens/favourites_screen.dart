import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/state/app_state.dart';
import 'package:bigbrains_coffeeshop_task/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final favorites = appState.favorites;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = theme.colorScheme.onSurface;

    final mutedColor = isDark
        ? Colors.white70
        : Colors.black54;

    final cardColor = isDark
        ? const Color(0xFF171D22)
        : Colors.white;

    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding =
    screenWidth >= 600 ? 28.0 : 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      // =========================================================
      // BODY
      // =========================================================

      body: favorites.isEmpty
          ? Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                size: 85,
                color: mutedColor,
              ),

              const SizedBox(height: 18),

              Text(
                'No favorites yet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Your favorite coffees will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: mutedColor,
                ),
              ),
            ],
          ),
        ),
      )
          : GridView.builder(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          10,
          horizontalPadding,
          100,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: favorites.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
          screenWidth >= 700 ? 3 : 2,
          crossAxisSpacing:
          screenWidth >= 600 ? 18 : 14,
          mainAxisSpacing:
          screenWidth >= 600 ? 20 : 16,

          // Taller cards on mobile to avoid
          // bottom overflow.
          childAspectRatio:
          screenWidth >= 700
              ? 0.78
              : 0.64,
        ),
        itemBuilder: (context, index) {
          final coffee = favorites[index];

          return _FavoriteCard(
            coffee: coffee,
            cardColor: cardColor,
            textColor: textColor,
            mutedColor: mutedColor,
            onRemove: () {
              appState.toggleFavorite(coffee);
            },
            onAddToCart: () {
              appState.addToCart(coffee);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content: Text(
                    '${coffee.name} added to cart',
                  ),
                  duration:
                  const Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),

      // =========================================================
      // BOTTOM NAVIGATION
      // =========================================================

      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}

// =================================================================
// FAVORITE CARD
// =================================================================

class _FavoriteCard extends StatelessWidget {
  final Coffee coffee;
  final Color cardColor;
  final Color textColor;
  final Color mutedColor;
  final VoidCallback onRemove;
  final VoidCallback onAddToCart;

  const _FavoriteCard({
    required this.coffee,
    required this.cardColor,
    required this.textColor,
    required this.mutedColor,
    required this.onRemove,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final price =
        double.tryParse(coffee.price) ?? 0;

    final screenWidth = MediaQuery.sizeOf(context).width;

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    final nameSize =
    screenWidth >= 600 ? 16.0 : 14.5;

    final descriptionSize =
    screenWidth >= 600 ? 12.0 : 10.5;

    final priceSize =
    screenWidth >= 600 ? 16.0 : 14.5;

    final addButtonSize =
    screenWidth >= 600 ? 38.0 : 34.0;

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          // =======================================================
          // IMAGE
          // =======================================================

          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    coffee.image,
                    fit: BoxFit.cover,

                    // ------------------------------------------------
                    // IMAGE ERROR
                    // ------------------------------------------------

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: isDark
                            ? const Color(0xFF2A211C)
                            : const Color(0xFFE8D5C5),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.local_cafe_rounded,
                          size:
                          screenWidth >= 600
                              ? 46
                              : 40,
                          color: isDark
                              ? Colors.white70
                              : const Color(
                            0xFFD4773A,
                          ),
                        ),
                      );
                    },

                    // ------------------------------------------------
                    // IMAGE LOADING
                    // ------------------------------------------------

                    loadingBuilder:
                        (
                        context,
                        child,
                        loadingProgress,
                        ) {
                      if (loadingProgress ==
                          null) {
                        return child;
                      }

                      return Container(
                        color: isDark
                            ? const Color(0xFF2A211C)
                            : const Color(0xFFE8D5C5),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child:
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            color:
                            const Color(
                              0xFFD4773A,
                            ),
                            value:
                            loadingProgress
                                .expectedTotalBytes !=
                                null
                                ? loadingProgress
                                .cumulativeBytesLoaded /
                                loadingProgress
                                    .expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ===================================================
                // FAVORITE BUTTON
                // ===================================================

                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.45),
                        shape: BoxShape.circle,
                      ),
                      alignment:
                      Alignment.center,
                      child: const Icon(
                        Icons.favorite_rounded,
                        color:
                        Color(0xFFD4773A),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =======================================================
          // CONTENT
          // =======================================================

          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth >= 600 ? 13 : 11,
                screenWidth >= 600 ? 9 : 7,
                screenWidth >= 600 ? 11 : 9,
                6,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // ------------------------------------------------
                  // NAME
                  // ------------------------------------------------

                  SizedBox(
                    height: screenWidth >= 600
                        ? 20
                        : 18,
                    child: Text(
                      coffee.name,
                      maxLines: 1,
                      overflow:
                      TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: nameSize,
                        fontWeight:
                        FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 3),

                  // ------------------------------------------------
                  // DESCRIPTION
                  // ------------------------------------------------

                  Expanded(
                    child: Align(
                      alignment:
                      Alignment.topLeft,
                      child: Text(
                        coffee.description,
                        maxLines: 2,
                        overflow:
                        TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize:
                          descriptionSize,
                          height: 1.15,
                          color: mutedColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 3),

                  // ------------------------------------------------
                  // PRICE + ADD BUTTON
                  // ------------------------------------------------

                  SizedBox(
                    height: addButtonSize,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '\$${price.toStringAsFixed(2)}',
                            maxLines: 1,
                            overflow:
                            TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: priceSize,
                              fontWeight:
                              FontWeight.w800,
                              color:
                              const Color(
                                0xFFD4773A,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        GestureDetector(
                          onTap: onAddToCart,
                          child: Container(
                            width:
                            addButtonSize,
                            height:
                            addButtonSize,
                            decoration:
                            BoxDecoration(
                              color:
                              const Color(
                                0xFFD4773A,
                              ),
                              borderRadius:
                              BorderRadius
                                  .circular(
                                10,
                              ),
                            ),
                            alignment:
                            Alignment.center,
                            child: Icon(
                              Icons.add_rounded,
                              color:
                              Colors.white,
                              size:
                              screenWidth >=
                                  600
                                  ? 21
                                  : 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}