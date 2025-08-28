import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnpythonapp/auth/username.dart';
import 'package:learnpythonapp/data/python_topics.dart';

class ProgressProvider extends ChangeNotifier {
  final Set<String> _completedContents = {};
  final Map<String, int> _quizScores = {}; // topicId -> score
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProgressProvider() {
    // Load progress aur course completion check auto
    loadUserProgress();
  }


  // ------------------------
  // CONTENT FUNCTIONS
  // ------------------------

  bool isContentCompleted(String contentId) =>
      _completedContents.contains(contentId);

  Future<void> markContentCompleted(String contentId) async {
    if (_completedContents.contains(contentId)) return;

    _completedContents.add(contentId);
    notifyListeners();
    await _saveProgressToFirebase();
    await _checkAndMarkCourseCompleted(); // 👈 yahan se course complete check hoga
  }

  // ------------------------
  // TOPIC FUNCTIONS
  // ------------------------

  bool isTopicLocked(int index, bool Function(int prevIndex) isTopicComplete) {
    if (index == 0) return false;
    return !isTopicComplete(index - 1);
  }

  bool isTopicComplete(int topicIndex) {
    final topic = pythonTopics[topicIndex];
    for (final content in topic.contents) {
      if (!isContentCompleted(content.id)) return false;
    }
    return true;
  }

  double topicProgress(int topicIndex) {
    final topic = pythonTopics[topicIndex];
    if (topic.contents.isEmpty) return 0.0;
    int done = 0;
    for (final content in topic.contents) {
      if (isContentCompleted(content.id)) done++;
    }
    return done / topic.contents.length;
  }

  double overallCourseProgress() {
    if (pythonTopics.isEmpty) return 0.0;
    double totalProgress = 0;
    for (int i = 0; i < pythonTopics.length; i++) {
      totalProgress += topicProgress(i);
    }
    return totalProgress / pythonTopics.length;
  }

  // ------------------------
  // QUIZ FUNCTIONS
  // ------------------------

  bool isQuizCompleted(String topicId) {
    return _quizScores.containsKey(topicId);
  }

  int? getQuizScore(String topicId) {
    return _quizScores[topicId];
  }

  Future<void> saveQuizScore(String topicId, int score) async {
    _quizScores[topicId] = score;
    notifyListeners();
    await _saveProgressToFirebase();
    await _checkAndMarkCourseCompleted(); // 👈 quiz complete hone ke baad bhi check hoga
  }

  // ------------------------
  // FIREBASE FUNCTIONS
  // ------------------------

  Future<void> createUserDocIfNotExists() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final doc = await docRef.get();

    if (!doc.exists) {
      final String userName = await getuserNameFromEmail();
      await docRef.set({
        'name': userName,
        'email': user.email ?? '',
        'progress': {
          'completedContents': [],
          'quizScores': {},
        },
        'courseCompleted': false, // 👈 initially false
      });
    }
  }

  Future<void> loadUserProgress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      await createUserDocIfNotExists();

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final data = doc.data();
        if (data != null && data['progress'] != null) {
          // Load completed contents
          if (data['progress']['completedContents'] != null) {
            final List<dynamic> completed = data['progress']['completedContents'];
            _completedContents
              ..clear()
              ..addAll(completed.map((e) => e.toString()));
          }

          // Load quiz scores
          if (data['progress']['quizScores'] != null) {
            _quizScores.clear();
            final Map<String, dynamic> scores =
                Map<String, dynamic>.from(data['progress']['quizScores']);
            scores.forEach((key, value) {
              _quizScores[key] = value as int;
            });
          }
        }
      }

      // ✅ Course completion check after progress is loaded
      await _checkAndMarkCourseCompleted();

    } catch (e) {
      debugPrint('Error loading progress: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveProgressToFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': user.email ?? '',
        'progress': {
          'completedContents': _completedContents.toList(),
          'quizScores': _quizScores,
        },
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving progress: $e');
    }
  }

  // ------------------------
  // COURSE COMPLETION CHECK
  // ------------------------
  Future<void> _checkAndMarkCourseCompleted() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final firestore = FirebaseFirestore.instance;

  // 1️⃣ Total topics
  final totalTopics = pythonTopics.length;

  // 2️⃣ User ke attempted quizzes
  final attemptedQuizzes = _quizScores.keys.length;

  // 3️⃣ Overall content progress
  final contentProgress = overallCourseProgress(); // 0 to 1

  // 4️⃣ Check if course is completed
  if (contentProgress == 1.0 && attemptedQuizzes == totalTopics && totalTopics > 0) {
    await firestore.collection("users").doc(user.uid).set(
      {"courseCompleted": true},
      SetOptions(merge: true),
    );

    debugPrint("🎉 Course Completed Marked in Firebase");
  } else {
    debugPrint("⚠️ Abhi tak course complete nahi hua");
  }
}
void resetProgress() {
  _completedContents.clear();
  _quizScores.clear();
  notifyListeners();
}
}

