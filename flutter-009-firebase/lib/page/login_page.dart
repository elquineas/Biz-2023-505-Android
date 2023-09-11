import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.updateAuthUser,
  });

  // main.dart에 선언된 _authUser 변수를 update 할 함수를 준비
  final Function(User? user) updateAuthUser;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailInputFocus = FocusNode();
  final _passwordInputFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "로그인이 필요합니다",
              style: TextStyle(fontSize: 20),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _emailInputFocus,
                    onChanged: (value) => _emailValue = value,
                  ),
                  TextFormField(
                    focusNode: _passwordInputFocus,
                    onChanged: (value) => _passwordValue = value,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                      ),
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            // 로그인에 성공하면 사용자 정보가 담긴다.
                            var result = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _emailValue,
                              password: _passwordValue,
                            );
                            //main.dart의 _authUser State에 로그인한 사용자 정보 업데이트
                            widget.updateAuthUser(result.user);
                            // 어떤 이유로 context가 사라질수 도 있는데
                            // 사용상 주의하라는 경고
                            // mounted 라는  시스템 변수가 생성되었는지 확인
                            if (mounted) return;
                            Navigator.of(context).pop();
                          }
                        } on FirebaseAuthException {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("")),
                          );
                        }
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "로그인",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () async {
                        try {
                          debugPrint("로그인");
                          final GoogleSignInAccount? googleUser =
                              await GoogleSignIn().signIn();
                          debugPrint("로그인 AUTH");
                          final GoogleSignInAuthentication? googleAuth =
                              await googleUser?.authentication;

                          if (googleUser == null || googleAuth == null) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("구글 로그인 실패"),
                              ),
                            );
                          } else {
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken,
                            );
                            final userCredential = await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            await widget.updateAuthUser(userCredential.user);
                            if (!mounted) return;
                            Navigator.of(context).pop();
                          }
                          debugPrint("로그인 TOKEN");
                        } catch (e) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "구글 로그인",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
