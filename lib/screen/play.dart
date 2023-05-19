import 'package:flutter/material.dart';
import 'package:untitled2/screen/result.dart';

import '../model/answer.dart';
import '../model/question.dart';

class PlayScreenPage extends StatefulWidget {
  List<Question> listQues;
  // Post post;
  PlayScreenPage({
    Key? key,
    required this.listQues,
  }) : super(key: key);

  @override
  State<PlayScreenPage> createState() => _PlayScreenPageState();
}

class _PlayScreenPageState extends State<PlayScreenPage> {
  int i = 0;
  List<bool> isClick = [];

  @override
  void initState() {
    super.initState();
    isClick = List.generate(
        widget.listQues.elementAt(i).answers.length, (index) => false);
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   print(widget.listQues.length);
  //   super.initState();
  //   // postData = await HttpService1.fetchPosts();
  // }

  @override
  Widget build(BuildContext context) {
    Question question = widget.listQues.elementAt(i);
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFf1f1f1),
            appBar: AppBar(
              backgroundColor: const Color(0xFF11b8da),
              centerTitle: true,
              title: const Text("DATA",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              bottom: PreferredSize(
                  preferredSize: const Size(0, 50),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${i + 1}/${widget.listQues.length}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    question.content!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                answer(question),
                const Spacer(),
                footer(context, question),
              ],
            )));
  }

  Row footer(BuildContext context, Question question) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 150,
            height: 60,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: const Color(0xFF11b8da)),
                borderRadius: BorderRadius.circular(90)),
            child: Center(
              child: Text(
                'Prev',
                style: TextStyle(
                    fontSize: 20,
                    color: i == 0 ? Colors.grey : const Color(0xFF11b8da)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ResultTest(listQues: widget.listQues)));
          },
          child: Container(
            width: 150,
            height: 60,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color(0xFF11b8da),
                border: Border.all(color: const Color(0xFF11b8da)),
                borderRadius: BorderRadius.circular(90)),
            child: Center(
              child: Text(
                (i >= widget.listQues.length - 1) ? "Finish" : "Next",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column answer(Question question) {
    return Column(
        children: List<Widget>.generate(question.answers.length, (index) {
      Answer answer = question.answers.elementAt(index);
      return GestureDetector(
        onTap: () {
          // setState(() {
          //   isClick[index] = !isClick[index];
          // });
          // Database().updateAnswerByQuestions(question, answer);
          // Future.delayed(
          //   const Duration(milliseconds: 500),
          //   () {
          //     isClick[index] = !isClick[index];
          //     nextQuestion(context);
          //   },
          // );
        },
        child: Center(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color:
                        isClick[index] ? const Color(0xFF11b8da) : Colors.grey),
                borderRadius: BorderRadius.circular(90)),
            child: Center(
                child: Text(
              answer.content!,
              style: const TextStyle(fontSize: 18),
            )),
          ),
        ),
      );
    }));
  }
}
