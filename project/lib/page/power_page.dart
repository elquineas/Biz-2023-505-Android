import 'package:flutter/material.dart';

class PowerPage extends StatefulWidget {
  const PowerPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PowerPage();
}

class _PowerPage extends State<PowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자취력 확인"),
      ),
      body: const Center(
        child: Text("여기는 자취력 확인 페이지 입니다"),
      ),
    );
  }
}
