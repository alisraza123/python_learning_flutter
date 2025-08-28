import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final double progress;
  final VoidCallback onTap;
  final String title;
  final String backgroundImagePath;

  const ProgressCard({
    super.key,
    required this.progress,
    required this.onTap,
    required this.title,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // Background Image
            Ink.image(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
              height: 180,
              child: Container(),
            ),

            // Gradient Overlay
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),

            // Text + Progress
            Positioned(
              left: 16,
              bottom: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.white24,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 183, 75, 255)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${(progress * 100).toInt()}% completed',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
