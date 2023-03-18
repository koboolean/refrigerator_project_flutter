import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';
import 'package:refrigerator_project_flutter/widgets/recipeGrid.dart';

/// 홈페이지
class SearchRecipe extends StatefulWidget {
  const SearchRecipe({Key? key}) : super(key: key);

  @override
  State<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    // 임시 데이터 생성
    var list = [{"title" : "참치찌개", "match" : "60", "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60", "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60", "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60", "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60", "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60", "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60",  "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60",  "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60",  "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60",  "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60",  "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}
              , {"title" : "김치찌개", "match" : "60",  "image" : "https://img-cf.kurly.com/shop/data/goodsview/20211223/gv10000260857_1.jpg"}];

    return Consumer(
      builder: (context, bucketService, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 10,
            elevation: 0,
            title: Text("레시피", style: TextStyle(fontSize : 30, fontWeight: FontWeight.w700, color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          body : Container(
            margin: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: recipeGrid(
                      datas : list,
                      type : true,
                      callbackFunction:(index){
                        var title = list[index]["title"]!;
                        print("$title 값인 $index 번째 데이터가 Callback Function으로 들어왔습니다.");
                      }

                  ),
                )
              ],
          )
          ),
        );
      },
    );
  }
}
