import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:bigbrains_coffeeshop_task/screens/orders/payment_screen.dart'
    show PaymentScreen;
import 'package:bigbrains_coffeeshop_task/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final cartItems = appState.cartItems;

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

    final uniqueCoffees = <Coffee>[];

    for (final coffee in cartItems) {
      final alreadyExists = uniqueCoffees.any(
            (item) =>
        item.name == coffee.name &&
            item.description == coffee.description,
      );

      if (!alreadyExists) {
        uniqueCoffees.add(coffee);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 90,
                color: mutedColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Your cart is empty',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add some delicious coffee to continue.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: mutedColor,
                ),
              ),
            ],
          ),
        ),
      )
          : ListView(
        padding: EdgeInsets.fromLTRB(
          screenWidth >= 600 ? 28 : 16,
          16,
          screenWidth >= 600 ? 28 : 16,
          160,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          ...uniqueCoffees.map(
                (coffee) {
              final quantity = appState.getQuantity(coffee);

              final price =
                  double.tryParse(coffee.price) ?? 0;

              return Container(
                margin: const EdgeInsets.only(
                  bottom: 14,
                ),
                padding: EdgeInsets.all(
                  screenWidth >= 600 ? 16 : 12,
                ),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    // ===============================
                    // IMAGE
                    // ===============================
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(16),
                      child: SizedBox(
                        width:
                        screenWidth >= 600 ? 100 : 76,
                        height:
                        screenWidth >= 600 ? 100 : 76,
                        child: Image.network(
                          coffee.image,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) {
                            return Container(
                              color: isDark
                                  ? const Color(0xFF2A211C)
                                  : const Color(0xFFE8D5C5),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.local_cafe_rounded,
                                size: screenWidth >= 600
                                    ? 40
                                    : 34,
                                color: isDark
                                    ? Colors.white70
                                    : const Color(
                                  0xFFD4773A,
                                ),
                              ),
                            );
                          },
                          loadingBuilder:
                              (
                              context,
                              child,
                              loadingProgress,
                              ) {
                            if (loadingProgress == null) {
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
                                  color: const Color(
                                    0xFFD4773A,
                                  ),
                                  value: loadingProgress
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
                    ),

                    SizedBox(
                      width: screenWidth >= 600 ? 16 : 10,
                    ),

                    // ===============================
                    // INFO
                    // ===============================
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee.name,
                            maxLines: 1,
                            overflow:
                            TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth >= 600
                                  ? 17
                                  : 15,
                              fontWeight:
                              FontWeight.w700,
                              color: textColor,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            coffee.description,
                            maxLines: 2,
                            overflow:
                            TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth >= 600
                                  ? 12
                                  : 10.5,
                              height: 1.2,
                              color: mutedColor,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: screenWidth >= 600
                                  ? 16
                                  : 14,
                              fontWeight:
                              FontWeight.w800,
                              color: const Color(
                                0xFFD4773A,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: screenWidth >= 600 ? 10 : 4,
                    ),

                    // ===============================
                    // QUANTITY
                    // ===============================
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 34,
                          height: 34,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity:
                            VisualDensity.compact,
                            icon: const Icon(
                              Icons.delete_outline,
                              size: 21,
                            ),
                            onPressed: () {
                              appState
                                  .removeAllFromCart(
                                coffee,
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 4),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(12),
                            color: isDark
                                ? const Color(0xFF252C32)
                                : const Color(0xFFF1F1F1),
                          ),
                          child: Row(
                            mainAxisSize:
                            MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 32,
                                height: 36,
                                child: IconButton(
                                  padding:
                                  EdgeInsets.zero,
                                  visualDensity:
                                  VisualDensity.compact,
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 17,
                                  ),
                                  onPressed: () {
                                    appState
                                        .decreaseQuantity(
                                      coffee,
                                    );
                                  },
                                ),
                              ),

                              SizedBox(
                                width: 22,
                                child: Text(
                                  '$quantity',
                                  textAlign:
                                  TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight:
                                    FontWeight.w700,
                                    color: textColor,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 32,
                                height: 36,
                                child: IconButton(
                                  padding:
                                  EdgeInsets.zero,
                                  visualDensity:
                                  VisualDensity.compact,
                                  icon: const Icon(
                                    Icons.add,
                                    size: 17,
                                  ),
                                  onPressed: () {
                                    appState
                                        .increaseQuantity(
                                      coffee,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 10),

          // ===============================
          // SUMMARY
          // ===============================
          Container(
            padding: EdgeInsets.all(
              screenWidth >= 600 ? 22 : 18,
            ),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius:
              BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                _SummaryRow(
                  title: 'Subtotal',
                  value:
                  '\$${appState.cartSubtotal.toStringAsFixed(2)}',
                  textColor: textColor,
                  mutedColor: mutedColor,
                ),

                const SizedBox(height: 12),

                _SummaryRow(
                  title: 'Delivery',
                  value:
                  '\$${appState.deliveryFee.toStringAsFixed(2)}',
                  textColor: textColor,
                  mutedColor: mutedColor,
                ),

                const Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 14),
                  child: Divider(),
                ),

                _SummaryRow(
                  title: 'Total',
                  value:
                  '\$${appState.cartTotal.toStringAsFixed(2)}',
                  textColor: textColor,
                  mutedColor: mutedColor,
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),

      // ===============================
      // CHECKOUT BUTTON
      // ===============================
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth >= 600 ? 28 : 16,
            10,
            screenWidth >= 600 ? 28 : 16,
            16,
          ),
          child: SizedBox(
            height: 58,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFFD4773A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentScreen(
                      totalAmount:
                      appState.cartTotal,
                    ),
                  ),
                );
              },
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final Color textColor;
  final Color mutedColor;
  final bool isTotal;

  const _SummaryRow({
    required this.title,
    required this.value,
    required this.textColor,
    required this.mutedColor,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isTotal ? 17 : 14,
              fontWeight: isTotal
                  ? FontWeight.w800
                  : FontWeight.w500,
              color: isTotal
                  ? textColor
                  : mutedColor,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.w800,
            color: isTotal
                ? const Color(0xFFD4773A)
                : textColor,
          ),
        ),
      ],
    );
  }
}