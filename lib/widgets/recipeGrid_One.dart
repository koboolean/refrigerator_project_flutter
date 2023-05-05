import 'package:flutter/material.dart';

// final _timeController = TextEditingController();
// final _textController = TextEditingController();

Widget recipeGrid_One(
    {required List<Map<String, String>> datas,
    required bool type,
    required Function callbackFunction,
    required BuildContext context}) {
  return GridView.count(
    shrinkWrap: true,
    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10), // padding
    crossAxisCount: 1, // 한 열에 보여줄 갯수
    childAspectRatio: 2 / 3, // 상하비율
    children: List.generate(datas.length, (index) {
      var data = datas[index];
      var match = data["match"]!;

      return GestureDetector(
          onTap: () {
            callbackFunction();
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: Text(data["step"]!, style: TextStyle(fontSize: 30)),
                ),
                type ?
                IconButton( onPressed: () {

                }, icon: Icon(Icons.timer_outlined, size: 30)) : Text("")
              ],
            ),
            Row(children: [
              Text("${data["time"]} +",
                  style: TextStyle(color: Color.fromARGB(255, 9, 175, 175)))
            ]),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.all(3.0), // margin
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data["image"]!),
                            fit: BoxFit.fill))),
              ],
            ),
            Text(
              data["title"]!,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
            Text(
              data["contents"]!,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
            SizedBox(
              height: 50,
            )
          ]));
    }),
  );
}
