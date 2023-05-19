import 'package:flutter/material.dart';

import '../model/answer.dart';
import '../model/question.dart';
import 'home.dart';

class ResultTest extends StatefulWidget {
  List<Question> listQues;
  ResultTest({Key? key, required this.listQues}) : super(key: key);

  @override
  State<ResultTest> createState() => _ResultTestState();
}

class _ResultTestState extends State<ResultTest> {
  List<int> correctAnswer = [];
  List<int> wrongAnswer = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF11b8da),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                icon: const Icon(Icons.home)),
            title: const Text(
              'RESULT TEST',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: [
              IconButton(
                onPressed: () => _dialogBuilder(context),
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'You finished the lesson with',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.shade400,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          correctAnswer.length.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.redAccent.shade400,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          wrongAnswer.length.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children:
                      List<Widget>.generate(widget.listQues.length, (index) {
                    Question question = widget.listQues.elementAt(index);
                    // Answer answerChoice = question.answers.elementAt(index);
                    // Answer? answerChoice = Database().loadData(
                    //     widget.listQues.elementAt(index).id.toString());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Question
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${index + 1}. ${question.content}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Column(
                          children:
                              List.generate(question.answers.length, (index) {
                            Answer answer = question.answers.elementAt(index);
                            return SizedBox(
                              height: 70,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(90)),
                                      border: Border.all(
                                          width: 1, color: Colors.blue
                                          //  answerChoice != null
                                          //     ? answer.correct == 1
                                          //         ? Colors.greenAccent.shade400
                                          //         : Colors.redAccent.shade400
                                          //     : answer.correct == 1
                                          //         ? Colors.greenAccent.shade400
                                          //         : Colors.grey,
                                          ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        answer.content!,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 25,
                                    bottom: 45,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFf1f1f1),
                                          shape: BoxShape.circle),
                                      // child:
                                      // answerChoice != null
                                      //     ? answer.id == answerChoice.id
                                      //         ? Icon(
                                      //             Icons.check_circle,
                                      //             color:
                                      //                 answerChoice.correct == 1
                                      //                     ? Colors.greenAccent
                                      //                         .shade400
                                      //                     : Colors.redAccent
                                      //                         .shade400,
                                      //           )
                                      //         : null
                                      //     : null,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),

                        Center(
                          child: Container(
                            height: 1,
                            width: 100,
                            margin: const EdgeInsets.all(10),
                            color: Colors.grey,
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ],
            ),
          )),
    );
  }
}

_dialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Basic dialog title'),
          content: SizedBox(
            height: 210,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(
                      hintText: "email", border: InputBorder.none),
                ),
                const SizedBox(
                  height: 1,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: const Text("Subject: "),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: const Text(
                    "Grammar",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: const Text("Context: "),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: const Text(
                      "A your friend finished the test 0/68 scores in 15 seconds"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Send'))
          ],
        );
      });
}
