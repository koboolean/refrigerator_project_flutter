import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/screens/recipeResult.dart';
import 'package:refrigerator_project_flutter/screens/searchMaterial.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';

/// 홈페이지
class SearchRecipe extends StatefulWidget {
  const SearchRecipe({Key? key}) : super(key: key);

  @override
  State<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, bucketService, child) {
        return Scaffold(
          extendBody: true,
          body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeResult()));
                        },
                        child: Text("레시피 검색")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchMaterial()));
                        },
                        child: Text("재료 검색"))
                  ],
                )),
          ),
        );
      },
    );
  }
}
