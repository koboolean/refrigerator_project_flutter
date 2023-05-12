import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/myRefrigeritem.dart';

final categories = ['과일', '채소', '육류', '수산물', '음료'];
final nameController = TextEditingController();
final dateTimeContoller = TextEditingController();
final quantityController = TextEditingController();
final descriptionController = TextEditingController();
Widget RecipeList(
    {required List<RefrigerItem> items,
    required Function callbackFunction,
    required BuildContext context}) {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      items[index].isExpanded = !isExpanded;
      callbackFunction();
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
                      value: "delete",
                      child: Text('삭제'),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('편집'),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'edit') {
                      nameController.text = item.headerValue;
                      String? categoryValue = item.categoryValue;
                      var dateTimeValue = item.dateTimeValue;
                      dateTimeContoller.text = item.dateTimeValue;
                      quantityController.text = item.quantity;
                      descriptionController.text = item.description;
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
                                    value: categoryValue,
                                    items: categories
                                        .map((category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(category)))
                                        .toList(),
                                    decoration: InputDecoration(
                                      labelText: '분류',
                                    ),
                                    onChanged: (value) {
                                      categoryValue = value;
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: '유통기한',
                                          ),
                                          controller: dateTimeContoller,
                                          onTap: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2020),
                                              lastDate: DateTime(2025),
                                            );
                                            print(picked);
                                            if (picked != null) {
                                              dateTimeContoller.text =
                                                  picked.year.toString() +
                                                      " " +
                                                      picked.month.toString() +
                                                      " " +
                                                      picked.day.toString();
                                              ;
                                              print(dateTimeContoller.text);
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
                                onPressed: () {
                                  Navigator.pop(context); // AlertDialog 닫기
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  item.headerValue = nameController.text;
                                  //warning : null값일때 대비해야함
                                  item.categoryValue = categoryValue!;
                                  item.dateTimeValue = dateTimeContoller.text;
                                  item.quantity = quantityController.text;
                                  item.description = descriptionController.text;
                                  callbackFunction();
                                  Navigator.pop(context); // AlertDialog 닫기
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: THEME_COLOR),
                                child: Text('저장'),
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
                                onPressed: () {
                                  Navigator.pop(context); // AlertDialog 닫기
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  items.remove(item);
                                  callbackFunction();
                                  Navigator.pop(context); // AlertDialog 닫기
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: THEME_COLOR),
                                child: Text('삭제'),
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
