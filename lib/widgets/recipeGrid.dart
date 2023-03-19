import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget recipeGrid(
    {required List<Map<String, String>> datas,
    required bool type,
    required Function callbackFunction}) {
  return GridView.count(
    shrinkWrap: true,
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5), // padding
    crossAxisCount: 2, // 한 열에 보여줄 갯수
    childAspectRatio: 2/1.6, // 상하비율
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
            Container(
                margin: new EdgeInsets.all(3.0), // margin
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data["image"]!),
                        fit: BoxFit.fill))),
            (!type)
                ? Text(
                    data["title"]!,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  )
                : Text(
                    "${data["title"]!}\n($match%)",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  )
          ]));
    }),
  );
}
