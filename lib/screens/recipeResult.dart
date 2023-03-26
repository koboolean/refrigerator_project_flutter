import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';

/// 홈페이지
class RecipeResult extends StatefulWidget {
  const RecipeResult({Key? key}) : super(key: key);

  @override
  State<RecipeResult> createState() => _RecipeResultState();
}

class _RecipeResultState extends State<RecipeResult> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    final width = MediaQuery.of(context).size.width;
    // 임시 데이터 생성
    var list = [
      {
        "title": "참치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"

      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      },
      {
        "title": "김치찌개",
        "match": "60",
        "image": "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        "item" : "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        "necItem" : "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치"
      }
    ];

    return Consumer(
      builder: (context, bucketService, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            elevation: 0,
            title: Text("레시피",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w200,
                    color: Colors.white)),
            backgroundColor: THEME_COLOR,
          ),
          body: recipeGrid(
              datas: list,
              type: true,
              callbackFunction: (index) {
                var data = list[index];
                return showDialog(
                    context: context,
                    barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(data["image"]!),
                                          fit: BoxFit.fill))),
                              SingleChildScrollView(
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(data["title"]!,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w300)),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.65,
                                              child: Text(
                                                data["item"]!,
                                                style: TextStyle(fontSize: 12),
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.65,
                                              child: Text(
                                                data["necItem"]!,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red),
                                                overflow: TextOverflow.fade,
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ]),
                        contentPadding: EdgeInsets.zero,
                        actions: [
                          TextButton(
                            child: const Text('요리 시작하기'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                var title = list[index]["title"]!;
                print("$title 값인 $index 번째 데이터가 Callback Function으로 들어왔습니다.");
              }),
        );
      },
    );
  }
}
