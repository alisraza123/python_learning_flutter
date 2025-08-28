import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnpythonapp/screens/providers/progress_provider.dart';
import 'package:provider/provider.dart';
import '../data/python_topics.dart';
import '../widgets/topic_card.dart';
import '../models/topic_model.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  bool isTopicComplete(int index, ProgressProvider provider) {
    final Topic t = pythonTopics[index];
    for (final sub in t.contents) {
      if (!provider.isContentCompleted(sub.id)) return false;
    }
    return true;
  }

  double topicProgress(int index, ProgressProvider provider) {
    final Topic t = pythonTopics[index];
    if (t.contents.isEmpty) return 0.0;
    int done = 0;
    for (final sub in t.contents) {
      if (provider.isContentCompleted(sub.id)) done++;
    }
    return done / t.contents.length;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProgressProvider>(context);

    if (provider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final auth = FirebaseAuth.instance;
    bool isLoggedIn = false;
    isLoggedIn = auth.currentUser != null ? true : false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Python Learning')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ListView.builder(
            itemCount: pythonTopics.length,
            itemBuilder: (context, index) {
              final topic = pythonTopics[index];
              final locked = provider.isTopicLocked(
                index,
                (prevIndex) => isTopicComplete(prevIndex, provider),
              );
              final progress = topicProgress(index, provider);

              final quizCompleted = provider.isQuizCompleted(topic.id);
              final quizScore = provider.getQuizScore(topic.id);

              bool shouldRestrict = !isLoggedIn && index > 2;

              return TopicCard(
                topic: topic,
                index: index,
                locked: locked,
                progress: progress,
                quizCompleted: quizCompleted,
                quizScore: quizScore,
                isRestricted: shouldRestrict,
                isLoggedIn: isLoggedIn, // ✅ Pass login state to TopicCard
              );
            },
          ),
        ),
      ),
    );
  }
}