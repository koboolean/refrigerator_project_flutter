import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/myRefrigeritem.dart';
import 'package:refrigerator_project_flutter/widgets/recipeList.dart';
import 'package:refrigerator_project_flutter/services/authService.dart';

/// 홈페이지
class MyFridge extends StatefulWidget {
  const MyFridge({Key? key}) : super(key: key);

  @override
  State<MyFridge> createState() => _MyFridgeState();
}

class _MyFridgeState extends State<MyFridge> with TickerProviderStateMixin {
  TextEditingController jobController = TextEditingController();

  // ignore: prefer_final_fields
  List<RefrigerItem> _items = [
    RefrigerItem(
      headerValue: '당근',
      quantity: "100g",
      dateTimeValue: '2023 01 01',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '김치찌게',
      quantity: "100g",
      dateTimeValue: '2023 01 01',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
    RefrigerItem(
      headerValue: '해물파전',
      quantity: "100g",
      dateTimeValue: '2023 01 03',
      categoryValue: "야채",
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    TabController? _tabController;

    @override
    void initState() {
      _tabController = TabController(length: 3, vsync: this);
      super.initState();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("냉장고 관리"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Material Search",
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        ),
                      )),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: THEME_COLOR,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 15, 15, 15),
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: THEME_COLOR,
                      border: Border.all(
                        color: THEME_COLOR,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('재료 추가하기'),
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
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '취소',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // 추가하는 코드
                                      Navigator.pop(context);
                                    },
                                    child: Text('저장'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: THEME_COLOR),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'add',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBar(
                      tabs: [
                        Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '전체',
                          ),
                        ),
                        Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '유통기한 임박',
                          ),
                        ),
                        Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '최근 차감된 재료',
                          ),
                        ),
                      ],
                      // indicator: BoxDecoration(
                      //   gradient: LinearGradient(
                      //     //배경 그라데이션 적용
                      //     begin: Alignment.centerLeft,
                      //     end: Alignment.centerRight,
                      //     colors: [
                      //       Colors.blueAccent,
                      //       Colors.pinkAccent,
                      //     ],
                      //   ),
                      // ),
                      labelColor: THEME_COLOR,
                      unselectedLabelColor: Color.fromARGB(255, 165, 165, 165),
                      controller: _tabController,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: RecipeList(
                              items: _items,
                              callbackFunction: (index, isExpanded) {
                                setState(
                                  () {
                                    _items[index].isExpanded = !isExpanded;
                                  },
                                );
                              },
                              context: context,
                            ),
                          ),
                          Container(
                              // color: Colors.green[200],
                              // alignment: Alignment.center,
                              // child: Text(
                              //   'Tab2 View',
                              //   style: TextStyle(
                              //     fontSize: 30,
                              //   ),
                              // ),
                              ),
                          Container(
                              // color: Colors.blue[200],
                              // alignment: Alignment.center,
                              // child: Text(
                              //   'Tab3 View',
                              //   style: TextStyle(
                              //     fontSize: 30,
                              //   ),
                              // ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
