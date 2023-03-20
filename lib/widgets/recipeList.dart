import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';

Widget RecipeList({
        required List<RecipeItem> items
      , required Function callbackFunction}) {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      callbackFunction(index, isExpanded);
    },
    children: items.map<ExpansionPanel>((RecipeItem item) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(item.headerValue),
          );
        },
        body: ListTile(
          title: Text(item.expandedValue),
        ),
        isExpanded: item.isExpanded,
      );
    }).toList(),
  );
}
