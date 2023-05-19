import 'dart:convert';

import 'package:untitled2/api_service/api_service.dart';
import 'package:untitled2/global/constant.dart';
import 'package:untitled2/model/quiz.dart';

import '../model/category.dart';

class Database {
  Future<void> creatDatabase() async {
    await ApiService().getAPI(base + categoryUrl, categoryUrl).then((value) {
      print(value.toString());
      var map = jsonDecode(value.toString());
      List l = map['categories'];
      List<Category> categoryList =
          List<Category>.from(l.map((e) => Category.fromJson(e)));
    });
    for (int i =3;i<9;i++) {
      await ApiService().getAPI('$base$quizUrl$i', '$quizUrl$i').then((value){
        var map = jsonDecode(value.toString());
        List l = map['quiz'];
        List<Quiz> quizList = List<Quiz>.from(l.map((e) => Quiz.fromJson(e)));
      });
    }
  }
}
