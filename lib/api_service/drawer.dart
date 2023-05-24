import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/category.dart';

class HttpService {
  static const String url =
      'https://quiz-prod.techlead.vn/services/quizservices/api/v1/categories?categoryName=English';
  static List<Category> parsePost(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Category> posts = list.map((e) => Category.fromMap(e)).toList();
    return posts;
  }

  static Future<List<Category>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var a = jsonDecode(response.body);
      List l = a['categories'];

      List<Category> listPost =
          List<Category>.from(l.map((e) => Category.fromMap(e)));
      return listPost;
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('HHHHH');
    }
  }
}
