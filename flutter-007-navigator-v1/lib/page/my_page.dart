import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/email_page.dart';
import 'package:flutter_application_1/page/home_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page"),
      ),
      body: const Center(
        child: Column(
          children: [
            Center(
              child: Text("마이 페이지 입니다."),
              // ElevatedButton(
              //   onPressed: () => const Navigator.of(context).push(MaterialPageRoute(builder: () => const HomePage(),),
              //   )
              //   child: const Text("Email Page"),
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
