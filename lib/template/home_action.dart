import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeActionCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const HomeActionCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: isDarkMode? Colors.transparent :Colors.white,
            border: isDarkMode? Border.all(color: Colors.grey):null,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: AppColors.gradientColors, 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white, 
                ),
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:isDarkMode?Colors.white:Colors.black ,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
