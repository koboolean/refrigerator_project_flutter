// import 'package:flutter/cupertino.dart';

// import 'package:provider/provider.dart';
// import 'package:refrigerator_project_flutter/model/recipeItem.dart';
// import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';
// import 'package:refrigerator_project_flutter/services/authService.dart';

// import 'package:refrigerator_project_flutter/widgets/recipeList.dart';
// import 'package:refrigerator_project_flutter/widgets/favoriteGrid.dart';

// ignore_for_file: camel_case_types

// import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeAdd.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid_One.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';

class myRecipeDetail extends StatefulWidget {

  myRecipeDetail({super.key});

  @override
  State<myRecipeDetail> createState() => _myRecipeDetailState();
}

class _myRecipeDetailState extends State<myRecipeDetail> {
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
    return  Scaffold(
        appBar: AppBar(
          title: Text('레시피 상세'),
          backgroundColor: THEME_COLOR,
          actions: [
            IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => myRecipeAdd()),
                  );
                }),
            // IconButton(
            //   icon: const Icon(Icons.navigate_next),
            //   tooltip: 'Next page',
            //   onPressed: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(builder: (context) => myRecipe()),
            //     // );
            //   },
            // ),
          ],
        ),
        body: Center(
          child: recipeGrid_One(
            datas: list,
            type: false,
            callbackFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => myRecipeAdd()),
              );
            },
            context: context,
          ),
        ),
      );
  }
}
