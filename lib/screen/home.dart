import 'package:flutter/material.dart';
import 'package:untitled2/data/database.dart';
import 'package:untitled2/global/constant.dart';
import 'package:untitled2/screen/play.dart';
import '../model/category.dart' as category;
import '../model/question.dart';
import '../model/quiz.dart';
import 'info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int categoryID = 3;
  List<category.Category> categoryList =
      List.from(Database().loadData(categoryDB));
  List<Quiz> quizList = [];
  List<Question> questionsList = [];
  String name = Database().loadData(nameDB);
  final TextEditingController nameController = TextEditingController();
  bool isEmpty = false;
  List<bool> isLoading = [];
  @override
  void initState() {
    quizList = List.from(Database().loadData('$quizDB$categoryID'));
    isLoading = List.generate(quizList.length, (index) => false);
    nameController.text = name;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  String title = "level 1";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: const DrawerSelect(),
        appBar: AppBar(
          backgroundColor: const Color(0xFF11b8da),
          centerTitle: true,
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                },
                icon: const Icon(Icons.info))
          ],
        ),
        body: _body(),
        drawer: sideBar(context),
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: quizList.length,
      itemBuilder: (context, index) {
        Quiz quiz = quizList.elementAt(index);
        return ListTile(
            onTap: () {
              if (Database().loadData('$questionsDB${quiz.id}') != null) {
                questionsList =
                    List.from(Database().loadData('$questionsDB${quiz.id}'));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlayScreenPage(
                          quiz: quiz,
                          listQuestions: questionsList,
                        )));
              } else {
                return;
              }
            },
            contentPadding: const EdgeInsets.all(8),
            leading: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF11b8da),
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            title: Text(
              quizList.elementAt(index).name,
              style: const TextStyle(fontSize: 20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Database().loadData('$questionsDB${quiz.id}') == null
                ? !isLoading[index]
                    ? IconButton(
                        onPressed: () async {
                          setState(() {
                            isLoading[index] = !isLoading[index];
                          });
                          await Database().getQuestionByQuizId(quiz.id);
                          setState(() {
                            questionsList =
                                Database().loadData('$questionsDB${quiz.id}');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlayScreenPage(
                                      quiz: quiz,
                                      listQuestions: questionsList,
                                    )));
                          });
                        },
                        icon: const Icon(
                          Icons.download,
                          color: Colors.grey,
                        ))
                    : const SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                        )))
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        '${Database().loadData('$scoreDB${quiz.id}')}/${Database().loadData('count${quiz.id}').toString()}'),
                  ));
      },
    );
  }

  Drawer sideBar(BuildContext context) {
    return Drawer(
      child: Stack(children: [
        Image.asset(
          "assets/images/drawer_background.png",
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            AppBar(
              centerTitle: true,
              leadingWidth: 50,
              //avatar
              leading: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/icon.png'))),
              ),
              title: const Text(
                "Anonymous",
                style: TextStyle(color: Colors.white),
              ),
              actions: const [Icon(Icons.draw)],
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        title = categoryList.elementAt(index).name;
                        categoryID = categoryList.elementAt(index).id;
                        quizList = List.from(
                            Database().loadData('$quizDB$categoryID'));
                      });
                      Navigator.pop(context);
                    },
                    title:
                        DrawerItem(title: categoryList.elementAt(index).name),
                  );
                },
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class DrawerItem extends StatelessWidget {
  String title;

  DrawerItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.library_books_rounded,
          color: Colors.white,
          size: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: Colors.white,
          size: 25,
        )
      ],
    );
  }
}
