import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/models/article_model.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ArticlePage();
}

class _ArticlePage extends State<ArticlePage> {
  final _nameInputController = TextEditingController();
  final _countInputController = TextEditingController();
  var today = DateFormat("yyyy-MM-dd").format(DateTime.now());
  var newArticleList = [
    Article(
      aName: "화장지",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      aName: "물티슈",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      aName: "물",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      aName: "밥",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
  ];
  Article getArticle(String content, String count) => Article(
        aName: content,
        aDate: DateFormat("yyyy-MM-dd")
            .format(DateTime.now().add(Duration(days: int.parse(count)))),
        aCount: count,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/box.png",
          fit: BoxFit.fill,
        ),
        title: const Text("생필품 확인"),
        actions: [
          IconButton(
            onPressed: () {
              var result = showDialog(
                  context: context, builder: (context) => ArticleAlertDialog());
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                actions: [
                  TextField(
                    textInputAction: TextInputAction.go,
                    onChanged: (value) {
                      tempName = value;
                    },
                    onSubmitted: (value) {
                      print("네임 키보드 서브밋");
                    },
                    decoration: const InputDecoration(
                      hintText: "생필품 품목",
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
                          onChanged: (value) {
                            tempCount = value;
                          },
                          onSubmitted: (value) {
                            print("카운트 키보드 서브밋");
                          },
                          decoration: const InputDecoration(
                            hintText: "남은 수량",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          "일치",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(33);
                          },
                          child: const Text("등록"),
                        ),
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("취소"),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            icon: const Icon(Icons.add_box_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: newArticleList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            // selectedColor: const Color.fromARGB(249, 224, 112, 112),
            // // splashColor: const Color.fromARGB(249, 106, 144, 226),
            title: Column(key: Key(newArticleList[index].aName), children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          newArticleList[index].aName,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.deepPurple),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              newArticleList[index].aCount,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const Text("일치"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
                  Icons.assignment_late_outlined,
                  size: 50,
                ),
              ),
            ),
          ),
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

  AlertDialog ArticleAlertDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      actions: [
        TextField(
          controller: _nameInputController,
          textInputAction: TextInputAction.go,
          onChanged: (value) {
            tempName = value;
          },
          onSubmitted: (value) {
            print("네임 키보드 서브밋");
          },
          // decoration: const InputDecoration(
          //   labelText: "Search",
          //   labelStyle: TextStyle(fontSize: 20),
          //   hintText: "검색어를 입력하세요",
          //   hintStyle: TextStyle(color: Colors.amberAccent),
          //   prefixIcon: Icon(Icons.search),
          // ),
          decoration: const InputDecoration(
            labelText: "생필품 품목",
            labelStyle: TextStyle(fontSize: 20),
            hintText: "ex) 물, 화장지, 식재료",
            hintStyle: TextStyle(color: Colors.indigo),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: TextField(
                controller: _countInputController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onChanged: (value) {
                  tempCount = value;
                },
                onSubmitted: (value) {
                  print("카운트 키보드 서브밋");
                },
                decoration: const InputDecoration(
                  labelText: "남은 수량",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "ex) (대략) 3, 5, 7...일치",
                  hintStyle: TextStyle(color: Colors.indigo),
                ),
              ),
            ),
            const SizedBox(
              width: 70,
              child: Text(
                "일치",
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  var popNav = true;
                  print("-------------------------");
                  print(_nameInputController.text);
                  print(_countInputController.text);
                  print("-------------------------");
                  if (_countInputController.text.isNotEmpty) {
                    var snackBar = const SnackBar(
                      content: Text("수량을 입력해주세요"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Navigator.of(context).pop(false);
                  } else {
                    Navigator.of(context).pop(false);
                  }
                  //   onPressed: () async {
                  //   var todo = getTodo(todoContent);
                  //   await TodoService().insert(todo);
                  //   setState(() {
                  //     // todoList.add(todo);
                  //     FocusScope.of(context).unfocus();
                  //     todoContent = "";
                  //   });
                  //   inputController.clear();
                  //    },
                },
                child: const Text("등록"),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("취소"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String tempName = "";
String tempCount = "";

Widget alertDialog(BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      actions: [
        TextField(
          textInputAction: TextInputAction.go,
          onChanged: (value) {
            tempName = value;
          },
          onSubmitted: (value) {
            print("네임 키보드 서브밋");
          },
          decoration: const InputDecoration(
            hintText: "생필품 품목",
          ),
        ),
        Row(
          children: [
            Flexible(
              child: TextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onChanged: (value) {
                  tempCount = value;
                },
                onSubmitted: (value) {
                  print("카운트 키보드 서브밋");
                },
                decoration: const InputDecoration(
                  hintText: "남은 수량",
                ),
              ),
            ),
            const SizedBox(
              width: 70,
              child: Text(
                "일치",
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(33);
                },
                child: const Text("등록"),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("취소"),
              ),
            ),
          ],
        ),
      ],
    );


// class _HomePage extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("여기는 Home Page 입니다"),
//             ElevatedButton(
//               onPressed: () {
//                 var user = User(
//                   username: "callor",
//                   password: "123451234",
//                   email: "callor@callor.com",
//                   nickname: "홍길동",
//                   tel: "010-111-1111",
//                 );

//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => DetailPage(
//                     name: "홍길동",
//                     email: "callor@callor.com",
//                     userDto: user,
//                   ),
//                 ));
//               },
//               child: const Text("자세히 보기"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
