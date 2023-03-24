import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/recipeList.dart';
import 'package:refrigerator_project_flutter/widgets/favoriteGrid.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeDetail.dart';

/// 홈페이지
class MyRecipe extends StatefulWidget {
  const MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  // 임시 데이터 생성
  // ignore: prefer_final_fields
  final foods = [
    myrecipeItem(
      title: '피자',
      modifiedDate: DateTime.now(),
      isFavorite: true,
    ),
    myrecipeItem(
      title: '김치찌게',
      modifiedDate: DateTime.now().subtract(Duration(days: 1)),
      isFavorite: false,
    ),
    myrecipeItem(
      title: '햄버거',
      modifiedDate: DateTime.now().subtract(Duration(days: 2)),
      isFavorite: true,
    ),
  ];

  // bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food App'),
        ),
        body: Center(
          child: FoodListView(
            foods: foods,
            callbackFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myRecipeDetail(),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
