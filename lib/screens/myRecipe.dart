import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/recipeList.dart';

/// 홈페이지
class MyRecipe extends StatefulWidget {
  const MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  TextEditingController jobController = TextEditingController();

  // ignore: prefer_final_fields
  List<RecipeItem> _items = [
    RecipeItem(
      headerValue: '피자',
      expandedValue: '2023 01 01',
      isExpanded: false,
    ),
    RecipeItem(
      headerValue: '김치찌게',
      expandedValue: '2023 01 01',
      isExpanded: false,
    ),
    RecipeItem(
      headerValue: '해물파전',
      expandedValue: '2023 01 03',
      isExpanded: false,
    ),
  ];
  bool _showAddButton = true;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    final ValueNotifier<String> version =
    ValueNotifier<String>("1.0"); // ValueNotifier 변수 선언

    return Consumer(
      builder: (context, bucketService, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('나만의 레시피'),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: RecipeList(items: _items, callbackFunction: (index, isExpanded){
                setState(() {
                  _items[index].isExpanded = !isExpanded;
                });
              }),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Do something when the FAB is pressed
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

