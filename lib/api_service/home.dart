import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/quiz.dart';

class HttpService {
  static const String url =
      'https://quiz-prod.techlead.vn/services/quizservices/api/v1/quiz?categoryId=3';

  static List<Quiz> parsePost(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Quiz> posts = list.map((model) => Quiz.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Quiz>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var a = jsonDecode(response.body);
      List l = a['quiz'];

      List<Quiz> listPost = List<Quiz>.from(l.map((e) => Quiz.fromJson(e)));
      return listPost;
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('HHHHH');
    }
  }
}
