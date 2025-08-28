import 'package:flutter/material.dart';
import 'package:learnpythonapp/screens/learningscreen.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:learnpythonapp/screens/providers/theme_provider.dart';
import 'package:learnpythonapp/widgets/progress_card.dart';
import 'package:provider/provider.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);
    final double progress = progressProvider.overallCourseProgress();
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode
          ? Theme.of(context)
                .scaffoldBackgroundColor // dark mode ka background
          : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ProgressCard(
          title: 'Python Learning',
          progress: progress,
          backgroundImagePath: 'assets/pythonCard.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LearningScreen()),
            );
          },
        ),
      ),
    );
  }
}
