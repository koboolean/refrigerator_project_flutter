// import 'package:flutter/cupertino.dart';

// import 'package:provider/provider.dart';
// import 'package:refrigerator_project_flutter/model/recipeItem.dart';
// import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';
// import 'package:refrigerator_project_flutter/services/auth_service.dart';

// import 'package:refrigerator_project_flutter/widgets/recipeList.dart';
// import 'package:refrigerator_project_flutter/widgets/favoriteGrid.dart';

// ignore_for_file: camel_case_types

// import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeAdd.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid_One.dart';

class myRecipeDetail extends StatelessWidget {
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

  myRecipeDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '레시피상세',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('레시피 상세'),
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
            type: true,
            callbackFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => myRecipeAdd()),
              );
            },
            context: context,
          ),
        ),
      ),
    );
  }
}
