import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../services/firstFoodService.dart';

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
      print("namo");
      print(food.toMap());
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: '수정',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              // TODO: 수정 버튼을 눌렀을 때의 동작 구현
              print('수정 버튼 눌림');
            },
          ),
          IconSlideAction(
            caption: '삭제',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              // TODO: 삭제 버튼을 눌렀을 때의 동작 구현
              print(food.foodCd);
              FirstFoodService().deleteItem(food.foodCd);
            },
          ),
        ],
        child: ListTile(
          title: Text(food.foodNm),
          subtitle: Text('수정시간: ${getLastModifiedDate(food.modifiedDate)}'),
          trailing: Icon(
            food.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onTap: () {
            // TODO: 음식 레시피 상세 페이지로 이동하는 코드 구현
            callbackFunction();
          },
        ),
      );
    },
  );
}
