import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnpythonapp/colors/app_colors.dart';

class ProfileUploadScreen extends StatefulWidget {
  const ProfileUploadScreen({super.key});

  @override
  State<ProfileUploadScreen> createState() => _ProfileUploadScreenState();
}

class _ProfileUploadScreenState extends State<ProfileUploadScreen> {
  File? _selectedImage;
  bool _loading = false;

  final _picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
    }
  }

  void _showPickerSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.blue),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.green),
                title: const Text("Take a Photo"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _uploadImage() async {
    if (_selectedImage == null) return;

    setState(() => _loading = true);

    // Cloudinary credentials
    final cloudName = 'dixilrnkq';
    final uploadPreset = 'alqcavzb';
    final folder = 'profiles';

    final url =
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

    final request = http.MultipartRequest('POST', url);
    request.files
        .add(await http.MultipartFile.fromPath('file', _selectedImage!.path));
    request.fields['upload_preset'] = uploadPreset;
    request.fields['folder'] = folder;

    final response = await request.send();

    if (response.statusCode == 200) {
      final res = await http.Response.fromStream(response);
      final data = json.decode(res.body);
      final imageUrl = data['secure_url'];

      // Store in Firebase
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set({'profileImage': imageUrl}, SetOptions(merge: true));

      Navigator.pop(context);
    } else {
      print('Upload failed: ${response.statusCode}');
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // AppBar style text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Upload Profile",
                    style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
        
                const Spacer(),
        
                // Profile Image
                _selectedImage == null
                    ? Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: const Icon(Icons.person,
                            size: 90, color: Colors.white),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(_selectedImage!),
                      ),
        
                const SizedBox(height: 30),
        
                // Select Image (BottomSheet)
                ElevatedButton(
                  onPressed: _showPickerSheet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text('Select Image'),
                ),
        
                const SizedBox(height: 20),
        
                // Upload Button
                _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : ElevatedButton(
                        onPressed: _uploadImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                        child: const Text('Upload'),
                      ),
        
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
