import 'package:flutter/material.dart';
import 'package:learnpythonapp/colors/app_colors.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  final String topicId;
  final String topicTitle;
  final List<Map<String, dynamic>> quizQuestions;

  const QuizScreen({
    super.key,
    required this.topicId,
    required this.topicTitle,
    required this.quizQuestions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Map<String, dynamic>> questions;
  final Map<int, int?> userAnswers = {};
  bool quizSubmitted = false;
  int? finalScore;

  @override
  void initState() {
    super.initState();
    questions = widget.quizQuestions;
  }

  void submitQuiz() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i]['correct']) {
        score++;
      }
    }

    Provider.of<ProgressProvider>(context, listen: false)
        .saveQuizScore(widget.topicId, score);

    setState(() {
      finalScore = score;
      quizSubmitted = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You scored $score out of ${questions.length}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              '(${(score / questions.length * 100).toStringAsFixed(1)}%)',
              style: TextStyle(
                  fontSize: 16,
                  color: score / questions.length > 0.6
                      ? Colors.green
                      : Colors.red),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    Color cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(title: Text('Quiz: ${widget.topicTitle}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final isCorrect =
                        quizSubmitted && userAnswers[index] == question['correct'];
        
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      color: quizSubmitted
                          ? (isCorrect ? Colors.green[50] : Colors.red[50])
                          : cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${index + 1}. ${question['question']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: quizSubmitted
                                        ? Colors.black
                                        : (isDarkMode ? Colors.white : Colors.black))),
                            const SizedBox(height: 8),
                            ...List.generate(question['options'].length,
                                (optionIndex) {
                              return RadioListTile<int>(
                                title: Text(
                                  question['options'][optionIndex],
                                  style: TextStyle(
                                      color: quizSubmitted
                                          ? Colors.black
                                          : (isDarkMode ? Colors.white : Colors.black)),
                                ),
                                value: optionIndex,
                                groupValue: userAnswers[index],
                                onChanged: quizSubmitted
                                    ? null
                                    : (value) {
                                        setState(() {
                                          userAnswers[index] = value;
                                        });
                                      },
                                activeColor: quizSubmitted
                                    ? (optionIndex == question['correct']
                                        ? Colors.green
                                        : Colors.red)
                                    : Theme.of(context).colorScheme.primary,
                              );
                            }),
                            if (quizSubmitted)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  isCorrect
                                      ? 'Correct!'
                                      : 'Correct answer: ${question['options'][question['correct']]}',
                                  style: TextStyle(
                                    color: isCorrect ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (!quizSubmitted)
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: AppColors.gradientColors),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: userAnswers.length == questions.length
                        ? submitQuiz
                        : null,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.green),
                    child: const Text(
                      'Submit Quiz',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              if (quizSubmitted)
                Column(
                  children: [
                    Text('Final Score: $finalScore/${questions.length}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFea67e7).withOpacity(0.8),
                            const Color(0xFF7f4bde).withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text('Back to Topics',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
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
