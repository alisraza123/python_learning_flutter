import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getuserNameFromEmail() async {
  final auth = FirebaseAuth.instance;
  String? email = auth.currentUser?.email ?? 'Guest';
  String userName = "";
  if (email != 'Guest') {
    int atIndex = email.indexOf('@');

    String localPart = atIndex != -1 ? email.substring(0, atIndex) : email;

    // Check if localPart contains any number
    RegExp numberRegExp = RegExp(r'\d');

    // Find index of first number
    Match? match = numberRegExp.firstMatch(localPart);

    if (match != null) {
      // Number found in localPart
      int numberIndex = match.start;

      // If number is at the start, show only the part after the number
      if (numberIndex == 0) {
        userName = localPart.substring(
          1,
        ); // or keep as is, depending on your need
      } else {
        // Show everything before the first number
        userName = localPart.substring(0, numberIndex);
      }
    } else {
      // No number found, show entire localPart
      userName = localPart;
    }
  } else {
    userName = 'Guest';
  }
  return userName;
}

Future<String> getuserEmail() async {
  final auth = FirebaseAuth.instance;
  String? email = auth.currentUser?.email ?? 'Guest';
  return email;
}

Future<String> getUserName() async {
  try {
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;

    if (uid == null) return 'Guest';

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (doc.exists) {
      final data = doc.data();
      if (data != null && data.containsKey('name') && data['name'] is String) {
        return data['name'];
      }
    }

    return 'Guest';
  } catch (e) {
    print('Error fetching user name: $e');
    return 'Guest';
  }
}
