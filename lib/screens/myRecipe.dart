import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';
import 'package:refrigerator_project_flutter/widgets/favoriteGrid.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeDetail.dart';
import 'package:refrigerator_project_flutter/screens/myRecipeAdd.dart';

import '../services/firstFoodService.dart';

/// 홈페이지
class MyRecipe extends StatefulWidget {
  const MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 임시 데이터 생성
  // ignore: prefer_final_fields

  final foods = [
    myrecipeItem(
      foodCd: '00001',
      foodNm: '탕수육',
      // modifiedDate: DateTime.now(),
      // isFavorite: true,
    ),
    myrecipeItem(
      foodCd: '00002',
      foodNm: '김치찌게',
      // modifiedDate: DateTime.now().subtract(Duration(days: 1)),
      // isFavorite: false,
    ),
    myrecipeItem(
      foodCd: '00003',
      foodNm: '햄버거',
      // modifiedDate: DateTime.now().subtract(Duration(days: 2)),
      // isFavorite: true,
    ),
  ];

  // bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('나의 레시피'),
          backgroundColor: THEME_COLOR,
        ),
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: FirstFoodService().getAllFirstFood(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return Text('데이터를 불러오는 중 오류가 발생하였습니다.');
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            List<DocumentSnapshot<Map<String, dynamic>>> documents =
                snapshot.data!.docs;

            for (var document in documents) {
              // Do something with the document snapshot
              print("myRecipe.dart");
              print(document.data());
            }

            // DocumentSnapshot 타입을 사용하여 데이터를 사용합니다.
            return FoodListView(
              foods: documents
                  .map((doc) => myrecipeItem(
                        foodCd: doc['FOODCD'],
                        foodNm: doc['FOODNM'],

                        modifiedDate:
                            doc['MODIFIEDDATE'].toDate() ?? DateTime.now(),
                        // isFavorite: doc['FOODCD'],
                      ))
                  .toList(),
              callbackFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myRecipeDetail()),
                );
              },
            );
          },
        ),
        floatingActionButton: Stack(
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!

                // print(firstfood);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myRecipeAdd()),
                );
              },
              label: Row(
                children: [Text('레시피 추가')],
              ),
              backgroundColor: THEME_COLOR,
            ),
            SizedBox(
              height: 100,
            )
          ],
        ));
  }
}
