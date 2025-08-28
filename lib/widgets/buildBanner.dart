import 'package:flutter/material.dart';

Widget buildBanner(Map<String, dynamic> banner, bool isDarkMode) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(banner['image']), // asset image lagayi
        fit: BoxFit.cover,
      ),
    ),
    padding: const EdgeInsets.all(0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(
          0.4,
        ), // halki si overlay for text readability
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  banner['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  banner['description'],
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
