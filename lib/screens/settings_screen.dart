import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart'; // make sure this exists

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Settings"),
        
        elevation: 1, // lower elevation
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTile(
              context,
              icon: Icons.info_outline,
              title: "About / Support",
              subtitle: "Learn more about the app",
              onTap: () {},
            ),
            _buildTile(
              context,
              icon: Icons.verified,
              title: "App Version",
              subtitle: "Version 1.0.0 (Build 1)",
            ),
            _buildTile(
              context,
              icon: Icons.mail_outline,
              title: "Contact Support",
              subtitle: "support@yourapp.com",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Email: support@yourapp.com")),
                );
              },
            ),
            _buildTile(
              context,
              icon: Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Privacy Policy link clicked")),
                );
              },
            ),
            _buildTile(
              context,
              icon: Icons.article_outlined,
              title: "Terms of Service",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Terms of Service link clicked")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      color: isDark ? Colors.grey[800] : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1, // lower elevation
      child: ListTile(
        leading: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
