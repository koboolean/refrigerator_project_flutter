import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';
import 'package:refrigerator_project_flutter/model/myRefrigeritem.dart';

Widget RecipeList(
    {required List<RefrigerItem> items, required Function callbackFunction}) {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      callbackFunction(index, isExpanded);
    },
    children: items.map<ExpansionPanel>((RefrigerItem item) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(item.headerValue),
            trailing: Wrap(children: [
              Text(item.headersubValue),
            ]),
            subtitle: Text(item.expandedValue),
          );
        },
        body: ListTile(
            title: Text(item.categoryValue),
            trailing: Wrap(
              children: [
                PopupMenuButton(
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text('삭제'),
                    ),
                    const PopupMenuItem(
                      child: Text('편집'),
                    ),
                  ],
                )
              ],
            )),
        isExpanded: item.isExpanded,
      );
    }).toList(),
  );
}
