import 'package:flutter/material.dart';

void main() {
  runApp(const tabPage());
}

class tabPage extends StatelessWidget {
  const tabPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: tabBar(),
    );
  }
}

class tabBar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '왼쪽'),
    Tab(text: '오른쪽'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String? label = tab.text;
            return Center(
              child: Text(
                '여기는 $label 탭입니다~',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
