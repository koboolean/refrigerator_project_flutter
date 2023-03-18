import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget recipeGrid({
        required List<Map<String,String>> datas,
        required bool type,
        required Function callbackFunction}){
  return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2),
      itemCount: datas.length,
      itemBuilder: (context, index) {
        var data = datas[index];
        var match = data['match']!;
        return GestureDetector(
          onTap: (){
            // callbackFunction 호출하여 작업할까 고민중... (재사용 관련)
            callbackFunction(index);
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                  width: 170,
                  decoration : BoxDecoration(
                              image: DecorationImage(
                              image : NetworkImage(data["image"]!),
                              fit: BoxFit.fill
                              )
                  )
              ),
              (!type) ? Text( data["title"]!, style: TextStyle(fontSize : 16), overflow: TextOverflow.fade, maxLines: 1,) :
              Text("${data["title"]!}($match%)", style: TextStyle(fontSize : 16), overflow: TextOverflow.fade, maxLines: 1,)
            ]
            )
        );
      }
  );
}
