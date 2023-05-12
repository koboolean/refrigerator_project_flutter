import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';

class FirstFoodService extends ChangeNotifier {
  //Test컬렉션
  final obj = FirebaseFirestore.instance.collection('Test');

  //모든 값 들고오기
  Future<QuerySnapshot<Map<String, dynamic>>> getAllFirstFood() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await obj.orderBy('FOODCD').get();
    return querySnapshot;
  }

  //foodcd값을 받아서 delete
  Future<void> deleteItem(String foodCd) async {
    obj
        .where('FOODCD', isEqualTo: foodCd)
        .get()
        .then((QuerySnapshot snapshot) async {
          await snapshot.docs.first.reference.delete(); // 첫 번째 문서를 삭제합니다.
        })
        .then((value) => print("Successfully deleted document"))
        .catchError((error) => print("Failed to update isFavorite: $error"));
  }

  //myRecipeItem Model을 받아서 insert
  //Test컬렉션의 가장 높은 foodCd를 받아 +1하여 index를 올리기
  Future<void> insertMyRecipeItem(myrecipeItem food) async {
    // Test 컬렉션에서 가장 마지막 데이터를 가져옵니다.
    final lastDoc =
        await obj.orderBy('FOODCD', descending: true).limit(1).get();

    int foodCd = 1;
    if (lastDoc.docs.isNotEmpty) {
      // Test 컬렉션에 이미 데이터가 있다면 FOODCD를 자동으로 증가시켜서 저장합니다.
      final lastFood = lastDoc.docs.first.data();
      foodCd = int.parse(lastFood['FOODCD']) + 1;
    }

    food.foodCd = foodCd.toString().padLeft(5, '0');
    food.modifiedDate = DateTime.now();
    // Test 컬렉션에 새로운 데이터를 저장합니다.

    await obj.add(food.toMap());
  }

  //myRecipeItem Model을 받아서 ISFAVORITE update
  Future<void> updateIsFavorite(myrecipeItem food) async {
    print("======firstFoodService updateIsFavorite=======");
    print(food.toMap());
    await obj
        .where('FOODCD', isEqualTo: food.foodCd)
        .get()
        .then((QuerySnapshot snapshot) async {
      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference
            .update({'ISFAVORITE': food.isFavorite});
        print("isFavorite updated");
      } else {
        print("Document not found");
      }
    }).catchError((error) => print("Failed to update isFavorite: $error"));
  }


  //myRecipeItem Model을 받아서 FOODNM update
  
}
