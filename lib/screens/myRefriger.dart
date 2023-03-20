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

class _MyFridgeState extends State<MyFridge> {
  TextEditingController jobController = TextEditingController();

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
            title: Text("냉장고 관리"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 18),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 5),
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
              SizedBox(
                height: 20,
              ),
              Row(children: [
                DefaultTabController(
                  initialIndex: 1,
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text('TabBar Widget'),
                      bottom: const TabBar(
                        tabs: <Widget>[
                          Tab(
                            text: "전체",
                          ),
                          Tab(
                            text: "유통기한 임박",
                          ),
                          Tab(
                            text: "최근 차감된 재료",
                          ),
                        ],
                      ),
                    ),
                    body: const TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text("ListView-1"),
                        ),
                        Center(
                          child: Text("ListView-2"),
                        ),
                        Center(
                          child: Text("ListView-3"),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}
