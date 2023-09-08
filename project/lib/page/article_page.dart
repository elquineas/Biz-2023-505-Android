import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ArticlePage();
}

class _ArticlePage extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("생필품 확인"),
      ),
      body: const Center(
        child: Text("여기는 생필품 확인 페이지 입니다"),
      ),
    );
  }
}


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
