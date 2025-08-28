import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/auth/forgot_password.dart';
import 'package:learnpythonapp/auth/signup_signin_screen.dart';
import 'package:learnpythonapp/auth/username.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/home_screen.dart';
import 'package:learnpythonapp/auth/singup_screen.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  bool loading = false;
  final auth = FirebaseAuth.instance;
  bool circularProgress = false;
  String userName = "";
  void getUserName() async {
    String fetchedName = await getuserNameFromEmail();
    setState(() {
      userName = fetchedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    getUserName();
    if (circularProgress) {
      return Center(child: CircularProgressIndicator(color: Colors.white));
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/signupBg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Skip button at top right
              Positioned(
                top: 40,
                right: 20,
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      circularProgress = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    setState(() {
                      circularProgress = false;
                    });
                  },
                  child: const Text(
                    'SKIP',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              // Centered form
              Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.1,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.3),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.3),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              "forgot password?",
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              ),
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Dont have an account number? ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      textAlign: TextAlign.center,
                                      'Sign Up',
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
                        ],
                      ),

                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.gradientColors,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                setState(() => loading = true);

                                // 1️⃣ Check if email & password fields are empty
                                if (emailController.text.trim().isEmpty ||
                                    passwordController.text.trim().isEmpty) {
                                  toastification.show(
                                    title: const Text('Please fill all fields'),
                                    autoCloseDuration: const Duration(
                                      seconds: 2,
                                    ),
                                    type: ToastificationType.info,
                                    style: ToastificationStyle.flat,
                                    alignment: Alignment.topCenter,
                                  );
                                  setState(() => loading = false);
                                  return;
                                }

                                // 2️⃣ Sign in with Firebase
                                 await auth
                                    .signInWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );

                                User? user = auth.currentUser;

                                // 3️⃣ Reload user to get latest email verification status
                                await user?.reload();
                                user = auth.currentUser;

                                if (user != null) {
                                  if (user.emailVerified) {
                                    // ✅ Already verified, proceed to HomeScreen
                                    await Provider.of<ProgressProvider>(
                                      context,
                                      listen: false,
                                    ).loadUserProgress();

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );

                                    toastification.show(
                                      title: Text('Login Successfully'),
                                      autoCloseDuration: const Duration(
                                        seconds: 2,
                                      ),
                                      type: ToastificationType.success,
                                      style: ToastificationStyle.minimal,
                                      alignment: Alignment.topCenter,
                                      direction: TextDirection.ltr,
                                      showProgressBar: true,
                                      progressBarTheme:
                                          ProgressIndicatorThemeData(
                                            color: Colors.red,
                                          ),
                                      closeOnClick: true,
                                      pauseOnHover: true,
                                      dragToClose: true,
                                    );
                                  } else {
                                    // ✉️ Not verified, send verification email
                                    await user.sendEmailVerification();
                                    toastification.show(
                                      title: Text(
                                        'Email not verified. Verification link sent to your email. Please verify.',
                                      ),
                                      autoCloseDuration: const Duration(
                                        seconds: 2,
                                      ),
                                      type: ToastificationType.info,
                                      style: ToastificationStyle.minimal,
                                      alignment: Alignment.topCenter,
                                      direction: TextDirection.ltr,
                                      showProgressBar: true,
                                      progressBarTheme:
                                          ProgressIndicatorThemeData(
                                            color: Colors.red,
                                          ),
                                      closeOnClick: true,
                                      pauseOnHover: true,
                                      dragToClose: true,
                                    );

                                    // Clear inputs
                                    emailController.clear();
                                    passwordController.clear();
                                  }
                                }
                              } on FirebaseAuthException catch (e) {
                                toastification.show(
                                  title: Text(e.message ?? "Error occurred"),
                                  autoCloseDuration: const Duration(seconds: 2),
                                  type: ToastificationType.error,
                                  style: ToastificationStyle.minimal,
                                  alignment: Alignment.topCenter,
                                  direction: TextDirection.ltr,
                                  showProgressBar: true,
                                  progressBarTheme: ProgressIndicatorThemeData(
                                    color: Colors.red,
                                  ),
                                  closeOnClick: true,
                                  pauseOnHover: true,
                                  dragToClose: true,
                                );
                              } catch (e) {
                                 toastification.show(
                                  title: Text(e.toString()),
                                  autoCloseDuration: const Duration(seconds: 2),
                                  type: ToastificationType.error,
                                  style: ToastificationStyle.minimal,
                                  alignment: Alignment.topCenter,
                                  direction: TextDirection.ltr,
                                  showProgressBar: true,
                                  progressBarTheme: ProgressIndicatorThemeData(
                                    color: Colors.red,
                                  ),
                                  closeOnClick: true,
                                  pauseOnHover: true,
                                  dragToClose: true,
                                );
                              } finally {
                                setState(() => loading = false);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: loading
                                ? CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity, // makes the button full width
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpSignInScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 70, // Increase container size
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/google.png',
                                width: 40, // Increase image size
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
