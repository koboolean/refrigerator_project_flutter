import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/screens/myPage.dart';
import 'package:refrigerator_project_flutter/screens/myRecipe.dart';
import 'package:refrigerator_project_flutter/screens/myRefriger.dart';
import 'package:refrigerator_project_flutter/screens/searchMaterial.dart';
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
    SearchMaterial(), // 레시피 검색
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
          selectedItemColor: THEME_COLOR,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              activeIcon: Icon(Icons.kitchen, color: THEME_COLOR),
              label: '냉장고',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              activeIcon: Icon(Icons.menu_book, color: THEME_COLOR),
              label: '레시피 검색',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.create),
                activeIcon: Icon(Icons.create, color: THEME_COLOR),
                label: '나의 레시피'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                activeIcon: Icon(Icons.account_circle, color: THEME_COLOR),
                label: 'MY페이지'),
          ],
        ),
      ),
    );
  }
}
