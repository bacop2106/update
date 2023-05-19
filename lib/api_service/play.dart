import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/question.dart';

class HttpService1 {
  static const String url =
      'https://quiz-prod.techlead.vn/services/quizservices/api/v1/questions?quizId=18';

  static List<Question> parsePost(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Question> posts =
        list.map((model) => Question.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Question>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var a = jsonDecode(response.body);
      List l = a['questions'];
      List<Question> playPost =
          List<Question>.from(l.map((e) => Question.fromMap(e)));
      return playPost;
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('HHHHH');
    }
  }
}
