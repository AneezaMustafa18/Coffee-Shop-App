import 'package:bigbrains_coffeeshop_task/state/app_state.dart';
import 'package:bigbrains_coffeeshop_task/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final theme = Theme.of(context);
    final isDark =
        theme.brightness == Brightness.dark;

    final textColor =
        theme.colorScheme.onSurface;

    final mutedColor = isDark
        ? Colors.white70
        : Colors.black54;

    final cardColor = isDark
        ? const Color(0xFF171D22)
        : Colors.white;

    final email = appState.userEmail.isEmpty
        ? 'No email added'
        : appState.userEmail;

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
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(
                context,
                '/',
              );
            }
          },
        ),
        title: const Text(
          'Profile',
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

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            30,
          ),
          child: Column(
            children: [
              // =================================================
              // PROFILE HEADER
              // =================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius:
                  BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    // PROFILE IMAGE
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(
                          0xFFD4773A,
                        ).withOpacity(0.15),
                        border: Border.all(
                          color: const Color(
                            0xFFD4773A,
                          ),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 58,
                        color: Color(0xFFD4773A),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Coffee Lover',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight:
                        FontWeight.w800,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: mutedColor,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // EDIT PROFILE
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          _showEditProfileDialog(
                            context,
                            email,
                          );
                        },
                        style:
                        OutlinedButton.styleFrom(
                          foregroundColor:
                          const Color(
                            0xFFD4773A,
                          ),
                          side: const BorderSide(
                            color: Color(
                              0xFFD4773A,
                            ),
                          ),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                              14,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // =================================================
              // STATS
              // =================================================

              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon:
                      Icons.favorite_rounded,
                      title: 'Favorites',
                      value:
                      '${appState.favorites.length}',
                      cardColor: cardColor,
                      textColor: textColor,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _StatCard(
                      icon:
                      Icons.shopping_bag_rounded,
                      title: 'Cart Items',
                      value:
                      '${appState.cartCount}',
                      cardColor: cardColor,
                      textColor: textColor,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _StatCard(
                      icon:
                      Icons.receipt_long_rounded,
                      title: 'Orders',
                      value:
                      '${appState.orders.length}',
                      cardColor: cardColor,
                      textColor: textColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // =================================================
              // MENU OPTIONS
              // =================================================

              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius:
                  BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    _ProfileOption(
                      icon: Icons
                          .favorite_border_rounded,
                      title: 'My Favorites',
                      subtitle:
                      'View your favorite coffees',
                      textColor: textColor,
                      mutedColor: mutedColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/favorites',
                        );
                      },
                    ),

                    const Divider(
                      height: 1,
                      indent: 65,
                    ),

                    _ProfileOption(
                      icon: Icons
                          .shopping_bag_outlined,
                      title: 'My Cart',
                      subtitle:
                      'View items in your cart',
                      textColor: textColor,
                      mutedColor: mutedColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/cart',
                        );
                      },
                    ),

                    const Divider(
                      height: 1,
                      indent: 65,
                    ),

                    _ProfileOption(
                      icon: Icons
                          .receipt_long_outlined,
                      title: 'My Orders',
                      subtitle:
                      'View your previous orders',
                      textColor: textColor,
                      mutedColor: mutedColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/orders',
                        );
                      },
                    ),

                    const Divider(
                      height: 1,
                      indent: 65,
                    ),

                    _ProfileOption(
                      icon:
                      Icons.settings_outlined,
                      title: 'Settings',
                      subtitle:
                      'Manage your preferences',
                      textColor: textColor,
                      mutedColor: mutedColor,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // =================================================
              // LOGOUT
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style:
                  OutlinedButton.styleFrom(
                    foregroundColor:
                    Colors.redAccent,
                    side: const BorderSide(
                      color: Colors.redAccent,
                    ),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // =========================================================
      // BOTTOM NAVIGATION
      // =========================================================

      bottomNavigationBar:
      const BottomNavBar(
        selectedIndex: 3,
      ),
    );
  }

  // ===========================================================
  // EDIT PROFILE DIALOG
  // ===========================================================

  void _showEditProfileDialog(
      BuildContext context,
      String currentEmail,
      ) {
    final controller = TextEditingController(
      text: currentEmail == 'No email added'
          ? ''
          : currentEmail,
    );

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          content: TextField(
            controller: controller,
            keyboardType:
            TextInputType.emailAddress,
            decoration:
            const InputDecoration(
              labelText: 'Email',
              prefixIcon:
              Icon(Icons.email_outlined),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final email =
                controller.text.trim();

                if (email.isNotEmpty) {
                  context
                      .read<AppState>()
                      .setUserEmail(email);
                }

                Navigator.pop(dialogContext);
              },
              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFFD4773A),
                foregroundColor: Colors.white,
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================
  // LOGOUT DIALOG
  // ===========================================================

  void _showLogoutDialog(
      BuildContext context,
      ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AppState>()
                    .setUserEmail('');

                Navigator.pop(dialogContext);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                      (route) => false,
                );
              },
              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

// =============================================================
// STAT CARD
// =============================================================

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color cardColor;
  final Color textColor;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.cardColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius:
        BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color:
            const Color(0xFFD4773A),
            size: 24,
          ),

          const SizedBox(height: 7),

          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.w800,
              color: textColor,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.5,
              color:
              textColor.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// PROFILE OPTION
// =============================================================

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color textColor;
  final Color mutedColor;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.textColor,
    required this.mutedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Material is intentionally added here
    // so ListTile ink/ripple is not hidden
    // by the parent colored Container.
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
        ),
        leading: Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            color: const Color(
              0xFFD4773A,
            ).withOpacity(0.12),
            borderRadius:
            BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color:
            const Color(0xFFD4773A),
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight:
            FontWeight.w700,
            color: textColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 11.5,
            color: mutedColor,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
          color: mutedColor,
        ),
        onTap: onTap,
      ),
    );
  }
}