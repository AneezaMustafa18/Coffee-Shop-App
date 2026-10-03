import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback? onAdd;

  const CoffeeCard({
    super.key,
    required this.coffee,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = theme.colorScheme.onSurface;

    final mutedColor = isDark
        ? Colors.white70
        : Colors.black54;

    final cardColor = isDark
        ? const Color(0xFF171D22)
        : Colors.white;

    final isFavorite = appState.isFavorite(coffee);

    final price = double.tryParse(coffee.price) ?? 0;

    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding = screenWidth >= 600 ? 15.0 : 11.0;
    final verticalPadding = screenWidth >= 600 ? 11.0 : 8.0;

    final nameSize = screenWidth >= 600 ? 17.0 : 15.5;
    final descriptionSize = screenWidth >= 600 ? 12.0 : 11.0;
    final priceSize = screenWidth >= 600 ? 17.0 : 15.5;

    final addButtonSize = screenWidth >= 600 ? 38.0 : 34.0;

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: isDark
            ? null
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =====================================================
          // COFFEE IMAGE
          // =====================================================

          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    coffee.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: isDark
                            ? const Color(0xFF2A211C)
                            : const Color(0xFFE8D5C5),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.local_cafe_rounded,
                          size: screenWidth >= 600 ? 52 : 44,
                          color: isDark
                              ? Colors.white54
                              : const Color(0xFFD4773A),
                        ),
                      );
                    },
                    loadingBuilder:
                        (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return Container(
                        color: isDark
                            ? const Color(0xFF2A211C)
                            : const Color(0xFFE8D5C5),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth >= 600 ? 26 : 22,
                          height: screenWidth >= 600 ? 26 : 22,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFFD4773A),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // =================================================
                // FAVORITE BUTTON
                // =================================================

                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<AppState>()
                          .toggleFavorite(coffee);
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.42),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavorite
                            ? const Color(0xFFD4773A)
                            : Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =====================================================
          // COFFEE DETAILS
          // =====================================================

          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                verticalPadding,
                horizontalPadding,
                7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // COFFEE NAME
                  Text(
                    coffee.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: nameSize,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 3),

                  // DESCRIPTION
                  Expanded(
                    child: Text(
                      coffee.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: descriptionSize,
                        height: 1.15,
                        color: mutedColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // PRICE + ADD BUTTON
                  SizedBox(
                    height: addButtonSize,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '\$${price.toStringAsFixed(2)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: priceSize,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFD4773A),
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        GestureDetector(
                          onTap: onAdd ??
                                  () {
                                context
                                    .read<AppState>()
                                    .addToCart(coffee);
                              },
                          child: Container(
                            width: addButtonSize,
                            height: addButtonSize,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD4773A),
                              borderRadius:
                              BorderRadius.circular(11),
                            ),
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: screenWidth >= 600 ? 22 : 20,
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