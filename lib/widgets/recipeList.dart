import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';
import 'package:refrigerator_project_flutter/model/myRefrigeritem.dart';

final categories = ['과일', '채소', '육류', '수산물', '음료'];
final nameController = TextEditingController();
final quantityController = TextEditingController();
final descriptionController = TextEditingController();
Widget RecipeList(
    {required List<RefrigerItem> items,
    required Function callbackFunction,
    required BuildContext context}) {
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
              Text(item.quantity),
            ]),
            subtitle: Text(item.dateTimeValue),
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
                      value: "delete",
                    ),
                    const PopupMenuItem(
                      child: Text('편집'),
                      value: 'edit',
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'edit') {
                      nameController.text = item.headerValue;
                      item.categoryValue = item.categoryValue;
                      quantityController.text = item.quantity;
                      // descriptionController.text = item.description;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('재료 편집하기'),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: '재료명',
                                    ),
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: categories[0],
                                    items: categories
                                        .map((category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(category)))
                                        .toList(),
                                    decoration: InputDecoration(
                                      labelText: '분류',
                                    ),
                                    onChanged: (value) {},
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: '유통기한',
                                          ),
                                          onTap: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2020),
                                              lastDate: DateTime(2025),
                                            );
                                            if (picked != null) {
                                              // 선택된 날짜를 처리하는 코드
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    controller: quantityController,
                                    decoration: InputDecoration(
                                      labelText: '개수와 무게',
                                    ),
                                  ),
                                  TextField(
                                    controller: descriptionController,
                                    decoration: InputDecoration(
                                      labelText: '설명',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '취소',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('저장'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: THEME_COLOR),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    if (value == 'delete') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('삭제하시겠습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '취소',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('삭제'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: THEME_COLOR),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                )
              ],
            )),
        isExpanded: item.isExpanded,
      );
    }).toList(),
  );
}
