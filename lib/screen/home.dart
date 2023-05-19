import 'package:flutter/material.dart';
import 'package:untitled2/screen/play.dart';

import '../api_service/home.dart';
import '../api_service/play.dart';
import '../model/question.dart';
import '../model/quiz.dart';
import 'drawer.dart';
import 'info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreenPage(),
      drawer: const DrawerSelect(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF11b8da),
        centerTitle: true,
        title: const Text("Level 1"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
              icon: const Icon(Icons.info))
        ],
      ),
    );
  }
}

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  List<Quiz> postData = [];
  List<Question> questionData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpService.fetchPosts().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SizedBox(
            height: 800,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SizedBox(
                    child: GestureDetector(
                  onTap: () async {
                    questionData = await HttpService1.fetchPosts();
                    print(questionData);
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayScreenPage(
                                  listQues: questionData,
                                )));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Stack(
                              children: <Widget>[
                                ClipOval(
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      color: const Color(0xFF11b8da),
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 240,
                              child: Text(
                                "${postData[index].name}",
                                style: const TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.download,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ));
              },
              itemCount: postData.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ],
    ));
  }
}
