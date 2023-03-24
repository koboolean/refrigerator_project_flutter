import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/model/recipeItem.dart';
import 'package:refrigerator_project_flutter/widgets/recipeList.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

/// 홈페이지
class MyFridge extends StatefulWidget {
  const MyFridge({Key? key}) : super(key: key);

  @override
  State<MyFridge> createState() => _MyFridgeState();
}

class _MyFridgeState extends State<MyFridge> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    TabController? _tabController;

    @override
    void initState() {
      _tabController = TabController(length: 2, vsync: this);
      super.initState();
    }

    return Scaffold(
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
                      padding: EdgeInsets.fromLTRB(8, 15, 4, 15),
                      child: Text(
                        "add",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
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
                          Container(
                            child: RecipeList(
                              items: _items,
                              callbackFunction: (index, isExpanded) {
                                setState(
                                  () {
                                    _items[index].isExpanded = !isExpanded;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Colors.green[200],
                            alignment: Alignment.center,
                            child: Text(
                              'Tab2 View',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.blue[200],
                            alignment: Alignment.center,
                            child: Text(
                              'Tab3 View',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
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
