import 'package:flutter/material.dart';
import 'package:refrigerator_project_flutter/services/firstFoodService.dart';

import '../model/myrecipeItem.dart';
import 'myRecipe.dart';

class myRecipeAdd extends StatefulWidget {
  const myRecipeAdd({super.key});

  @override
  _RecipeRegistrationScreenState createState() =>
      _RecipeRegistrationScreenState();
}

class _RecipeRegistrationScreenState extends State<myRecipeAdd> {
  // 필요한 변수 선언
  String _chapterTitle = "";
  String _timeRequired = "";
  String _description = "";
  final String _imagePath = ""; // 이미지 경로 저장 변수
  final firstfood = FirstFoodService();

  // 이미지 선택 함수
  Future<void> _getImage() async {
    // 이미지 선택 코드 구현
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피 등록'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: '챕터 제목',
                ),
                onChanged: (value) {
                  setState(() {
                    _chapterTitle = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '소요 시간',
                ),
                onChanged: (value) {
                  setState(() {
                    _timeRequired = value;
                  });
                },
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  await _getImage();
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // child: _imagePath.isNotEmpty
                  //     ? Image.file(File(_imagePath),
                  //      fit: BoxFit.cover)
                  //     : Icon(Icons.add_a_photo),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '설명',
                ),
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // 등록 버튼 클릭 시 실행될 코드 구현
                  // ignore: unused_local_variable
                  final food = myrecipeItem(
                    foodCd: _chapterTitle,
                    foodNm: _description,
                    modifiedDate: DateTime.now(),
                  );

                  firstfood.obj.add(food.toMap());

                  // Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyRecipe()),
                  );
                },
                child: Text('등록'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
