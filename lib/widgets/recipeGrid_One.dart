import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _timeController = TextEditingController();
final _textController = TextEditingController();
Widget recipeGrid_One(
    {required List<Map<String, String>> datas,
    required bool type,
    required Function callbackFunction,
    required BuildContext context}) {
  return GridView.count(
    shrinkWrap: true,
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    // padding
    crossAxisCount: 1,
    // 한 열에 보여줄 갯수

    // 상하비율
    children: List.generate(datas.length, (index) {
      var data = datas[index];
      var match = data["match"]!;
      return GestureDetector(
          onTap: () {
            callbackFunction();
            // callbackFunction 호출하여 작업할까 고민중... (재사용 관련)
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       contentPadding: EdgeInsets.all(16.0),
            //       content: Container(
            //         width: MediaQuery.of(context).size.width,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             // 이미지
            //             Image.network(
            //               'https://via.placeholder.com/150',
            //               width: MediaQuery.of(context).size.width,
            //               height: 100,
            //               fit: BoxFit.cover,
            //             ),
            //             SizedBox(height: 16.0),
            //             // 텍스트 입력 필드
            //             TextField(
            //               controller: _textController,
            //               decoration: InputDecoration(
            //                 hintText: '음식명을 입력하세요',
            //                 border: OutlineInputBorder(),
            //               ),
            //             ),
            //             SizedBox(height: 16.0),
            //             // 소요 시간 입력 필드
            //             Row(
            //               children: <Widget>[
            //                 Expanded(
            //                   child: TextField(
            //                     controller: _timeController,
            //                     keyboardType: TextInputType.number,
            //                     inputFormatters: <TextInputFormatter>[
            //                       FilteringTextInputFormatter.digitsOnly
            //                     ],
            //                     decoration: InputDecoration(
            //                       hintText: '소요 시간 입력',
            //                       border: OutlineInputBorder(),
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(width: 16.0),
            //                 Text('분'),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       actions: <Widget>[
            //         TextButton(
            //           child: Text('취소'),
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //         ),
            //         TextButton(
            //           child: Text('레시피 등록하기'),
            //           onPressed: () {
            //             // 사용자가 입력한 값 가져오기
            //             String text = _textController.text;
            //             int time = int.parse(_timeController.text);

            //             // TODO: 레시피 등록 로직 추가

            //             // 팝업 닫기
            //             Navigator.of(context).pop();
            //           },
            //         ),
            //       ],
            //     );
            //   },
            // );
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
