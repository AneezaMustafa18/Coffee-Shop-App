import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  void _navigate(
      BuildContext context,
      int index,
      ) {
    String route;

    switch (index) {
      case 0:
        route = '/';
        break;

      case 1:
        route = '/favorites';
        break;

      case 2:
        route = '/orders';
        break;

      case 3:
        route = '/profile';
        break;

      default:
        route = '/';
    }

    final currentRoute =
        ModalRoute.of(context)?.settings.name;

    if (currentRoute != route) {
      Navigator.pushReplacementNamed(
        context,
        route,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return SafeArea(
      child: Padding(
        padding:
        const EdgeInsets.fromLTRB(
          18,
          8,
          18,
          14,
        ),

        child: Container(
          height: 68,

          padding:
          const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF171D22)
                : Colors.white,

            borderRadius:
            BorderRadius.circular(24),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isDark ? .25 : .10,
                ),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,

            children: [

              _navItem(
                context: context,
                icon:
                Icons.home_outlined,
                selectedIcon:
                Icons.home_rounded,
                label: 'Home',
                index: 0,
                isDark: isDark,
              ),

              _navItem(
                context: context,
                icon:
                Icons.favorite_border_rounded,
                selectedIcon:
                Icons.favorite_rounded,
                label: 'Favorites',
                index: 1,
                isDark: isDark,
              ),

              _navItem(
                context: context,
                icon:
                Icons.shopping_bag_outlined,
                selectedIcon:
                Icons.shopping_bag_rounded,
                label: 'Orders',
                index: 2,
                isDark: isDark,
              ),

              _navItem(
                context: context,
                icon:
                Icons.person_outline_rounded,
                selectedIcon:
                Icons.person_rounded,
                label: 'Profile',
                index: 3,
                isDark: isDark,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required BuildContext context,
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int index,
    required bool isDark,
  }) {
    final selected =
        selectedIndex == index;

    return GestureDetector(
      onTap: () {
        _navigate(context, index);
      },

      behavior:
      HitTestBehavior.opaque,

      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),

        curve: Curves.easeOut,

        padding: EdgeInsets.symmetric(
          horizontal:
          selected ? 16 : 13,
          vertical: 9,
        ),

        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFD4773A)
              : Colors.transparent,

          borderRadius:
          BorderRadius.circular(18),
        ),

        child: Row(
          mainAxisSize:
          MainAxisSize.min,

          children: [

            Icon(
              selected
                  ? selectedIcon
                  : icon,

              size: 22,

              color: selected
                  ? Colors.white
                  : isDark
                  ? Colors.white54
                  : Colors.black45,
            ),

            if (selected) ...[
              const SizedBox(width: 7),

              Text(
                label,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight:
                  FontWeight.w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}