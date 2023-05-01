import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/services/providerTestService.dart';
import 'package:refrigerator_project_flutter/widgets/recipeDialog.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';

/// 홈페이지
class RecipeResult extends StatefulWidget {
  const RecipeResult({Key? key}) : super(key: key);

  @override
  State<RecipeResult> createState() => _RecipeResultState();
}

class _RecipeResultState extends State<RecipeResult> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    log(arguments.toString());
    //[{materialName: 양파, materialCategory: 기타, materialCount: 3}, {materialName: 돼지고기rrrrrrr, materialCategory: 육류, materialCount: 300}, {materialName: 양고기, materialCategory: 육류, materialCount: 200}, {materialName: 고등어, materialCategory: 어류, materialCount: 300}, {materialName: 루피, materialCategory: 원피스, materialCount: 300}, {materialName: 나루토, materialCategory: 나루토, materialCount: 300}, {materialName: 이치고, materialCategory: 블리치, materialCount: 300}, {materialName: name2, type: add}, {materialName: name2, type: add}, {materialName: name2, type: add}]

    final width = MediaQuery.of(context).size.width;

    return Consumer<ProviderTestService>(
      builder: (context, providerTestService, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            elevation: 0,
            title: Text("레시피",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w200,
                    color: Colors.white)),
            backgroundColor: THEME_COLOR,
          ),
          body: recipeGrid(
              datas: providerTestService.recipeItem,
              type: true,
              callbackFunction: (index) {
                var data = providerTestService.recipeItem[index];
                var type = "view"; // type - edit, view
                return showDialog(
                    context: context,
                    barrierDismissible: type == "edit"
                        ? false
                        : true, // 바깥 영역 터치시 닫을지 여부 (edit일 경우 false)
                    builder: (BuildContext context) {
                      return recipeDialog(
                          widthResult: width,
                          recipeCategory: data,
                          type: type,
                          callbackFunc: () {
                            print("data${data.title}");
                          });
                    });
              }),
        );
      },
    );
  }
}
