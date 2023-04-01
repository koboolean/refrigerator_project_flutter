import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid_One.dart';
import 'package:refrigerator_project_flutter/widgets/recipeList.dart';
import 'package:refrigerator_project_flutter/widgets/favoriteGrid.dart';

import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';

class myRecipeDetail extends StatelessWidget {
  var list = [
    {
      "title": "참치찌개",
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
          title: Text('레시피 상세'),
        ),
        body: Center(
          child: recipeGrid_One(
            datas: list,
            type: true,
            callbackFunction: () {},
          ),
        ),
      ),
    );
  }
}
