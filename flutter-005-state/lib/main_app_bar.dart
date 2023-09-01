import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "테스트 타이틀",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.lightGreen.shade300,
      centerTitle: true,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            const snaBar = SnackBar(content: Text("스낵바입니다. 스캐폴드를 통해서 사용하세요"));
            ScaffoldMessenger.of(context).showSnackBar(snaBar);
          },
          icon: const Icon(
            Icons.person,
          ),
        ),
      ],
    );

ListView app_bar_body() => ListView();
