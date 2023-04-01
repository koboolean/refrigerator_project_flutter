import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/model/recipeCategory.dart';

Widget recipeDialog({required double widthResult, required RecipeCategory recipeCategory, required Function callbackFunc}){
  return AlertDialog(
    content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(recipeCategory.image),
                      fit: BoxFit.fill))),
          SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(recipeCategory.title,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight:
                                FontWeight.w300)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: widthResult * 0.65,
                          child: Text(
                            recipeCategory.item,
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: widthResult * 0.65,
                          child: Text(
                            recipeCategory.necItem,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.red),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                  ],
                )),
          )
        ]),
    contentPadding: EdgeInsets.zero,
    actions: [
      TextButton(
        child: const Text('요리 시작하기'),
        onPressed: () {
          callbackFunc();
        },
      ),
    ],
  );
}
