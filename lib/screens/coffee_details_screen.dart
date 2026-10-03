
import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/state/app_state.dart' show AppState;
import 'package:flutter/material.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final Coffee coffee;
  final AppState? appState;

  const CoffeeDetailScreen({
    super.key,
    required this.coffee,
    this.appState,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark =
        theme.brightness == Brightness.dark;

    final textColor =
        theme.colorScheme.onSurface;

    final mutedColor = isDark
        ? Colors.white60
        : Colors.black54;

    final isFavorite =
        appState?.isFavorite(coffee) ?? false;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // TOP BAR
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                12,
                18,
                10,
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  _CircleButton(
                    icon:
                    Icons.arrow_back_rounded,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  Text(
                    'Coffee Details',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  _CircleButton(
                    icon: isFavorite
                        ? Icons.favorite_rounded
                        : Icons
                        .favorite_border_rounded,
                    iconColor: isFavorite
                        ? const Color(0xFFD4773A)
                        : null,
                    onTap: appState == null
                        ? () {}
                        : () {
                      appState!
                          .toggleFavorite(
                        coffee,
                      );
                    },
                  ),
                ],
              ),
            ),

            // CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  8,
                  18,
                  25,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(24),
                      child: AspectRatio(
                        aspectRatio: 1.15,
                        child: Image.network(
                          coffee.image,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) {
                            return Container(
                              color:
                              Colors.brown.shade300,
                              child: const Center(
                                child: Icon(
                                  Icons
                                      .coffee_rounded,
                                  size: 70,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // TITLE + RATING
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              Text(
                                coffee.name,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 27,
                                  fontWeight:
                                  FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                coffee.description,
                                style: TextStyle(
                                  color: mutedColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding:
                          const EdgeInsets
                              .symmetric(
                            horizontal: 11,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(
                              0xFF242A2F,
                            )
                                : const Color(
                              0xFFF4F1EF,
                            ),
                            borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color:
                                Color(0xFFFFC107),
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // INFORMATION
                    Text(
                      'About this coffee',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Enjoy a delicious ${coffee.name} '
                          'prepared with carefully selected '
                          'ingredients. This coffee is '
                          '${coffee.description.toLowerCase()} '
                          'and made to give you a rich and '
                          'satisfying coffee experience.',
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // FEATURES
                    Row(
                      children: [
                        Expanded(
                          child: DetailInfoRow(
                            icon:
                            Icons.coffee_rounded,
                            title: 'Coffee',
                            value: coffee.name,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: DetailInfoRow(
                            icon: Icons
                                .water_drop_rounded,
                            title: 'Type',
                            value: coffee.description
                                .replaceFirst(
                              'With ',
                              '',
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // SIZE
                    Text(
                      'Choose your size',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        _SizeOption(
                          title: 'Small',
                          selected: false,
                        ),
                        const SizedBox(width: 10),
                        _SizeOption(
                          title: 'Medium',
                          selected: true,
                        ),
                        const SizedBox(width: 10),
                        _SizeOption(
                          title: 'Large',
                          selected: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // PRICE + BUTTON
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: mutedColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '\$${coffee.price}',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 24,
                                fontWeight:
                                FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: CustomButton(
                            title: 'Add to Cart',
                            onTap: appState == null
                                ? () {}
                                : () {
                              appState!
                                  .addToCart(
                                coffee,
                              );

                              ScaffoldMessenger
                                  .of(
                                context,
                              )
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${coffee.name} added to cart',
                                  ),
                                  duration:
                                  const Duration(
                                    seconds: 1,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// REUSABLE CIRCLE BUTTON
// --------------------------------------------------

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  const _CircleButton({
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius:
      BorderRadius.circular(14),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF171D22)
              : Colors.white,
          borderRadius:
          BorderRadius.circular(14),
        ),
        child: Icon(
          icon,
          color: iconColor ??
              Theme.of(context)
                  .colorScheme
                  .onSurface,
          size: 21,
        ),
      ),
    );
  }
}

// --------------------------------------------------
// REUSABLE DETAIL INFO
// --------------------------------------------------

class DetailInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    final textColor =
        Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF171D22)
            : Colors.white,
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFD4773A),
            size: 22,
          ),

          const SizedBox(height: 9),

          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// REUSABLE SIZE OPTION
// --------------------------------------------------

class _SizeOption extends StatelessWidget {
  final String title;
  final bool selected;

  const _SizeOption({
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
        const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFD4773A)
              : Colors.transparent,
          borderRadius:
          BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? const Color(0xFFD4773A)
                : Colors.grey.withOpacity(.3),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Theme.of(context)
                  .colorScheme
                  .onSurface,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// REUSABLE CUSTOM BUTTON
// --------------------------------------------------

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          const Color(0xFFD4773A),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(16),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}