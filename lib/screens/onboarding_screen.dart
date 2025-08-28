import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/goals_screen.dart';
import 'package:learnpythonapp/template/splash_screen_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}


class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // PageView for swiping through screens
          PageView(
            controller: _pageController,
            children: const [
              SplashScreenPage(
                  image: "assets/onboard_1.png",
                title: 'Trusted by Millions of users',
                description:
                    'Python has never been so much fun and easy. We reinvented the programming learning experience.',

                assetAlignment: Alignment.bottomCenter,
              ),
              SplashScreenPage(
                  image: "assets/onboard_2.png",
                title: 'Get job ready',
                description:
                    'Master your Python skills with this course and get job ready.Unlock your potential and start building real projects today.',

                assetAlignment: Alignment.bottomCenter,
              ),
              SplashScreenPage(
               image: "assets/onboard_3.png",
                title: 'Backed by Google experts',
                description:
                    'Expertly curated and backed by Google experts. Join thousands who have transformed their careers.',

                assetAlignment: Alignment.bottomCenter,
              ),
            ],
          ),
          // Page indicator dots at the top
          Positioned(
            top: mediaQuery.height * 0.3,
            left: mediaQuery.width * 0.1,
            child: Row(children: List.generate(3, (index) => buildDot(index))),
          ),
          // "GET STARTED" button at the bottom
          Positioned(
            bottom: mediaQuery.height * 0.05,
            left: mediaQuery.width * 0.1,
            right: mediaQuery.width * 0.1,
            child: SizedBox(
              width: mediaQuery.width * 0.8,
              height: 50,
              child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GoalsScreen(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.zero, // Remove default padding for full gradient coverage
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // match your design if needed
    ),
    backgroundColor: Colors.transparent, // transparent to show gradient
    shadowColor: Colors.transparent, // optional, remove shadow if you want
  ),
  child: Ink(
    decoration: BoxDecoration(
      gradient:  LinearGradient(
        colors: AppColors.gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      alignment: Alignment.center,
      height: 50,
      child: const Text(
        "Get Started",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  ),
),

            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the dots
  Widget buildDot(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color.fromARGB(255, 139, 139, 139)
            : const Color.fromARGB(255, 214, 214, 214).withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }

  // Helper method to get the button text color based on the current page
}
