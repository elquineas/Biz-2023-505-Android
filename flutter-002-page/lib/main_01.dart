import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "나의 앱",
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "img/cat.jpg",
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            colMethod(),
          ],
        ),
      ),
    );
  }

  // 컨테이너 위젯 ( Container Widget )
  // padding과 margin 을 부여하는 box
  // Expaded : 부모 box를 가즉 채우는 구조의 box
  // Padding : padding을 기본값으로 가지는 box
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        // const Icon(
        //   Icons.star,
        //   color: Colors.purple,
        // ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "안녕",
                ),
              ),
              const Text(
                "우리나라 ㅎㅎ",
                style: TextStyle(
                  color: Color(0xffeb34ad), //Colors.teal,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.purple,
        ),
        const Text("50"),
      ],
    ),
  );

  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),
      child: const Text(
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하"
        "가나다라마바사아자차카타파하",
        softWrap: true,
      ),
    );
  }

  Column colMethod() {
    return const Column(
      children: [
        Text(
          "반갑습니다",
          style: TextStyle(
            fontSize: 30,
            color: Colors.orange,
          ),
        ),
        Text(
          "하이~",
          style: TextStyle(
            fontSize: 30,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
