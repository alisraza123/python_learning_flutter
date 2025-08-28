import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:toastification/toastification.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  // ===== Fetch Current Name =====
  static Future<String> changeName() async {
    final auth = FirebaseAuth.instance;
    String oldName = '';
    if (auth.currentUser != null) {
      String uid = auth.currentUser!.uid;
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final snapshot = await userDoc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        oldName = data['name'] ?? '';
      }
    }
    return oldName;
  }

  static Future<String> showName() async {
    final auth = FirebaseAuth.instance;
    String userName = '';
    if (auth.currentUser != null) {
      String uid = auth.currentUser!.uid;
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final snapshot = await userDoc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        userName = data['name'] ?? '';
      }
    }
    return userName;
  }

  static Future<String> showEmail() async {
    final auth = FirebaseAuth.instance;
    String userEmail = '';
    if (auth.currentUser != null) {
      String uid = auth.currentUser!.uid;
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final snapshot = await userDoc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        userEmail = data['email'] ?? '';
      }
    }
    return userEmail;
  }

  static Future<String> displayProfileImage() async {
    final auth = FirebaseAuth.instance;
    String profileImage = '';
    if (auth.currentUser != null) {
      String uid = auth.currentUser!.uid;
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final snapshot = await userDoc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        profileImage = data['profileImage'] ?? '';
      }
    }
    return profileImage;
  }

  static Widget _buildInfoTile(String title, Future<String> value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          FutureBuilder<String>(
            future: value,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? '',
                style: const TextStyle(fontSize: 15),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget _buildActionTile(
    BuildContext context,
    IconData icon,
    String title,
    Function onUpdate,
  ) {
    return InkWell(
      onTap: () async {
        if (title == "Change Name") {
          String oldName = await ProfileScreen.changeName();
          _showChangeNameDialog(context, oldName, onUpdate);
        } else if (title == "Password") {
          _showChangePasswordDialog(context);
        } else {}
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(icon, size: 30, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // ===== Dialog for Change Name =====
  static void _showChangeNameDialog(
    BuildContext context,
    String oldName,
    Function onUpdate,
  ) {
    final oldController = TextEditingController(text: oldName);
    final newController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Change Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: oldController,
                decoration: const InputDecoration(labelText: "Old Name"),
                readOnly: true,
              ),
              TextField(
                controller: newController,
                decoration: const InputDecoration(labelText: "New Name"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      if (newController.text.trim().length < 3) {
                        toastification.show(
                          type: ToastificationType.success,
                          title: Text("New name must be at least 3 characters"),
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                      } else {
                        final auth = FirebaseAuth.instance;
                        final uid = auth.currentUser!.uid;
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .update({'name': newController.text.trim()});

                        toastification.show(
                          type: ToastificationType.success,
                          title: Text(
                            "Name changed to ${newController.text.trim()}",
                          ),
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                        Navigator.pop(context);

                        await onUpdate(newController.text.trim()); // update UI
                      }
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _showChangePasswordDialog(BuildContext context) {
    final pass1 = TextEditingController();
    final pass2 = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Change Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: pass1,
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
              ),
              TextField(
                controller: pass2,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Retype Password"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      if (pass1.text != pass2.text) {
                        toastification.show(
                          title: const Text('Passwords do not match'),
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                      } else {
                        final user = FirebaseAuth.instance.currentUser!;
                        await user.updatePassword(pass2.text);
                        toastification.show(
                          title: const Text('Password updated successfully'),
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;
  Future<String> userName = ProfileScreen.showName();
  Future<String> userEmail = ProfileScreen.showEmail();
  Future<String> profileImage = ProfileScreen.displayProfileImage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile"), elevation: 0),
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              Column(
                children: [
                  FutureBuilder<String>(
                    future: profileImage,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircleAvatar(
                          radius: 50,
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(snapshot.data!),
                        );
                      } else {
                        return const CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person, size: 50),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 100),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        ProfileScreen._buildInfoTile("Name", userName),

                        ProfileScreen._buildInfoTile("Email", userEmail),
                        const SizedBox(height: 20),
                        ProfileScreen._buildActionTile(
                          context,
                          Icons.person,
                          "Change Name",
                          (newName) {
                            setState(() {
                              userName = ProfileScreen.showName();
                            });
                          },
                        ),
                        ProfileScreen._buildActionTile(
                          context,
                          Icons.lock,
                          "Password",
                          (_) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
