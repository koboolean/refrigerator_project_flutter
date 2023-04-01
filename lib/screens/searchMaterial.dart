import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/buttonGrid.dart';

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
    var list = [
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
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("재료 관리"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: DropDownTextField(
                        // initialValue: "name4",

                        listSpace: 20,
                        listPadding: ListPadding(top: 20),
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

                        onChanged: (val) {},
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
                  child: buttonGrid(
                    datas: list,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
