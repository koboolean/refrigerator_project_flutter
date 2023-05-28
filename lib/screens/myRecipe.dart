import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';

import '../services/firstFoodService.dart';
import '../widgets/foodListView.dart';
import '../widgets/recipeDialog.dart';

/// 홈페이지
class MyRecipe extends StatefulWidget {
  const MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  // 임시 데이터 생성
  // ignore: prefer_final_fields

  bool isFavorite = false;

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
              // print("myRecipe.dart");
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
                        isFavorite: doc['ISFAVORITE'], totalTime: '',
                      ))
                  .toList(),
              callbackFunction: () async {
                final snapshot2 = (await FirstFoodService().getAllFirstFood());
                setState(() {
                  documents = snapshot2.docs;
                });
              },
            );
          },
        ),
        floatingActionButton: Stack(
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible:
                        true, // 바깥 영역 터치시 닫을지 여부 (edit일 경우 false)
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState){
                            return recipeDialog(
                                context: context,
                                widthResult: MediaQuery.of(context).size.width,
                                recipeCategory: null,
                                type: "edit",
                                callbackFunc: (foodItem){
                                    setItem(foodItem);
                                },
                            );
                          });
                    });
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

  setItem(foodItem) async {
    await FirstFoodService().insertMyRecipeItem(foodItem);
  }
}
