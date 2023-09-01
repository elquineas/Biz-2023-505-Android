import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:state/main_app_bar.dart';
import 'package:state/models/student.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Flutter State",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => StartPage();
}

class StartPage extends State<HomePage> {
  // State 클리스 위젯에서 titles 배열 변수 생성
  List<String> titles = [
    "Hello Korea",
    "안녕하세요",
    "테스트 문구1",
    "테스트 문구2",
    "테스트 문구3",
    "테스트 문구4",
  ];

  final studentList = [
    Student(stNum: "001", stName: "홍길동"),
    Student(stNum: "002", stName: "이몽룡"),
    Student(stNum: "003", stName: "성춘향"),
    Student(stNum: "004", stName: "임꺽정"),
    Student(stNum: "005", stName: "장보고"),
    Student(stNum: "006", stName: "이순신"),
  ];

  // 배열을 화면에 출력하기 위해 ListView.builder 를 사용
  ListView appBarBody() => ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Material(
              //InkWell 과 Material 은 셋트
              child: InkWell(
                highlightColor: const Color.fromARGB(
                    255, 236, 102, 102), //.withOpacity(0.5)
                splashColor: const Color.fromARGB(255, 117, 238, 117),
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text(studentList[index].stName),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text("${studentList[index].stNum} : "),
                      Text(studentList[index].stName),
                      // Text(titles[index]),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    // var mainAppBar = AppBar(
    //   title: const Text(
    //     "테스트 타이틀",
    //     style: TextStyle(color: Colors.black),
    //   ),
    //   backgroundColor: Colors.lightGreen.shade300,
    //   centerTitle: true,
    //   elevation: 0.0,
    //   actions: [
    //     IconButton(
    //       onPressed: () {
    //         var snackBar = SnackBar(
    //             content: const Text("스낵바입니다. 스캐폴드를 통해서 사용하세요"),
    //             action: SnackBarAction(
    //               label: "ㅎㅎ",
    //               onPressed: () {},
    //             ));
    //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //       },
    //       icon: const Icon(
    //         Icons.person,
    //       ),
    //     ),
    //   ],
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text("HI"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var rnd = Random().nextDouble();
              // 리스트에 추가
              // state 로 선언된 변수의 값을 변경할때 사용하는 함수
              setState(() {
                titles.add(
                  rnd.toString(),
                );
              });
            },
            icon: const Icon(Icons.add_comment_outlined),
          )
        ],
      ),
      // mainAppBar(context),
      body: appBarBody(),
    );
  }
}
