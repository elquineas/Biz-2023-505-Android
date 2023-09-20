import 'package:flutter/material.dart';
import 'package:path/path.dart';
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

int power = 0;

class _PowerPage extends State<PowerPage> {
  updatePt(int point) {
    setState(() {
      power = point;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/pngwing.png",
          fit: BoxFit.fill,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("자취력 확인"),
            Text("$power pt"),
          ],
        ),
      ),
      body: FutureBuilder(
          future: PowerService().selectAll(),
          builder: (conetxt, snapshot) {
            if (snapshot.hasData) {
              return powerListView(snapshot: snapshot, updatePt: updatePt);
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

Power getPower(int content) => Power(
      id: 0,
      power: content,
    );

Widget powerListView(
    {required AsyncSnapshot<List<Power>> snapshot, required updatePt}) {
  var powerAddList = [
    PowerAdd(power: 100, pName: "대청소하기"),
    PowerAdd(power: 20, pName: "운동하기"),
    PowerAdd(power: 15, pName: "장보기"),
    PowerAdd(power: 10, pName: "청소하기"),
    PowerAdd(power: 10, pName: "요리하기"),
    PowerAdd(power: 10, pName: "독서하기"),
  ];
  var powerPt = snapshot.data!;
  if (powerPt.isEmpty) {
    var newPower = getPower(0);
    PowerService().deleteAll();
    PowerService().insert(newPower);
  } else {
    // debugPrint(powerPt.toString());
    power = int.parse("${powerPt[0].power}");
    // updatePt(power);
  }

  return ListView.builder(
    itemCount: powerAddList.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          power = power + int.parse("${powerAddList[index].power}");
          var tempPower = getPower(power);
          PowerService().update(tempPower);
          updatePt(power);
        },
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
                        const Text(" pt"),
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
