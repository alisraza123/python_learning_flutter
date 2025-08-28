import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnpythonapp/auth/username.dart';
import 'package:learnpythonapp/screens/home_screen.dart';
import 'package:learnpythonapp/auth/login_screen.dart';
import 'package:learnpythonapp/auth/singup_screen.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class SignUpSignInScreen extends StatefulWidget {
  SignUpSignInScreen({super.key});

  @override
  State<SignUpSignInScreen> createState() => _SignUpSignInScreenState();
}

class _SignUpSignInScreenState extends State<SignUpSignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  final auth = FirebaseAuth.instance;

  String userName = "";
  void getUserName() async {
    String fetchedName = await getuserNameFromEmail();
    setState(() {
      userName = fetchedName;
    });
  }

  void loginWithGoogle() async {
    final webClientId =
        "765538409473-t2og69t20cec7ftvenrs6cdcm8cvt3b4.apps.googleusercontent.com";
    try {
      GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize(serverClientId: webClientId);
      GoogleSignInAccount account = await signIn.authenticate();
      GoogleSignInAuthentication googleAuth = account.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);

      // Show loading dialog while fetching progress
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );
      getUserName();
      // Load user progress from Firebase
      await Provider.of<ProgressProvider>(
        context,
        listen: false,
      ).loadUserProgress();

      // Close loading dialog
      Navigator.of(context).pop();

      // Navigate to HomeScreen after data load
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      toastification.show(
        title: Text('Login Successfully'),
        autoCloseDuration: const Duration(seconds: 2),
        type: ToastificationType.success,
        style: ToastificationStyle.minimal,
        alignment: Alignment.topCenter,
        direction: TextDirection.ltr,
        showProgressBar: true,
        progressBarTheme: ProgressIndicatorThemeData(color: Colors.red),
        closeOnClick: true,
        pauseOnHover: true,
        dragToClose: true,
      );
      await Future.delayed(Duration(seconds: 3));

      toastification.show(
        title: Text('Welcome, $userName'),
        autoCloseDuration: const Duration(seconds: 2),
        type: ToastificationType.success,
        style: ToastificationStyle.minimal,
        alignment: Alignment.topCenter,
        direction: TextDirection.ltr,
        showProgressBar: true,
        progressBarTheme: ProgressIndicatorThemeData(
          color: const Color.fromARGB(255, 199, 69, 255),
        ),
        closeOnClick: true,
        pauseOnHover: true,
        dragToClose: true,
      );
    } catch (e) {
      Navigator.of(context).pop(); // close dialog if error
      toastification.show(
        title: Text(e.toString()),
        autoCloseDuration: const Duration(seconds: 2),
        type: ToastificationType.success,
        style: ToastificationStyle.minimal,
        alignment: Alignment.topCenter,
        direction: TextDirection.ltr,
        showProgressBar: true,
        closeOnClick: true,
        pauseOnHover: true,
        dragToClose: true,
        applyBlurEffect: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6F7FF5), Color(0xFF496CFB)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.08),
              child: Column(
                children: [
                  // Skip Button
                  SizedBox(height: mediaQuery.height * 0.02),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
        
                      child: const Text(
                        'SKIP',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
        
                  SizedBox(height: mediaQuery.height * 0.02),
        
                  // Top Text
                  const Text(
                    'Sign-In and Never Lose\nYour Progress',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  // Spacer to push image to center
                  const Spacer(),
        
                  // Center Image
                  Image.asset(
                    'assets/signup_login.png',
                    height: mediaQuery.height * 0.35,
                    fit: BoxFit.contain,
                  ),
        
                  // Spacer to push bottom section down
                  const Spacer(),
        
                  // Bottom Section
                  Column(
                    children: [
                      const Text(
                        'One Tap Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          loginWithGoogle();
                        },
                        behavior: HitTestBehavior
                            .translucent, // Make entire area tappable
        
                        child: Container(
                          width: 80, // Increase container size
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/google.png',
                              width: 60, // Increase image size
                              height: 60,
                            ),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                          print('Sign Up with Email pressed');
                        },
                        child: const Text(
                          'Sign Up with Email',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                  debugPrint('Login link pressed');
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
