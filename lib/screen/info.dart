import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        Container(
          height: 65,
          color: const Color(0xFF11b8da),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Container(),
            ],
          ),
        ),
        SizedBox(
          child: Container(
            padding: const EdgeInsets.fromLTRB(100, 40, 100, 20),
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Version",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Text(
                    "English quiz 1.3",
                    style: TextStyle(fontSize: 18, color: Colors.black38),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Website",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Text(
                    "English quiz 1.3",
                    style: TextStyle(fontSize: 18, color: Colors.black38),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Rate Us",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Remote Ads",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Terms of Use",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Privacy Police",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
