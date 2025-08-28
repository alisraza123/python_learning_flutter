import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/auth/login_screen.dart';
import 'package:learnpythonapp/auth/singup_screen.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: SizedBox(
                height: size.height - MediaQuery.of(context).padding.top,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Top: Forgot Password + Email + Button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.08,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        Text("Enter you Email address we will send we will send you link to mail to reset your password.",
                        style: TextStyle(color: const Color.fromARGB(207, 255, 255, 255))
                        ,),
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
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() => loading = true);
      
                              try {
                                if (emailController.text.trim().isEmpty) {
                                  toastification.show(
                                    title: const Text("Please enter your email"),
                                    type: ToastificationType.info,
                                    alignment: Alignment.topCenter,
                                  );
                                  setState(() => loading = false);
                                  return;
                                }
      
                                await auth.sendPasswordResetEmail(
                                  email: emailController.text.trim(),
                                );
      
                                toastification.show(
                                  title: const Text(
                                    "Password reset email sent! Check your inbox",
                                  ),
                                  type: ToastificationType.success,
                                  alignment: Alignment.topCenter,
                                );
      
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                toastification.show(
                                  title: Text(e.message ?? "Error occurred"),
                                  type: ToastificationType.error,
                                  alignment: Alignment.topCenter,
                                );
                              }
      
                              setState(() => loading = false);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets
                                  .zero, // zaruri hai gradient poora cover kare
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: AppColors.gradientColors,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50,
                                child: loading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Send Reset Email",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    // Bottom: Already have an account?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'SignIn',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
