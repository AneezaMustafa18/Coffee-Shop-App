import 'package:flutter/material.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = theme.scaffoldBackgroundColor;
    final cardColor = isDark
        ? const Color(0xFF171D22)
        : Colors.white;

    final textColor = theme.colorScheme.onSurface;
    final mutedColor = isDark
        ? Colors.white70
        : Colors.black54;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        title: const Text(
          'Special Offer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          10,
          20,
          30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?auto=format&fit=crop&w=1000&q=80',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: double.infinity,
                    height: 220,
                    color: isDark
                        ? const Color(0xFF2A211C)
                        : Colors.brown.shade300,
                    child: Icon(
                      Icons.local_cafe_rounded,
                      size: 70,
                      color: isDark
                          ? Colors.white70
                          : Colors.white,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Text(
              '5 Coffee Beans You Must Try!',
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Discover five amazing coffee beans that every coffee lover should try at least once.',
              style: TextStyle(
                color: mutedColor,
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      isDark ? 0.08 : 0.05,
                    ),
                    blurRadius: 14,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _BeanItem(
                    number: '01',
                    title: 'Ethiopian Yirgacheffe',
                    description:
                    'Bright, floral and naturally sweet.',
                    textColor: textColor,
                    mutedColor: mutedColor,
                  ),

                  const SizedBox(height: 18),

                  _BeanItem(
                    number: '02',
                    title: 'Colombian Supremo',
                    description:
                    'Smooth, balanced and chocolatey.',
                    textColor: textColor,
                    mutedColor: mutedColor,
                  ),

                  const SizedBox(height: 18),

                  _BeanItem(
                    number: '03',
                    title: 'Brazilian Santos',
                    description:
                    'Rich, nutty and pleasantly mild.',
                    textColor: textColor,
                    mutedColor: mutedColor,
                  ),

                  const SizedBox(height: 18),

                  _BeanItem(
                    number: '04',
                    title: 'Guatemala Antigua',
                    description:
                    'Deep, aromatic and slightly spicy.',
                    textColor: textColor,
                    mutedColor: mutedColor,
                  ),

                  const SizedBox(height: 18),

                  _BeanItem(
                    number: '05',
                    title: 'Costa Rican Tarrazu',
                    description:
                    'Clean, bright and wonderfully smooth.',
                    textColor: textColor,
                    mutedColor: mutedColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BeanItem extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final Color textColor;
  final Color mutedColor;

  const _BeanItem({
    required this.number,
    required this.title,
    required this.description,
    required this.textColor,
    required this.mutedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFD4773A).withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: Color(0xFFD4773A),
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                description,
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 13,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}