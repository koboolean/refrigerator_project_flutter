import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/model/myrecipeItem.dart';

String getLastModifiedDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date).inDays;

  if (difference == 0) {
    return '오늘';
  } else if (difference == 1) {
    return '어제';
  } else {
    return '$difference 일 전';
  }
}

Widget FoodListView({required foods, required Function callbackFunction}) {
  return ListView.builder(
    itemCount: foods.length,
    itemBuilder: (context, index) {
      final food = foods[index];
      return ListTile(
        title: Text(food.title),
        subtitle: Text('수정시간: ${getLastModifiedDate(food.modifiedDate)}'),
        trailing: Icon(
          food.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onTap: () {
          // TODO: 음식 레시피 상세 페이지로 이동하는 코드 구현
          callbackFunction();
        },
      );
    },
  );
}
