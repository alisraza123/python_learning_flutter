import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/pro_screen.dart';
import 'package:learnpythonapp/screens/progress_screen.dart';
import 'package:learnpythonapp/screens/settings_screen.dart';
import 'package:learnpythonapp/template/course_card.dart';
import 'package:learnpythonapp/template/drawer_menu.dart';
import 'package:learnpythonapp/screens/learningscreen.dart';
import 'package:learnpythonapp/screens/providers/theme_provider.dart';
import 'package:learnpythonapp/template/home_action.dart';
import 'package:learnpythonapp/widgets/buildBanner.dart';
import 'package:learnpythonapp/widgets/buildDots.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentIndex = 0; // Initialize with the default tab index (usually 0)
  final User? user = FirebaseAuth.instance.currentUser;
  String packageName = '';
  final List<Map<String, dynamic>> banners = [
    {
      'title': 'Benefits of Python Learning',
      'description': 'Python has never been easier.',
      'image': 'assets/b1.png', // apna asset image path
    },
    {
      'title': 'Celebrate your love for \ncoding with pro access',
      'description': 'Limited Time Offers',
      'image': 'assets/b2.png',
    },
  ];
  void shareApp() {
    final text =
        'Boost your coding skills with this app! Download now: $packageName';
    Share.share(text);
  }

  Future<void> getPackage() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      packageName = info.packageName;
    });
  }

  @override
  void initState() {
    super.initState();
    getPackage();
    _pageController.addListener(() {
      setState(() => _currentPage = _pageController.page!.round());
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper to darken a color for dark mode
  Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode
          ? Theme.of(context)
                .scaffoldBackgroundColor // dark mode ka background
          : Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/python.png", width: 25),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.gradientColors),
                borderRadius: BorderRadius.circular(8), // button ka roundness
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.transparent, // transparent so gradient dikhay
                  shadowColor: Colors.transparent, // shadow bhi remove
                  foregroundColor: Colors.white, // text ka color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProScreen()),
                  );
                },
                child: const Text("Get Pro"),
              ),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: DrawerMenu(
        courseTopics: [],
        isDarkMode: isDarkMode,
        onThemeChanged: (bool value) {
          themeProvider.toggleTheme();
        },
      ),

      // *** Yahan switch kiya hai _currentIndex ke basis par ***
      body: _currentIndex == 0
          ? Column(
              children: [
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: banners.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) =>
                        buildBanner(banners[index], isDarkMode),
                  ),
                ),
                const SizedBox(height: 12),
                buildDots(banners, isDarkMode, _currentPage),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Courses',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        // Large screen: Row layout with auto-adjusted card widths
                        double spacing = 12;
                        int cardCount = 3;
                        double cardWidth =
                            (constraints.maxWidth -
                                (spacing * (cardCount - 1))) /
                            cardCount;

                        return SingleChildScrollView(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: cardWidth,
                                  child: CourseCard(
                                    title: 'Python Learning',
                                    tag: 'Trending',
                                    tagColor: Colors.pink,
                                    backgroundImage: 'assets/pythonCard.jpg',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LearningScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(width: spacing),
                              ],
                            ),
                          ),
                        );
                      } else {
                        // Small screen: Column/ListView
                        return ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            CourseCard(
                              title: 'Python Learning',
                              tag: 'Trending',
                              tagColor: Colors.pink,
                              backgroundImage: 'assets/pythonCard.jpg',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LearningScreen(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                HomeActionCard(
                                  icon: Icons.settings,
                                  text: "Settings",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SettingsScreen(),
                                      ),
                                    );
                                  },
                                ),
                                HomeActionCard(
                                  icon: Icons.share,
                                  text: "Share",
                                  onTap: () {
                                    shareApp();
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            )
          : _currentIndex == 1
          ? ProgressScreen()
          : Spacer(), // agar aur screens hon to add kar sakte ho yahan

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: AppColors.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(Icons.home, color: Colors.white, size: 25),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: AppColors.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.show_chart,
                color: Colors.white,
                size: 25,
              ),
            ),
            label: 'Progress',
          ),
         
        ],
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
