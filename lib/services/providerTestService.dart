
import 'package:flutter/material.dart';

import '../model/recipeCategory.dart';

class ProviderTestService extends ChangeNotifier{
  List<RecipeCategory> recipeItem= [
    RecipeCategory(
        title: "김치찌개",
        match: "60",
        image:
        "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        item:
        "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        necItem: "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치",
        totalTime: "60"),
    RecipeCategory(
        title: "김치찌개",
        match: "60",
        image:
        "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        item:
        "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        necItem: "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치",
        totalTime: "60"),
    RecipeCategory(
        title: "김치찌개",
        match: "60",
        image:
        "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg",
        item:
        "배추김치, 국간장, 고춧가루111111111111111111111111111111111111111111111111111",
        necItem: "참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치참치",
        totalTime: "60"),
  ];
}