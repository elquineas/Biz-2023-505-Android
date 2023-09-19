import 'package:flutter/material.dart';
import 'package:project/models/power_add_model.dart';
import 'package:project/models/power_model.dart';
import 'package:project/service/power_service.dart';

class PowerPage extends StatefulWidget {
  const PowerPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PowerPage();
}

class _PowerPage extends State<PowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자취력 확인"),
      ),
      body: FutureBuilder(
          future: PowerService().selectAll(),
          builder: (conetxt, snapshot) {
            if (snapshot.hasData) {
              return powerListView(
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
    );
  }
}

Power getPower(int content) => Power(
      power: content,
    );

Widget powerListView({required AsyncSnapshot<List<Power>> snapshot}) {
  var powerAddList = [
    PowerAdd(power: 10, pName: "청소하기"),
    PowerAdd(power: 10, pName: "요리하기"),
    PowerAdd(power: 10, pName: "운동하기"),
    PowerAdd(power: 10, pName: "독서하기"),
    PowerAdd(power: 100, pName: "대청소하기"),
    PowerAdd(power: 10, pName: "장보기"),
  ];
  var power = snapshot.data!;
  if (power.isEmpty) {
    var newPower = getPower(0);
    PowerService().insert(newPower);
  }

  return ListView.builder(
    itemCount: powerAddList.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {},
        title: Column(key: Key(powerAddList[index].pName), children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      powerAddList[index].pName,
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
                          "${powerAddList[index].power}",
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
