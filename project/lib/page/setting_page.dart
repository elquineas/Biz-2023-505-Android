import 'package:flutter/material.dart';
import 'package:project/models/power_model.dart';
import 'package:project/service/article_service.dart';
import 'package:project/service/power_service.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Power getPower(int content) => Power(
        id: 0,
        power: content,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/setting.png",
          fit: BoxFit.fill,
        ),
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
                  ArticleService().deleteAll();
                  PowerService().deleteAll();
                  var newPower = getPower(0);
                  PowerService().insert(newPower);
                  var snackBar = const SnackBar(
                    content: Text("데이터를 초기화했습니다."),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  print("데이터 초기화 버튼");
                },
                child: const Text("초기화"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              print("생필품 확인 -> 홈");
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
              child: const SizedBox(
                width: 70,
                height: 70,
                child: Center(
                  child: Icon(
                    Icons.subdirectory_arrow_left_rounded,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
