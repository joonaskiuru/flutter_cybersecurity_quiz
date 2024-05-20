final class Question {
  final int id;
  final String question;
  final List<String> options;
  final int answerIndex;

  const Question(
      {required this.id,
      required this.question,
      required this.options,
      required this.answerIndex});

  factory Question.fromJson(Map<String, dynamic> jsonData) {
    return Question(
        id: jsonData['id'] as int,
        question: jsonData['question'] as String,
        options: List<String>.from(jsonData['options']),
        answerIndex: jsonData['answerIndex'] as int);
  }
}
