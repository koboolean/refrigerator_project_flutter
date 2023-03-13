import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/screens/myPage.dart';
import 'package:refrigerator_project_flutter/screens/myRecipe.dart';
import 'package:refrigerator_project_flutter/screens/myRefriger.dart';
import 'package:refrigerator_project_flutter/screens/searchRecipe.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

/// 홈페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _childrenWidget = [
    MyFridge(), // 나의 냉장고
    SearchRecipe(), // 레시피 검색
    MyRecipe(), // 나의 레시피
    MyPage() // 마이페이지
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    return Scaffold(
      extendBody: true,
      body: _childrenWidget[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _currentIndex,
          selectedItemColor: Color.fromRGBO(221, 81, 37, 1),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              activeIcon: Icon(Icons.kitchen, color: Color.fromRGBO(221, 81, 37, 1)),
              label: '냉장고',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              activeIcon: Icon(Icons.menu_book, color: Color.fromRGBO(221, 81, 37, 1)),
              label: '레시피 검색',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.create),
                activeIcon: Icon(Icons.create, color: Color.fromRGBO(221, 81, 37, 1)),
                label: '나의 레시피'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                activeIcon: Icon(Icons.account_circle, color: Color.fromRGBO(221, 81, 37, 1)),
                label: 'MY페이지'),
          ],
        ),
      ),
    );
  }
}
