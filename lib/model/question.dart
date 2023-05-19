import 'dart:convert';

import 'answer.dart';
import 'category.dart';

class Question {
  int? id;
  String? content;
  List<Answer> answers;
  Question({
    required this.id,
    required this.content,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      content: map['content'] as String,
      answers: List<Answer>.from(
        map['answers'].map(
          (e) => Answer.fromMap(e as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
