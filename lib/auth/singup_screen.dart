import 'package:flutter/material.dart';
import 'package:learnpythonapp/auth/signup_signin_screen.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/home_screen.dart';
import 'package:learnpythonapp/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              // Skip button
              Positioned(
                top: 40,
                right: 20,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
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
                        "Sign Up",
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
                      const SizedBox(height: 30),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
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
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
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
  final password = passwordController.text.trim();
  final email = emailController.text.trim();

  // 1️⃣ Check empty fields
  if (email.isEmpty || password.isEmpty) {
    toastification.show(
      title: const Text('Email or password cannot be empty!'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
    );
    return;
  }

  // 2️⃣ Password validation
  final passwordRegEx =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

  if (!passwordRegEx.hasMatch(password)) {
    toastification.show(
      title: const Text(
        'Password must be at least 8 characters,\ninclude upper & lower case letters,\nnumbers, and a special character.\nExample: Abc123@#',
      ),
      autoCloseDuration: const Duration(seconds: 4),
      type: ToastificationType.error,
    );
    return;
  }

  try {
    setState(() {
      loading = true;
    });

    // 3️⃣ Create user
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // 4️⃣ Send verification email
    User? user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    setState(() {
      loading = false;
    });

    // 5️⃣ Show success toast
    toastification.show(
      title: const Text(
        'Signup successful! Please verify your email.',
      ),
      autoCloseDuration: const Duration(seconds: 4),
      type: ToastificationType.success,
    );

    // 6️⃣ Navigate to login screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    setState(() {
      loading = false;
    });
    toastification.show(
      title: Text(e.message ?? 'Firebase Error'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
    );
  } catch (e) {
    setState(() {
      loading = false;
    });
    toastification.show(
      title: Text('Unknown error: $e'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
    );
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
                                    "Sign Up",
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
