import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget recipeGrid(
    {required List<Map<String, String>> datas,
    required bool type,
    required Function callbackFunction}) {
  return GridView.count(
    shrinkWrap: true,
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    // padding
    crossAxisCount: 2,
    // 한 열에 보여줄 갯수
    childAspectRatio: 2 / 1.7,
    // 상하비율
    children: List.generate(datas.length, (index) {
      var data = datas[index];
      var match = data["match"]!;
      return GestureDetector(
          onTap: () {
            // callbackFunction 호출하여 작업할까 고민중... (재사용 관련)
            callbackFunction(index);
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.all(3.0), // margin
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data["image"]!),
                            fit: BoxFit.fill))),
                (type)
                    ? Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            // 정보보기
                          },
                          child: Icon(Icons.info, color: Colors.black38),
                        ))
                    : Text(""),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Text(
                      "일치율 : ($match%)",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white30),
                    )),
              ],
            ),
            Text(
              data["title"]!,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.fade,
              maxLines: 1,
            )
          ]));
    }),
  );
}
