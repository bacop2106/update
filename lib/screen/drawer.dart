import 'package:flutter/material.dart';

import '../api_service/drawer.dart';
import '../model/category.dart';

class DrawerSelect extends StatefulWidget {
  const DrawerSelect({Key? key}) : super(key: key);

  @override
  State<DrawerSelect> createState() => _DrawerSelectState();
}

class _DrawerSelectState extends State<DrawerSelect> {
  List<Category> postData = [];

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
    return Drawer(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/drawer_background.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            padding: const EdgeInsets.all(0),
            children: [
              AppBar(
                backgroundColor: const Color(0xFF11b8da),
                leading: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/icon.png',
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                // leading: IconButton( onPressed: (){},icon: Image.asset("assets/images/icon.png"),),
                centerTitle: true,
                title: const Text("Anonymous"),
                actions: const [Icon(Icons.draw)],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: postData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, int index) {
                      // final item = postData[index];
                      return GestureDetector(
                        onTap: () {},
                        // onTap: () => goToScreen2(${postData[index].id}),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.my_library_books,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${postData[index].name}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ],
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
