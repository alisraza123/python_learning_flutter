import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:learnpythonapp/screens/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import '../models/topic_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentDetailScreen extends StatefulWidget {
  final String topicId;
  final SubContent sub;

  const ContentDetailScreen({
    super.key,
    required this.topicId,
    required this.sub,
  });

  @override
  State<ContentDetailScreen> createState() => _ContentDetailScreenState();
}

class _ContentDetailScreenState extends State<ContentDetailScreen> {
  int currentIndex = 0;

  void _nextChunk() {
    if (currentIndex < widget.sub.paragraphs.length - 1) {
      setState(() => currentIndex++);
    } else {
      toastification.show(
        type: ToastificationType.success,
        title: const Text('End of Content'),
        autoCloseDuration: const Duration(seconds: 2),
      );
    }
  }
 
  String? videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=Y8Tko2YC5hA&pp=ygUTcHl0aG9uIGludHJvIHZpZGVvIA%3D%3D");

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProgressProvider>(context);
    final completed = provider.isContentCompleted(widget.sub.id);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(widget.sub.title),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              Container(
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: 'Y8Tko2YC5hA', // Aapka YouTube video ID
                    flags: YoutubePlayerFlags(autoPlay: false, mute: false),
                  ),
                ),
              ),
              Expanded(
                child: widget.sub.type == 'program'
                    ? SyntaxView(
                        code: widget.sub.paragraphs.join('\n\n'),
                        syntax: Syntax.PYTHON,
                        syntaxTheme: isDark
                            ? SyntaxTheme.vscodeDark().copyWith(
                                backgroundColor: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                              )
                            : SyntaxTheme.vscodeLight().copyWith(
                                backgroundColor: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                              ),
                        withLinesCount: true,
                        fontSize: 18.0,
                        expanded: true,
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(currentIndex + 1, (i) {
                            String paragraph = widget.sub.paragraphs[i];

                            // Bold until colon if colon exists
                            List<TextSpan> spans = [];
                            if (paragraph.contains(':')) {
                              int colonIndex = paragraph.indexOf(':') + 1;
                              spans.add(
                                TextSpan(
                                  text: paragraph.substring(0, colonIndex),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                              spans.add(
                                TextSpan(
                                  text: paragraph.substring(colonIndex),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              );
                            } else {
                              spans.add(
                                TextSpan(
                                  text: paragraph,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              );
                            }

                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey[850]
                                    : Colors.grey[100],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16, // smaller font
                                    height: 1.5,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                  children: spans,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
              ),

              // Buttons
              const SizedBox(height: 8),
              Row(
                children: [
                  // ➤ Next / Finished Button
                  Container(
                    decoration: BoxDecoration(
                      gradient:
                          (currentIndex < widget.sub.paragraphs.length - 1)
                          ? LinearGradient(colors: AppColors.gradientColors)
                          : null,
                      color: (currentIndex >= widget.sub.paragraphs.length - 1)
                          ? Colors.grey[500]
                          : null,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: currentIndex < widget.sub.paragraphs.length - 1
                          ? _nextChunk
                          : null,
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        currentIndex < widget.sub.paragraphs.length - 1
                            ? 'Next'
                            : 'Finished',
                        style: const TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ➤ Mark as Completed Button
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: !completed
                            ? LinearGradient(colors: AppColors.gradientColors)
                            : null,
                        color: completed ? Colors.grey[500] : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: completed
                            ? null
                            : () {
                                provider.markContentCompleted(widget.sub.id);
                                toastification.show(
                                  title: const Text(
                                    'Content Completed Successfully',
                                  ),
                                  autoCloseDuration: const Duration(seconds: 2),
                                );
                                setState(() {});
                                Navigator.pop(context);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          completed ? 'Completed' : 'Mark as Completed',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
