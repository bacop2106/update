import 'package:flutter/material.dart';
import 'package:untitled2/model/answer.dart';
import 'package:untitled2/model/category.dart';
import 'package:untitled2/model/question.dart';
import 'package:untitled2/model/quiz.dart';
import 'package:untitled2/screen/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appData = await getApplicationDocumentsDirectory();
  Hive.init(appData.path);
  Hive.registerAdapter(AnswerAdapter());
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(QuizAdapter());
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
      // home: const HomeScreen(),
    );
  }
}
