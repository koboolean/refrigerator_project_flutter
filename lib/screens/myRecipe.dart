import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';
import 'package:refrigerator_project_flutter/widgets/favoriteGrid.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeDetail.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeAdd.dart';

import '../constants/color.dart';

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
    return Scaffold(
          appBar: AppBar(
            title: Text('나의 레시피'),
          ),
          body: Center(
            child: FoodListView(
              foods: foods,
              callbackFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myRecipeDetail()),
                );
              },
            ),
          ),
          floatingActionButton: Stack(
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => myRecipeAdd()),
                  );
                },
                label: Row(
                  children: [Text("레시피 추가"), Icon(Icons.chevron_right_sharp)],
                ),
                backgroundColor: THEME_COLOR,
              ),
              SizedBox(
                height: 100,
              )
            ],
          )
    );
  }
}
