import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/service/todo_service.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  // ** Controller
  // flutter 의 대부분의 Widget 에는 위젯Controller 라는 객체가 있다.
  // HTML 의 id 속성에 해당하는 객체이다.
  var inputController = TextEditingController();
  var todoContent = "";
  var todoList = [];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:mm:ss").format(DateTime.now()),
        content: content,
        complete: false,
      );

  /// Scaffold
  /// 처음 화면의 layout을 꾸밀때 사용하는 Widget
  /// appBar, body, bottomSheet 가 있는데
  /// appBar 는 화면의 header(머릿글)에 해당하는 부분
  /// body 는 본문(중앙)에 해당하는 부분
  /// bottomSheet 는 화면의 footer(꼬릿글)에 해당하는 부분
  ///                키보드가 나와도 키보드 위에 표현되는 부분
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "img/giphy.gif",
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
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: inputController,
                  onChanged: (value) => setState(() {
                    todoContent = value;
                  }),
                  decoration: InputDecoration(
                    prefix: const SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => inputController.clear(),
                      icon: const Icon(Icons.clear),
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    ),
                    hintText: "할일을 입력해 주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  var todo = getTodo(todoContent);
                  await TodoService().insert(todo);
                  setState(() {
                    // todoList.add(todo);
                    FocusScope.of(context).unfocus();
                    todoContent = "";
                  });
                  inputController.clear();
                },
                icon: const Icon(Icons.add_to_home_screen_rounded),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FutureBuilder(
            future: TodoService().selectAll(),
            builder: (conetxt, snapshot) {
              if (snapshot.hasData) {
                return todoListView(
                  snapshot: snapshot,
                  // todoList: todoList,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: "데이터가 없습니다",
                  ),
                );
              }
            }),
        // child: todoListView(),
      ),
    );
  }

  /// ListView return type을 Widget 으로 변경하기
  /// 모든 Widget은 가장 상위 클래스인 Widget을 상속받고 있기 때문에
  /// 모든 Widget의 return 타입을 Widget으로 받아도 된다
  Widget todoListView({required AsyncSnapshot<List<Todo>> snapshot}) {
    var todoList = snapshot.data!;
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {},
          selectedColor: const Color.fromARGB(249, 224, 112, 112),
          splashColor: const Color.fromARGB(249, 106, 144, 226),
          title: Dismissible(
            /// key: Key(todoList[index].content),
            /// 만약 todoList 데이터가 없는 경우 null exeption 이 발생할수 있기때문에
            /// key 의 값이 null 이 된다. flutter 에서 제공하는 UUID 인 Uniquekey() 를 사용한다.
            key: UniqueKey(),
            background: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.save,
                size: 36,
              ),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete,
                size: 36,
              ),
            ),
            //사라지기 전의 event
            // confirmDismiss: (direction) => Future.value(false),
            confirmDismiss: (direction) =>
                onConfirmHandler(direction, todoList[index]),
            onDismissed: (direction) async {
              // 완료하기
              if (direction == DismissDirection.startToEnd) {
                var todo = todoList[index];
                todo.complete = !todo.complete;
                await TodoService().update(todo);
                setState(() {
                  // todoList[index].complete = !todoList[index].complete;
                });
                //삭제하기
              } else if (direction == DismissDirection.endToStart) {
                var content = todoList[index].content;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$content 를 삭제했습니다."),
                  ),
                );

                await TodoService().delete(todoList[index].id ?? 0);
                setState(() {});
              }
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            todoList[index].content,
                            style: todoList[index].complete
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 20,
                                    color: Colors.deepPurple)
                                : const TextStyle(
                                    fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> onConfirmHandler(direction, Todo todo) {
    if (direction == DismissDirection.startToEnd) {
      return completeConfirm(todo);
    } else if (direction == DismissDirection.endToStart) {
      return deleteConfirm();
    }
    // Future : 화면의 state에 의해서 변화를 감지하는 객체
    // true 값을 받으면 값이 사라지게, false를 받으면 값이 유지되게
    return Future.value(false);
  }

  Future<bool?> completeConfirm(Todo todo) {
    var yesNo = todo.complete ? "완료를 취소하시겠습니까?" : "완료 하시겠습니까?";
    // var yesNo = "완료확인";
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(yesNo),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("완료"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니오"),
          ),
        ],
      ),
    );
  }

  Future<bool?> deleteConfirm() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("삭제 하시겠습니까?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("삭제"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니오"),
          ),
        ],
      ),
    );
  }

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
        ],
      );
}
