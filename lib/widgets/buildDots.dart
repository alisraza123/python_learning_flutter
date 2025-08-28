import 'package:flutter/material.dart';

Widget buildDots(
  List<Map<String, dynamic>> banners,
  bool isDarkMode,
  int currentPage,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      banners.length,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: currentPage == index ? 14 : 8,
        height: currentPage == index ? 14 : 8,
        decoration: BoxDecoration(
          color: currentPage == index
              ? (isDarkMode ? Colors.deepPurpleAccent : Colors.blue)
              : (isDarkMode ? Colors.grey.shade700 : Colors.grey),
          shape: BoxShape.circle,
        ),
      ),
    ),
  );
}
