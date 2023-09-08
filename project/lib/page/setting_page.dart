import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("데이터 초기화"),
            SizedBox(
              width: 100,
              child: OutlinedButton(
                onPressed: () {
                  print("데이터 초기화 버튼");
                },
                child: const Text("초기화"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
