import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';

Widget buttonGrid({required List<Map<String, String>> datas}) {
  final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 55, 218, 209),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0));

  return GridView.count(
    shrinkWrap: true,
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),

    // padding
    crossAxisCount: 3,
    // 한 열에 보여줄 갯수
    childAspectRatio: 2 / 1,
    // 상하비율
    children: List.generate(datas.length, (index) {
      var data = datas[index];
      return Stack(children: [
        SizedBox(
          width: 100,
          height: 50,
          child: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 3, 3),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  data["materialName"]!,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
        ),
        Positioned(
            top: 1,
            right: 1,
            width: 25,
            height: 25,
            child: ElevatedButton(
              style: style,
              onPressed: () {},
              child: Text(
                "ㅡ",
              ),
            ))
      ]);
    }),
  );
}
