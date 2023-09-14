import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project/page/article_page.dart';
import 'package:project/page/power_page.dart';
import 'package:project/page/setting_page.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Android Project",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      // routes: {
      // "/article": (context) => const ArticlePage(),
      // "/mypage": (context) => const MyPage(),
      // "/email": (context) => const EmailPage(),
      // },
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const Image(
                  image: AssetImage("assets/giphy.gif"),
                  width: 350,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("홈 -> 생필품 확인");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ArticlePage()),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              // width: 2,
                              // color: Colors.orange,
                              // ),
                              ),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: AssetImage("assets/storage.png"),
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () {
                            print("생필품 확인 버튼");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ArticlePage()),
                            );
                          },
                          child: const Text("생필품 확인"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("자취력 확인 터치");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PowerPage()),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: AssetImage("assets/pngwing.png"),
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () {
                            print("자취력 확인 버튼");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PowerPage()),
                            );
                          },
                          child: const Text("자취력 확인"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("설정 페이지");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingPage()),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: AssetImage("assets/setting.png"),
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () {
                            print("설정 페이지 버튼");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingPage()),
                            );
                          },
                          child: const Text("설 정"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // Text("!!!"),
      ),
    );
  }
}
