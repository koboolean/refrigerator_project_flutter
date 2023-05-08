import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirstFoodService extends ChangeNotifier {
  final obj = FirebaseFirestore.instance.collection('Test');

  Future<QuerySnapshot<Map<String, dynamic>>> getAllFirstFood() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await obj.get();

    return querySnapshot;
  }

  void deleteItem(String foodCd) {
    obj.where('FOODCD', isEqualTo: foodCd).get().then((QuerySnapshot snapshot) {
      snapshot.docs.first.reference.delete(); // 첫 번째 문서를 삭제합니다.
    });
  }
}
