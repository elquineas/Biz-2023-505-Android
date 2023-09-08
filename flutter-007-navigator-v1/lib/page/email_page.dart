import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<StatefulWidget> createState() => _EmailPage();
}

class _EmailPage extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-mail Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("이메일 페이지"),
            Text("E-mail ${args["email"]}"),
            Text("Password ${args["password"]}"),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed("/mypage"),
              child: const Text("My Page"),
            ),
          ],
        ),
      ),
    );
  }
}
