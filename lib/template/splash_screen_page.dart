import 'package:flutter/material.dart';
// Reusable widget for each splash screen page
class SplashScreenPage extends StatelessWidget {
  final String title;
  final String description;
  final Alignment assetAlignment;
final String image;
  const SplashScreenPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.assetAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
       
          
        child: Stack(
          children: [
            // Top text content
            Positioned(
              top: mediaQuery.height * 0.08,
              left: mediaQuery.width * 0.05,
              right: mediaQuery.width * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 40),
                  Image.asset(image),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}