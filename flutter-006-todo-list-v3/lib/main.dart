import 'package:flutter/material.dart';
import 'package:todolist/modules/todo_main.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter TodoList",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const StartPage(),
    );
  }
}
