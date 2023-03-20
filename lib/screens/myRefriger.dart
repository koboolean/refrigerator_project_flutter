import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

/// 홈페이지
class MyFridge extends StatefulWidget {
  const MyFridge({Key? key}) : super(key: key);

  @override
  State<MyFridge> createState() => _MyFridgeState();
}

class _MyFridgeState extends State<MyFridge> with TickerProviderStateMixin {
  TextEditingController jobController = TextEditingController();

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
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 230,
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
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 18),
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 20,
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
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                    child: Text(
                      "add",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height-120,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Tab1',
                        ),
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Tab2',
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        //배경 그라데이션 적용
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blueAccent,
                          Colors.pinkAccent,
                        ],
                      ),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    controller: _tabController,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          color: Colors.yellow[200],
                          alignment: Alignment.center,
                          child: Text(
                            'Tab1 View',
                            style: TextStyle(
                              fontSize: 30,
                            ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
