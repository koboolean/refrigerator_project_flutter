import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/recipeCategory.dart';

/**
 * type : "edit", "view"
 */
Widget recipeDialog({required double widthResult, required RecipeCategory recipeCategory, required String type, required Function callbackFunc}){
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
                        type == "edit" ?
                        SizedBox(
                          width: widthResult * 0.65,
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: THEME_COLOR)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: THEME_COLOR_FOCUS)),
                                hintText: "음식명을 입력하세요"

                            ),
                            style: TextStyle(fontSize: 15
                            ),
                          ),
                        ) :
                        Text(recipeCategory.title,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight:
                                FontWeight.w300))
                      ]
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [ type == "edit" ?
                            Row(
                              children: [SizedBox(
                                width: widthResult * 0.25,
                                child: TextField(
                                                keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: THEME_COLOR)),
                                                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: THEME_COLOR_FOCUS)),
                                                    hintText: "소요시간 입력",
                                                    hintStyle: TextStyle(fontSize: 15)

                                        ),
                                  style: TextStyle(fontSize: 15
                                  ),
                                ),
                              ), Text("분")]
                            )
                          : Text("총 소요시간 : ${recipeCategory.totalTime}분",
                                       style: TextStyle(
                                           fontSize: 15,
                                           fontWeight:FontWeight.w300))],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: widthResult * 0.65,
                          child: Text(
                            type == "edit" ? "레시피 챕터추가를 통해 재료를 등록(취합) 합니다." : recipeCategory.item,
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                    if(type == "view")
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
        child: type == "edit" ? const Text('레시피 등록하기') : const Text('요리 시작하기'),
        onPressed: () {
          callbackFunc();
        },
      ),
    ],
  );
}
