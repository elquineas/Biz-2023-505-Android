/// flutter 프로젝트를 열었는데 import 에서 오류가 발생한 경우 프로젝트 폴더에서
/// flutter pub get 실행하기
// import 'dart:html';

import 'package:flutter/material.dart';

void main(List<String> args) {
  MyApp app = const MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "반갑습니다",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StartPage(),
    );
  }
}

// state 를 사용하여 화면에 지속적인 변화를 주기 위한 시작점
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  /// StatePage 클래스의 생성자를 호출하여 객체를 생성하는 코드
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 첫 App"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("반가워"),
            Text("반가워"),
            Text("반가워"),
            Text("반가워"),
            Text("반가워"),
            Text("반가워"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.email),
      ),
    );
  }
}
