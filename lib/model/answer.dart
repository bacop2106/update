import 'dart:convert';

class Answer {
  int? id;
  String? content;
  int? correct;
  int? questionId;

  Answer({
    required this.id,
    required this.content,
    required this.correct,
    required this.questionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'correct': correct,
      'question_id': questionId,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      id: map['id'] as int,
      content: map['content'] as String,
      correct: map['correct'] as int,
      questionId: map['question_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());
  factory Answer.fromJson(String source) =>
      Answer.fromMap(json.decode(source) as Map<String, dynamic>);
}
