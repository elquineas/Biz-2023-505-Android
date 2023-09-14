import 'package:flutter/material.dart';
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
  // var inventoryList = [];
  var today = DateFormat("yyyy-MM-dd").format(DateTime.now());
  var newInventoryList = [
    Article(
      aName: "화장지",
      aCount: 7,
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      aName: "물티슈",
      aCount: 7,
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      aName: "물",
      aCount: 7,
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
    Article(
      aName: "밥",
      aCount: 7,
      aDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 7))),
    ),
  ];

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
              showDialog(
                // barrierDismissible: false,
                context: context,
                builder: (context) => alertDialog(context),
              );
            },
            icon: const Icon(Icons.add_box_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: newInventoryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            // selectedColor: const Color.fromARGB(249, 224, 112, 112),
            // // splashColor: const Color.fromARGB(249, 106, 144, 226),
            title: Column(key: Key(newInventoryList[index].aName), children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          newInventoryList[index].aName,
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
                              "${newInventoryList[index].aCount}",
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
}

Widget alertDialog(BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      actions: [
        TextField(
          textInputAction: TextInputAction.go,
          onSubmitted: (value) {
            var snackBar = SnackBar(
              content: Text("$value 추가"),
            );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // var todo = getTodo(value);
            // Navigator.of(context).pop();
            // setState(() {
            //   todoList.add(todo);
            // });
          },
          decoration: const InputDecoration(
            hintText: "생필품 품목",
          ),
        ),
        Row(
          children: [
            Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  var snackBar = SnackBar(
                    content: Text("$value 추가"),
                  );
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
                onPressed: () {},
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
