import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/recipeCategory.dart';
import 'package:refrigerator_project_flutter/services/providerTestService.dart';
import 'package:refrigerator_project_flutter/widgets/recipeDialog.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid_One.dart';
import 'package:refrigerator_project_flutter/widgets/statefulAlertWidget.dart';

/// 홈페이지
class RecipeMain extends StatefulWidget {
  var recipeData;
  RecipeMain({Key? key, required this.recipeData}) : super(key: key);

  @override
  State<RecipeMain> createState() => _RecipeMainState();
}

class _RecipeMainState extends State<RecipeMain> {
  TextEditingController jobController = TextEditingController();

  final list = [
    {
      "step": "Intro",
      "title": "참치찌개",
      "time": "60",
      "contents": "갈비찜을밥위에올려주세요",
      "match": "60",
      "image":
      "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"
    },
    {
      "step": "Step1",
      "title": "참치찌개",
      "time": "30",
      "contents": "갈비찜을밥이랑비벼주세요",
      "match": "60",
      "image":
      "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"
    },
    {
      "step": "Step2",
      "title": "참치찌개",
      "time": "90",
      "contents": "내가제일좋아하는갈비찜덮밥",
      "match": "60",
      "image":
      "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"
    },
    {
      "step": "Step3",
      "title": "참치찌개",
      "time": "90",
      "contents": "내가제일좋아하는갈비찜덮밥",
      "match": "60",
      "image":
      "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Consumer<ProviderTestService>(
      builder: (context, providerTestService, child) {
        RecipeCategory data  = widget.recipeData;
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            elevation: 0,
            title: Text(data.title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w200,
                    color: Colors.white)),
            backgroundColor: THEME_COLOR,
          ),
          body: recipeGrid_One(datas: list, type: true, callbackFunction: (data) {
            String time2Str = data["time"];

            // Timer쓸 경우 Stateful하지 못하여 시간초가 안늘어나는 현상 발생
            //showStatefulWidgetDialog(context);
            // 변수 초기화
            final Stopwatch _stopwatch = Stopwatch();
            late Timer _timer;
            Duration _elapsedTime = Duration.zero;

            int time = int.parse(time2Str);

            return showDialog(
              builder: (_) {
                return AlertDialog(
                  content:  StatefulBuilder(
                builder: (__, StateSetter setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(children: [Text(style: TextStyle(fontSize: 20.0),"예상 조리시간(분) : $time2Str")]),
                      SizedBox(height: 10),
                      Text(
                        '${_elapsedTime.inMinutes}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0')}',
                        style: TextStyle(fontSize: 60.0),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed:() {
                              _timer = Timer.periodic(Duration(milliseconds: 100), (timer){
                                setState(() {
                                  _elapsedTime = _stopwatch.elapsed;
                                });
                                _stopwatch.start();
                              });

                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                            child: Text("Start", style: TextStyle(color: Colors.black),),
                          ),
                          SizedBox(width: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_timer != null) {
                                _timer.cancel();
                              }
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                            child: Text("Stop", style: TextStyle(color: Colors.black),),
                          ),
                          SizedBox(width: 10.0),
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                _stopwatch.reset();
                                _elapsedTime = Duration.zero;
                              });
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                            child: Text("Reset", style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      ),
                    ],
                  );
                  }
                  ),
                );
              }, context: context,
            );
          },
          context: context)
        );
      },
    );
  }
}
