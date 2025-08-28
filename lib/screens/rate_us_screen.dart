import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:toastification/toastification.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({super.key});

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  double _rating = 0.0;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> submitFeedback() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      toastification.show(
        type: ToastificationType.error,
        title: const Text("You must be logged in to submit feedback."),
        autoCloseDuration: const Duration(seconds: 2),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    String todayDate =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

    try {
      Map<String, dynamic> feedbackData = {
        'comment': _feedbackController.text.trim(),
        'rating': _rating,
        'timestamp': todayDate, // only date
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'feedback': FieldValue.arrayUnion([feedbackData])
      }, SetOptions(merge: true));

      toastification.show(
        type: ToastificationType.success,
        title: const Text('Thanks for your feedback!'),
        autoCloseDuration: const Duration(seconds: 2),
      );

      _feedbackController.clear();
      setState(() {
        _rating = 0.0;
      });
    } catch (e) {
      toastification.show(
        type: ToastificationType.error,
        title: const Text('Failed to submit feedback!'),
        autoCloseDuration: const Duration(seconds: 2),
      );
      debugPrint('Error submitting feedback: $e');
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        title: Text(
          'Rate Us',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ⭐ Smooth Gradient Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  double starValue = index + 1.0;
                  return GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      RenderBox box =
                          context.findRenderObject() as RenderBox;
                      var localPosition =
                          box.globalToLocal(details.globalPosition);
                      double newRating =
                          (localPosition.dx / (box.size.width / 5));
                      newRating = newRating.clamp(0.0, 5.0);
                      setState(() {
                        _rating = (newRating * 2).round() / 2;
                      });
                    },
                    onTapDown: (details) {
                      RenderBox box =
                          context.findRenderObject() as RenderBox;
                      var localPosition =
                          box.globalToLocal(details.globalPosition);
                      double newRating =
                          (localPosition.dx / (box.size.width / 5));
                      newRating = newRating.clamp(0.0, 5.0);
                      setState(() {
                        _rating = (newRating * 2).round() / 2;
                      });
                    },
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                          begin: 0,
                          end: _rating >= starValue
                              ? 1
                              : (_rating >= starValue - 0.5 ? 0.5 : 0)),
                      duration: const Duration(milliseconds: 400),
                      builder: (context, value, child) {
                        return ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: AppColors.gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Icon(
                            value == 1
                                ? Icons.star
                                : value == 0.5
                                    ? Icons.star_half
                                    : Icons.star_border,
                            color: Colors.white,
                            size: 48,
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Text(
                'Rating: $_rating',
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 32),

              // Feedback Text Field
              TextField(
                controller: _feedbackController,
                minLines: 3,
                maxLines: 5,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintText: 'Write your feedback here...',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: isDark ? Colors.grey[900] : Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Submit Button
              GestureDetector(
                onTap: _isSubmitting ? null : submitFeedback,
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: AppColors.gradientColors),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: _isSubmitting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Submit Feedback',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
