class Topic {
  final String id;
  final String title;
  final String description;
  final List<SubContent> contents;
  final List<Map<String, dynamic>> quizQuestions; // Add this line

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.contents,
    required this.quizQuestions, // Add this to constructor
  });
}

class SubContent {
  final String id;
  final String title;
  final String type; // 'explanation' or 'program'
  final List<String> paragraphs;

  SubContent({
    required this.id,
    required this.title,
    required this.type,
    required this.paragraphs,
  });
}
