import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  PageController pageController = PageController();

  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'image':
      'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=800&q=80',
      'title': 'Discover Your\nPerfect Coffee',
      'description':
      'Explore delicious coffee made specially for your taste.',
    },
    {
      'image':
      'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80',
      'title': 'Freshly Brewed,\nJust For You',
      'description':
      'Enjoy fresh and rich coffee prepared with quality ingredients.',
    },
    {
      'image':
      'https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=800&q=80',
      'title': 'Enjoy Every\nSip',
      'description':
      'Sit back, relax and enjoy your favorite coffee anytime.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    Color textColor =
        Theme.of(context).colorScheme.onSurface;

    Color mutedColor =
    isDark ? Colors.white54 : Colors.black54;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // SKIP BUTTON
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/login',
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFFD4773A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            // SLIDES
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,

                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        // IMAGE
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(25),

                          child: Image.network(
                            pages[index]['image']!,
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 35),

                        // TITLE
                        Text(
                          pages[index]['title']!,
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: textColor,
                            fontSize: 29,
                            height: 1.1,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // DESCRIPTION
                        Text(
                          pages[index]['description']!,
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // DOTS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) {
                  return Container(
                    margin:
                    const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),

                    width: currentPage == index
                        ? 25
                        : 8,

                    height: 8,

                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? const Color(0xFFD4773A)
                          : Colors.grey.shade400,

                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // NEXT / GET STARTED BUTTON
            Padding(
              padding: const EdgeInsets.fromLTRB(
                22,
                0,
                22,
                25,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {

                    if (currentPage < pages.length - 1) {

                      pageController.nextPage(
                        duration:
                        const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeInOut,
                      );

                    } else {

                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFFD4773A),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                  ),

                  child: Text(
                    currentPage ==
                        pages.length - 1
                        ? 'Get Started'
                        : 'Next',

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
