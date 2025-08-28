import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnpythonapp/auth/login_screen.dart';
import 'package:learnpythonapp/screens/home_screen.dart';
import 'package:learnpythonapp/screens/onboarding_screen.dart'; // ✅ Import your onboarding screen
import 'package:learnpythonapp/screens/providers/theme_provider.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstLaunch = prefs.getBool('first_launch');

  // If null, it's first time
  isFirstLaunch ??= true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
      ],
      child: MyApp(isFirstLaunch: isFirstLaunch),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return ToastificationWrapper(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeProvider.themeMode,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primaryColor: const Color(0xFF6C63FF),
                  scaffoldBackgroundColor: const Color(0xFFF9FAFB),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Color(0xFFF9FAFB),
                  ),
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    backgroundColor: Color(0xFFF9FAFB),
                    iconTheme: IconThemeData(color: Colors.black87),
                    titleTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6584),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: const Color(0xFF8B80F9),
                  scaffoldBackgroundColor: const Color.fromARGB(
                    255,
                    54,
                    54,
                    54,
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Color.fromARGB(255, 69, 69, 69),
                  ),
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 54, 54, 54),
                    iconTheme: IconThemeData(color: Colors.white70),
                    titleTextStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  cardColor: const Color(0xFF1E1E1E),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6584),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                home: LauncherScreen(isFirstLaunch: isFirstLaunch),
              ),
            );
          },
          child: const SizedBox.shrink(),
        );
      },
    );
  }
}

class LauncherScreen extends StatefulWidget {
  final bool isFirstLaunch;
  const LauncherScreen({super.key, required this.isFirstLaunch});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    super.initState();
    _checkStartup();
  }

  void _checkStartup() async {
    // Optional: small delay
    await Future.delayed(const Duration(milliseconds: 500));

    if (widget.isFirstLaunch) {
      // ✅ Go to onboarding if first launch
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
      return;
    }

    // ✅ If user is logged in
    if (FirebaseAuth.instance.currentUser != null) {
      await Provider.of<ProgressProvider>(
        context,
        listen: false,
      ).loadUserProgress();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      // ✅ If not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
