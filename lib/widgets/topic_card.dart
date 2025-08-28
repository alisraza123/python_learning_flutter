import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:toastification/toastification.dart';
import '../models/topic_model.dart';
import '../screens/content_detail_screen.dart';
import '../screens/quiz_screen.dart';
import 'simple_progress_bar.dart';

class TopicCard extends StatefulWidget {
  final Topic topic;
  final int index;
  final bool locked;
  final double progress;
  final bool quizCompleted;
  final int? quizScore;

  /// ✅ NEW: Restrict based on login status
  final bool isRestricted;

  const TopicCard({
    super.key,
    required this.topic,
    required this.index,
    required this.locked,
    required this.progress,
    this.quizCompleted = false,
    this.quizScore,
    this.isRestricted = false,
  });

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  bool expanded = false;

  void _showLoginMessage(BuildContext context) {
    toastification.show(
      title: const Text('Signup to unlock full content.'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color cardColor = theme.brightness == Brightness.light
        ? Colors.white
        : Colors.grey[800]!;

    return Opacity(
      opacity: 1,
      child: Card(
        color: cardColor,
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: expanded ? 4 : 2,
        child: Column(
          children: [
            // -----> Header Tile
            ListTile(
              onTap: () {
                if (widget.isRestricted) {
                  _showLoginMessage(context);
                  return;
                }

                if (!widget.locked) {
                  setState(() => expanded = !expanded);
                }
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  widget.index % 2 == 0 ? Icons.code : Icons.school,
                  color: Colors.white,
                ),
              ),
              title: Text(
                widget.topic.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.topic.description),
                  const SizedBox(height: 8),
                  SimpleProgressBar(value: widget.progress),

                  if (widget.quizCompleted && widget.quizScore != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Quiz Score: ${widget.quizScore}/${widget.topic.quizQuestions.length}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                  const SizedBox(height: 6),
                  Text('${(widget.progress * 100).toInt()}%'),
                ],
              ),
            ),

            // -----> Expanded Content
            if (expanded && !widget.locked && !widget.isRestricted)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    // SubContents list
                    ...widget.topic.contents.map((c) {
                      IconData icon = c.type == 'program'
                          ? Icons.code
                          : (c.type == 'quiz' ? Icons.quiz : Icons.article);

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFFea67e7), Color(0xFF7f4bde)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Icon(icon, color: Colors.white, size: 18),
                        ),
                        title: Text(c.title),
                        onTap: () {
                          if (widget.isRestricted) {
                            _showLoginMessage(context);
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ContentDetailScreen(
                                topicId: widget.topic.id,
                                sub: c,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    const SizedBox(height: 12),

                    // ✅ QUIZ BUTTON (always at bottom)
                    if (widget.topic.quizQuestions.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppColors.gradientColors,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (widget.isRestricted) {
                                  _showLoginMessage(context);
                                  return;
                                }

                                if (widget.quizCompleted) {
                                   toastification.show(
                                  title: const Text(
                                    "You already completed this quiz 🎉",
                                  ),
                                  autoCloseDuration: const Duration(seconds: 3),
                                  type: ToastificationType.info,
                                );
                                 
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => QuizScreen(
                                        topicId: widget.topic.id,
                                        topicTitle: widget.topic.title,
                                        quizQuestions:
                                            widget.topic.quizQuestions,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              icon: const Icon(Icons.quiz, color: Colors.white),
                              label: const Text(
                                "Take Quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
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
