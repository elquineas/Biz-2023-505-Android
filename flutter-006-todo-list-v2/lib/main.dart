import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter TodoList",
      theme: ThemeData(primarySwatch: Colors.indigo),
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
  var todoList = [];
  // var todoList = [
  //   Todo(
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "컨텐츠",
  //     complete: false,
  //   ),
  //   Todo(
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "Flutter 프로젝트",
  //     complete: false,
  //   ),
  // ];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:ss:mm").format(DateTime.now()),
        content: content,
        complete: false,
      );

  Widget alertDialog(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        actions: [
          TextField(
            // keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(
                content: Text("$value 추가"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해주세요",
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  // keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    var snackBar = SnackBar(
                      content: Text("$value 추가"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    var todo = getTodo(value);
                    Navigator.of(context).pop();
                    setState(() {
                      todoList.add(todo);
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "갯수를 입력해주세요",
                  ),
                ),
              ),
              Flexible(
                child: TextField(
                  // keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    var snackBar = SnackBar(
                      content: Text("$value 추가"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    var todo = getTodo(value);
                    Navigator.of(context).pop();
                    setState(() {
                      todoList.add(todo);
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "날자를 입력해주세요",
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text("안녕"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text("잘가"),
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "img/mokoko.png",
          fit: BoxFit.fill,
        ),
        title: const Text("나의 Todo List"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                // barrierDismissible: false,
                context: context,
                builder: (context) => alertDialog(context),
              );
            },
            icon: const Icon(Icons.add_alarm),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            selectedColor: const Color.fromARGB(249, 224, 112, 112),
            splashColor: const Color.fromARGB(249, 106, 144, 226),
            title: Dismissible(
              key: Key(todoList[index].content),
              background: Container(
                color: Colors.green,
                child: const Icon(
                  Icons.save,
                  size: 36,
                ),
              ),
              secondaryBackground: Container(
                // padding: const EdgeInsets.symmetric(10.0),
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  size: 36,
                ),
              ),
              confirmDismiss: (direction) => Future.value(false),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(todoList[index].sdate),
                          Text(todoList[index].stime),
                        ]),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          todoList[index].content,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
