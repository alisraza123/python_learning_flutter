import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String tag;
  final Color tagColor;
  final String? backgroundImage;
  final VoidCallback? onTap;  // Add optional onTap callback

  const CourseCard({
    super.key,
    required this.title,
    required this.tag,
    required this.tagColor,
    this.backgroundImage,
    this.onTap,  // constructor param
  });

  @override
  Widget build(BuildContext context) {
        final height=MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,  // call onTap when card tapped
      child: Container(
        height: height*0.4
        ,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: tagColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
