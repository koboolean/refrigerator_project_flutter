import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirstFoodService extends ChangeNotifier{
  Future<QuerySnapshot> getFirstFood() async {
    final firestore = FirebaseFirestore.instance.collection('Test');
    return await firestore.get();
  }
}