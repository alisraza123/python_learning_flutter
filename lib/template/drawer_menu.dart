import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/auth/login_screen.dart';
import 'package:learnpythonapp/auth/singup_screen.dart';
import 'package:learnpythonapp/auth/username.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/profile_edit_screen.dart';
import 'package:learnpythonapp/screens/certificate_screen.dart';
import 'package:learnpythonapp/screens/profile_upload_screen.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:learnpythonapp/screens/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final List<Map<String, dynamic>> courseTopics; // Add course topics parameter

  DrawerMenu({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.courseTopics, // Add course topics parameter
  }) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final User? user = FirebaseAuth.instance.currentUser;
  bool circularProgress = false;
  Map<String, dynamic> userData = {}; // Store user data
  String packageName = '';
  Future<void> getPackage() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      packageName = info.packageName;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserEmail();
    getuserName();
    fetchUserData(); // Fetch user data
    getPackage();
  }

  String userName = "";
  String userEmail = "";

  void getuserName() async {
    String username = await getUserName();
    setState(() {
      userName = username;
    });
  }

  void getUserEmail() async {
    String fetchedEmail = await getuserEmail();
    setState(() {
      userEmail = fetchedEmail;
    });
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData() async {
    if (user == null) return;

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get();

      if (snapshot.exists) {
        setState(() {
          userData = snapshot.data() ?? {};
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<bool> isCourseCompleted(String userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get();

    if (snapshot.exists) {
      return snapshot.data()?['courseCompleted'] == true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (circularProgress) {
      // Jab loading true ho, to full screen center me indicator dikhao
      return Center(child: CircularProgressIndicator(color: Colors.white));
    }
    // Get scaffold background color from current theme for drawer background
    final drawerBgColor = Theme.of(context).scaffoldBackgroundColor;
    return SafeArea(
      child: Drawer(
        child: Container(
          color: drawerBgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (!snapshot.hasData || !snapshot.data!.exists) {
                            return const Icon(Icons.person, size: 30);
                          }

                          var userData =
                              snapshot.data!.data() as Map<String, dynamic>;
                          String? imageUrl = userData["profileImage"];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileUploadScreen(),
                                ),
                              );
                            },
                            child: imageUrl == null
                                ? const Icon(Icons.person, size: 30)
                                : ClipOval(
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userEmail,
                      style: TextStyle(
                        color: Colors.white.withAlpha(150),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              user != null
                  ? ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );

                        // Add navigation to Settings screen
                      },
                    )
                  : const SizedBox.shrink(),
              user != null
                  ? ListTile(
                      leading: const Icon(Icons.verified),
                      title: const Text('Get Certificate'),
                      onTap: () async {
                        final user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FutureBuilder<bool>(
                                future: isCourseCompleted(
                                  user.uid,
                                ), // Future<bool> call
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text("Error: ${snapshot.error}"),
                                    );
                                  } else if (snapshot.hasData) {
                                    return CertificateScreen(
                                      isCourseCompleted: snapshot.data!,
                                    );
                                  } else {
                                    return Center(child: Text("No data found"));
                                  }
                                },
                              ),
                            ),
                          );
                        } else {
                          toastification.show(
                            title: const Text('User not logged in'),
                            autoCloseDuration: const Duration(seconds: 2),
                            type: ToastificationType.info,
                            style: ToastificationStyle.flat,
                            alignment: Alignment.topCenter,
                          );
                        }

                        // Add navigation to Settings screen
                      },
                    )
                  : SizedBox(width: 0),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );

                  // Add navigation to Settings screen
                },
              ),

              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Rate Us'),
                onTap: () async {
                  final url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=$packageName',
                  );

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    // Fallback if URL cannot be launched
                    debugPrint('Could not launch $url');
                  }
                },
              ),

              const Divider(),

              user != null
                  ? ListTile(
                      leading: const Icon(Icons.login),
                      title: const Text('Log Out'),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();

                        // ✅ Clear local app state if using Provider
                        final progressProvider = Provider.of<ProgressProvider>(
                          context,
                          listen: false,
                        );
                        progressProvider
                            .resetProgress(); // <-- Create this method to clear all progress

                        // ✅ Navigate and clear stack
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                    )
                  : ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Sign Up'),
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                    ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'App Mode',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              ListTile(
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: widget.isDarkMode,
                  onChanged: (bool value) {
                    widget.onThemeChanged(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
