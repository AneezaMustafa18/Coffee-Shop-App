import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;

  const PaymentScreen({
    super.key,
    required this.totalAmount,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = 'Credit Card';

  final Color orangeColor =
  const Color(0xFFD4773A);

  final TextEditingController cardNumberController =
  TextEditingController();

  final TextEditingController cardHolderController =
  TextEditingController();

  final TextEditingController expiryController =
  TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isDark =
        theme.brightness == Brightness.dark;

    // Dynamic theme colors
    final backgroundColor = isDark
        ? const Color(0xFF080B10)
        : const Color(0xFFF5F5F5);

    final boxColor = isDark
        ? const Color(0xFF151A20)
        : Colors.white;

    final cardColor = isDark
        ? const Color(0xFF18171D)
        : Colors.white;

    final textColor = isDark
        ? Colors.white
        : Colors.black87;

    final secondaryTextColor = isDark
        ? Colors.white54
        : Colors.black54;

    final iconColor = isDark
        ? Colors.white
        : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,

      // =================================
      // APP BAR
      // =================================

      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondaryTextColor,
            size: 21,
          ),
        ),

        title: Text(
          'Payment',
          style: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // =================================
      // BODY
      // =================================

      body: SafeArea(
        child: SingleChildScrollView(
          physics:
          const BouncingScrollPhysics(),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              8,
              18,
              24,
            ),

            child: Column(
              children: [

                // =================================
                // CREDIT CARD
                // =================================

                Container(
                  width: double.infinity,
                  height: 270,

                  padding:
                  const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: cardColor,

                    borderRadius:
                    BorderRadius.circular(23),

                    border: Border.all(
                      color:
                      selectedPayment ==
                          'Credit Card'
                          ? orangeColor
                          : isDark
                          ? Colors.white24
                          : Colors.black12,

                      width: 1.8,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // Credit Card + VISA
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                        children: [

                          Text(
                            'Credit Card',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),

                          Text(
                            'VISA',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 21,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // =================================
                      // CARD NUMBER
                      // =================================

                      Text(
                        'Card Number',
                        style: TextStyle(
                          color:
                          secondaryTextColor,
                          fontSize: 11,
                        ),
                      ),

                      const SizedBox(height: 6),

                      TextField(
                        controller:
                        cardNumberController,

                        keyboardType:
                        TextInputType.number,

                        maxLength: 19,

                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          letterSpacing: 1.5,
                        ),

                        decoration:
                        InputDecoration(
                          hintText:
                          'Enter card number',

                          hintStyle: TextStyle(
                            color: isDark
                                ? Colors.white30
                                : Colors.black38,
                            fontSize: 12,
                          ),

                          counterText: '',

                          prefixIcon:
                          Icon(
                            Icons
                                .credit_card_rounded,
                            color:
                            const Color(
                              0xFFE3A05C,
                            ),
                            size: 23,
                          ),

                          filled: true,

                          fillColor: isDark
                              ? Colors.black26
                              : const Color(
                            0xFFF1F1F1,
                          ),

                          contentPadding:
                          const EdgeInsets
                              .symmetric(
                            vertical: 15,
                            horizontal: 12,
                          ),

                          border:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                              11,
                            ),

                            borderSide:
                            BorderSide.none,
                          ),
                        ),
                      ),

                      const Spacer(),

                      // =================================
                      // CARD HOLDER + EXPIRY
                      // =================================

                      Row(
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  'Card Holder',
                                  style: TextStyle(
                                    color:
                                    secondaryTextColor,
                                    fontSize: 11,
                                  ),
                                ),

                                const SizedBox(
                                  height: 6,
                                ),

                                TextField(
                                  controller:
                                  cardHolderController,

                                  textCapitalization:
                                  TextCapitalization
                                      .words,

                                  style: TextStyle(
                                    color:
                                    textColor,
                                    fontSize: 13,
                                  ),

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    'Your name',

                                    hintStyle:
                                    TextStyle(
                                      color: isDark
                                          ? Colors
                                          .white30
                                          : Colors
                                          .black38,
                                      fontSize: 11,
                                    ),

                                    filled: true,

                                    fillColor: isDark
                                        ? Colors
                                        .black26
                                        : const Color(
                                      0xFFF1F1F1,
                                    ),

                                    contentPadding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 12,
                                      vertical: 13,
                                    ),

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        10,
                                      ),
                                      borderSide:
                                      BorderSide
                                          .none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 14),

                          SizedBox(
                            width: 105,

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  'Expires',
                                  style: TextStyle(
                                    color:
                                    secondaryTextColor,
                                    fontSize: 11,
                                  ),
                                ),

                                const SizedBox(
                                  height: 6,
                                ),

                                TextField(
                                  controller:
                                  expiryController,

                                  keyboardType:
                                  TextInputType
                                      .number,

                                  maxLength: 5,

                                  style: TextStyle(
                                    color:
                                    textColor,
                                    fontSize: 13,
                                  ),

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    'MM/YY',

                                    hintStyle:
                                    TextStyle(
                                      color: isDark
                                          ? Colors
                                          .white30
                                          : Colors
                                          .black38,
                                      fontSize: 11,
                                    ),

                                    counterText: '',

                                    filled: true,

                                    fillColor: isDark
                                        ? Colors
                                        .black26
                                        : const Color(
                                      0xFFF1F1F1,
                                    ),

                                    contentPadding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 12,
                                      vertical: 13,
                                    ),

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        10,
                                      ),
                                      borderSide:
                                      BorderSide
                                          .none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // =================================
                // WALLET
                // =================================

                paymentOption(
                  icon: Icons
                      .account_balance_wallet_rounded,
                  title: 'Wallet',
                  amount: '\$100.50',
                  textColor: textColor,
                  iconColor: iconColor,
                  boxColor: boxColor,
                  secondaryTextColor:
                  secondaryTextColor,
                  isDark: isDark,
                ),

                const SizedBox(height: 12),

                // =================================
                // GOOGLE PAY
                // =================================

                paymentOption(
                  icon:
                  Icons.g_mobiledata_rounded,
                  title: 'Google Pay',
                  textColor: textColor,
                  iconColor: iconColor,
                  boxColor: boxColor,
                  secondaryTextColor:
                  secondaryTextColor,
                  isDark: isDark,
                ),

                const SizedBox(height: 12),

                // =================================
                // APPLE PAY
                // =================================

                paymentOption(
                  icon: Icons.apple,
                  title: 'Apple Pay',
                  textColor: textColor,
                  iconColor: iconColor,
                  boxColor: boxColor,
                  secondaryTextColor:
                  secondaryTextColor,
                  isDark: isDark,
                ),

                const SizedBox(height: 12),

                // =================================
                // AMAZON PAY
                // =================================

                paymentOption(
                  icon:
                  Icons.shopping_bag_outlined,
                  title: 'Amazon Pay',
                  textColor: textColor,
                  iconColor: iconColor,
                  boxColor: boxColor,
                  secondaryTextColor:
                  secondaryTextColor,
                  isDark: isDark,
                ),

                const SizedBox(height: 28),

                // =================================
                // PRICE + PAY
                // =================================

                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,

                  children: [

                    // PRICE
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          Text(
                            'Price',
                            style: TextStyle(
                              color:
                              secondaryTextColor,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .end,

                            children: [

                              Text(
                                '\$',
                                style: TextStyle(
                                  color:
                                  orangeColor,
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(
                                width: 4,
                              ),

                              Text(
                                widget.totalAmount
                                    .toStringAsFixed(
                                  2,
                                ),

                                style: TextStyle(
                                  color:
                                  textColor,
                                  fontSize: 26,
                                  fontWeight:
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // PAY BUTTON
                    Expanded(
                      flex: 2,

                      child: SizedBox(
                        height: 58,

                        child: ElevatedButton(
                          onPressed: () {

                            if (selectedPayment ==
                                'Credit Card') {

                              if (cardNumberController
                                  .text
                                  .isEmpty ||
                                  cardHolderController
                                      .text
                                      .isEmpty ||
                                  expiryController
                                      .text
                                      .isEmpty) {

                                ScaffoldMessenger
                                    .of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please enter card details',
                                    ),
                                  ),
                                );

                                return;
                              }
                            }

                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Payment successful!',
                                ),
                              ),
                            );
                          },

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            orangeColor,

                            foregroundColor:
                            Colors.white,

                            elevation: 0,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),

                          child: Text(
                            'Pay from $selectedPayment',

                            textAlign:
                            TextAlign.center,

                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =================================
  // PAYMENT OPTION
  // =================================

  Widget paymentOption({
    required IconData icon,
    required String title,
    String? amount,
    required Color textColor,
    required Color iconColor,
    required Color boxColor,
    required Color secondaryTextColor,
    required bool isDark,
  }) {
    final bool selected =
        selectedPayment == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = title;
        });
      },

      child: Container(
        width: double.infinity,
        height: 64,

        padding:
        const EdgeInsets.symmetric(
          horizontal: 17,
        ),

        decoration: BoxDecoration(
          color: boxColor,

          borderRadius:
          BorderRadius.circular(21),

          border: Border.all(
            color: selected
                ? orangeColor
                : isDark
                ? Colors.white12
                : Colors.black12,

            width: selected ? 1.4 : 0.9,
          ),
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color: iconColor,
              size: 27,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,

                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight:
                  FontWeight.w500,
                ),
              ),
            ),

            if (amount != null)
              Text(
                amount,

                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 12,
                ),
              ),

            const SizedBox(width: 12),

            Container(
              width: 20,
              height: 20,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(
                  color: selected
                      ? orangeColor
                      : isDark
                      ? Colors.white30
                      : Colors.black26,

                  width: 1.5,
                ),
              ),

              child: selected
                  ? Center(
                child: Container(
                  width: 9,
                  height: 9,

                  decoration:
                  BoxDecoration(
                    color: orangeColor,
                    shape:
                    BoxShape.circle,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}