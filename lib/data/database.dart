import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:untitled2/global/constant.dart';
import 'package:untitled2/model/answer.dart';
import 'package:untitled2/model/question.dart';
import 'package:untitled2/model/quiz.dart';

import '../api_service/apiservice.dart';
import '../model/category.dart';

final myBox = Hive.box('myBox');

class Database {
  Future<void> createDatabase() async {
    await ApiService().getAPI(baseURL + categoryURL, categoryURL).then((value) {
      print(value.toString());
      var map = jsonDecode(value.toString());
      List l = map['categories'];
      // print(l);
      List<Category> categoryList =
          List<Category>.from(l.map((e) => Category.fromMap(e)));
      myBox.put(categoryDB, categoryList);
    });
    for (int i = 3; i < 9; i++) {
      await ApiService()
          .getAPI('$baseURL$quizURL$i', '$quizURL$i')
          .then((value) {
        var map = jsonDecode(value.toString());
        List l = map['quiz'];

        List<Quiz> listQuiz = List<Quiz>.from(l.map((e) => Quiz.fromMap(e)));
        myBox.put('$quizDB$i', listQuiz);
      });
    }
    myBox.put(nameDB, 'Anonymous');
  }

  Future<void> getQuestionByQuizId(int id) async {
    await ApiService()
        .getAPI('$baseURL$questionsURL&id', '$questionsURL$id')
        .then((value) {
      var map = jsonDecode(value.toString());
      var count = map['count'];
      myBox.put('count$id', count);
      List l = map['questions'];
      List<Question> questionsList =
          List<Question>.from(l.map((e) => Question.fromMap(e)));
      myBox.put('$questionsDB$id', questionsList);
      updateHighScore(id, 0);
    });
  }

  updateHighScore(int quizId, int score) {
    myBox.put('$scoreDB$quizId', score);
  }

  updateAnswerByQuestions(Question question, Answer? answer) {
    myBox.put('${question.id}', answer);
  }

  updateName(String name) {
    myBox.put(nameDB, name);
  }

  loadData(String nameDB) {
    return myBox.get(nameDB);
  }
}
