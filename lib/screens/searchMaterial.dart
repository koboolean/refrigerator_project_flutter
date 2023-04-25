import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/screens/recipeResult.dart';

import '../constants/color.dart';
import '../widgets/buttonGrid.dart';

/// 홈페이지
class SearchMaterial extends StatefulWidget {
  const SearchMaterial({Key? key}) : super(key: key);

  @override
  State<SearchMaterial> createState() => _SearchMaterialState();
}

class _SearchMaterialState extends State<SearchMaterial>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  late List<Map<String, String>> itemList = [
    {
      "materialName": "양파", // 식재료 이름
      "materialCategory": "기타", // 식재료 구분
      "materialCount": "3" // 갯수
    },
    {
      "materialName": "돼지고기rrrrrrr", // 식재료 이름
      "materialCategory": "육류", // 식재료 구분
      "materialCount": "300" // 갯수
    },
    {
      "materialName": "양고기", // 식재료 이름
      "materialCategory": "육류", // 식재료 구분
      "materialCount": "200" // 갯수
    },
    {
      "materialName": "고등어", // 식재료 이름
      "materialCategory": "어류", // 식재료 구분
      "materialCount": "300" // 갯수
    },
    {
      "materialName": "루피", // 식재료 이름
      "materialCategory": "원피스", // 식재료 구분
      "materialCount": "300" // 갯수
    },
    {
      "materialName": "나루토", // 식재료 이름
      "materialCategory": "나루토", // 식재료 구분
      "materialCount": "300" // 갯수
    },
    {
      "materialName": "이치고", // 식재료 이름
      "materialCategory": "블리치", // 식재료 구분
      "materialCount": "300" // 갯수
    },
  ];

  // late List<Map<String, String>> addList;

  late String dropDownValue;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //임시데이타

    return MaterialApp(
        title: "재료 관리",
        home: Scaffold(
            appBar: AppBar(
              title: Text("재료 관리"),
              backgroundColor: THEME_COLOR,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropDownTextField(
                          // initialValue: "name4",
                          listSpace: 0,
                          listPadding: ListPadding(top: 1),
                          enableSearch: true,
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownList: const [
                            DropDownValueModel(name: 'name1', value: "value1"),
                            DropDownValueModel(name: 'name2', value: "value2"),
                            DropDownValueModel(name: 'name3', value: "value3"),
                            DropDownValueModel(name: 'name4', value: "value4"),
                            DropDownValueModel(name: 'name5', value: "value5"),
                            DropDownValueModel(name: 'name6', value: "value6"),
                            DropDownValueModel(name: 'name7', value: "value7"),
                            DropDownValueModel(name: 'name8', value: "value8"),
                          ],
                          listTextStyle: const TextStyle(color: Colors.red),
                          dropDownItemCount: 8,

                          onChanged: (val) {
                            dropDownValue = val.name;
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: THEME_COLOR),
                        onPressed: () {
                          setState(() {
                            itemList.add(
                                {"materialName": dropDownValue, "type": "add"});
                          });
                        },
                        child: Text(
                          "추가",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: Text("지금 냉장고 재료", style: TextStyle(fontSize: 20)),
                  ),
                  SingleChildScrollView(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height - 280,
                    child: buttonGrid(
                        datas: itemList, funcRemoveItem: funcRemoveItem),
                  )),

                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 120,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => RecipeResult(),
                  //             ),
                  //           );
                  //         },
                  //         child: Text("레시피 검색"),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            floatingActionButton: Stack(
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    // Add your onPressed code here!

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeResult(),
                          settings: RouteSettings(arguments: itemList)),
                    );
                  },
                  label: Row(
                    children: [Text("레시피 검색"), Icon(Icons.chevron_right_sharp)],
                  ),
                  backgroundColor: THEME_COLOR,
                ),
                SizedBox(
                  height: 100,
                )
              ],
            )));
  }

  funcRemoveItem(int index) {
    setState(() {
      itemList.removeAt(index);
    });
  }
}
