import 'package:firebase/pages/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: _emailFocus,
                validator: (value) => CheckValidate().emailCheck(
                  email: value!,
                  focusNode: _emailFocus,
                ),
                decoration: const InputDecoration(
                  hintText: "이메일을 입력해주세요",
                  helperText: "이메일 형식에 맞도록 입력해주세요",
                  helperStyle: TextStyle(
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
              TextFormField(
                focusNode: _passwordFocus,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
                decoration: const InputDecoration(
                  hintText: "비밀번호를 입력하세요",
                  helperText: "특수문자, 대소문자, 숫자 포함하여 8자 이상",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState?.validate();
                  var result =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: "elquineas@naver.com",
                    password: "!Biz8080",
                  );
                  setState(() {});
                },
                child: const Text("로그인"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
