import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPate(),
    );
  }
}

class StartPate extends StatefulWidget {
  const StartPate({super.key});
  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("어플 타이틀"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("홍길동"),
              accountEmail: const Text("elquineas@naver.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "img/milky_way.jpg",
                          height: 50,
                          width: 50,
                        ),
                      ),
                      const Text("Elquineas"),
                    ],
                  )),
            ),
            const ListTile(
              title: Text("전체 메일보기"),
              leading: Icon(Icons.email),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("받은 메일보기"),
              leading: Icon(Icons.inbox),
            ),
            const ListTile(
              title: Text("페이스북"),
              leading: Icon(Icons.facebook),
            ),
            const ListTile(
              title: Text("테스트1"),
              leading: Icon(Icons.pan_tool_alt_sharp),
            ),
            const ListTile(
              title: Text("테스트2"),
              leading: Icon(Icons.account_box),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.add),
          label: const Text("추가"),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.red,
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 15,
                color: Colors.green,
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.clear),
          label: const Text("지우기"),
        ),
      ],
      body: const Center(
        child: Text(
          "스마트 어플 몸통",
          style: TextStyle(
            fontSize: 50,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
