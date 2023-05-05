import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/recipeCategory.dart';
import 'package:refrigerator_project_flutter/services/providerTestService.dart';
import 'package:refrigerator_project_flutter/widgets/recipeDialog.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid_One.dart';

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
          body: recipeGrid_One(datas: list, type: true, callbackFunction: () {
            
          },
          context: context)
        );
      },
    );
  }
}
