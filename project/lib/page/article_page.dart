// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/models/article_model.dart';
import 'package:project/service/article_service.dart';
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
  var articleList = [];
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
                  context: context, builder: (context) => ArticleAddDialog());
              // AlertDialog(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0),
              //   ),
              //   actions: [
              //     TextField(
              //       textInputAction: TextInputAction.go,
              //       onChanged: (value) {
              //         tempName = value;
              //       },
              //       onSubmitted: (value) {
              //         print("네임 키보드 서브밋");
              //       },
              //       decoration: const InputDecoration(
              //         hintText: "생필품 품목",
              //       ),
              //     ),
              //     Row(
              //       children: [
              //         Flexible(
              //           child: TextField(
              //             inputFormatters: <TextInputFormatter>[
              //               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              //               FilteringTextInputFormatter.digitsOnly,
              //             ],
              //             keyboardType: TextInputType.number,
              //             textInputAction: TextInputAction.go,
              //             onChanged: (value) {
              //               tempCount = value;
              //             },
              //             onSubmitted: (value) {
              //               print("카운트 키보드 서브밋");
              //             },
              //             decoration: const InputDecoration(
              //               hintText: "남은 수량",
              //             ),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 70,
              //           child: Text(
              //             "일치",
              //           ),
              //         ),
              //       ],
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Expanded(
              //           child: OutlinedButton(
              //             onPressed: () {
              //               // Navigator.of(context).pop(33);
              //             },
              //             child: const Text("등록"),
              //           ),
              //         ),
              //         Expanded(
              //           child: OutlinedButton(
              //             onPressed: () {},
              //             child: const Text("취소"),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // );
            },
            icon: const Icon(Icons.add_box_outlined),
          )
        ],
      ),
      body: FutureBuilder(
          future: ArticleService().selectAll(),
          builder: (conetxt, snapshot) {
            if (snapshot.hasData) {
              return articleListView(
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              var result = showDialog(
                  context: context,
                  builder: (context) => ArticleAlertDialog(context));
              print("부족한 생필품 확인");
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
                    Icons.assignment_late_outlined,
                    size: 50,
                  ),
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

  AlertDialog ArticleAddDialog() {
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
                onPressed: () async {
                  var popNav = true;
                  print("-------------------------");
                  print(_nameInputController.text);
                  print(_countInputController.text);
                  print("-------------------------");
                  if (_nameInputController.text.isEmpty) {
                    var snackBar = const SnackBar(
                      content: Text("생필품을 입력해주세요"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (_countInputController.text.isEmpty) {
                    var snackBar = const SnackBar(
                      content: Text("수량을 입력해주세요"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Navigator.of(context).pop(false);
                  } else {
                    var article = getArticle(
                        _nameInputController.text, _countInputController.text);
                    await ArticleService().insert(article);
                    setState(() {
                      articleList.add(article);
                    });
                    _nameInputController.clear();
                    _countInputController.clear();
                    Navigator.of(context).pop(false);
                  }
                },
                child: const Text("등록"),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  _nameInputController.clear();
                  _countInputController.clear();
                  Navigator.of(context).pop(false);
                },
                child: const Text("취소"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

AlertDialog ArticleAlertDialog(context) {
  String alertText = "생필품이 어느정도 있어요 ^^";
  String tempText = "";
  int count = 0;
  // debugPrint(articleList.toString());
  if (articleList.isEmpty) {
    alertText = "생필품이 없어요";
  }

  for (var i = 0; i < articleList.length; i++) {
    if (int.parse(articleList[i].aCount) < 4) {
      tempText = "$tempText ${articleList[i].aName}";
      if ((i + 1) == articleList.length) {
        tempText = "$tempText (이)가 떨어져가요!";
        alertText = tempText;
      } else {
        tempText = "$tempText ,";
      }
    }
  }

  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    actions: [
      Center(
        child: Column(
          children: [
            Text(alertText),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("확인"),
            ),
          ],
        ),
      ),
    ],
  );
}

String tempName = "";
String tempCount = "";
var articleList;

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

Widget articleListView({required AsyncSnapshot<List<Article>> snapshot}) {
  var newArticleList = [
    Article(
      id: 0,
      aName: "화장지",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      id: 1,
      aName: "물티슈",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      id: 2,
      aName: "물",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      id: 3,
      aName: "밥",
      aCount: "7",
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
  ];
  articleList = snapshot.data!;
  if (articleList.isEmpty) {
    articleList = newArticleList;
    for (var i = 0; i < articleList.length; i++) {
      ArticleService().insert(articleList[i]);
    }
  } else {
    // debugPrint("test");
  }

  var toDay = DateTime.now();
  // debugPrint("$toDay");
  // debugPrint("${articleList.length}");
  for (var i = 0; i < articleList.length; i++) {
    String date = articleList[i].aDate;
    int difference =
        (int.parse(toDay.difference(DateTime.parse(date)).inDays.toString()) *
                -1) +
            1;
    articleList[i].aCount = "$difference";
    // debugPrint(articleList[i].toString());
    // debugPrint("$difference");
    ArticleService().update(articleList[i]);
    if (articleList[i].aCount.contains('-')) {
      // debugPrint("${i + 1} 삭제");
      ArticleService().delete(articleList[i].id);
    }
  }

  // debugPrint(articleList.toString());
  return ListView.builder(
    itemCount: articleList.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {},
        title: Column(key: Key(articleList[index].aName), children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      articleList[index].aName,
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
                          "${articleList[index].aCount}",
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
  );
}
