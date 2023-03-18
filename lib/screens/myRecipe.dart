import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

/// 홈페이지
class MyRecipe extends StatefulWidget {
  const MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  TextEditingController jobController = TextEditingController();
  // ignore: prefer_final_fields
  List<Item> _items = [
    Item(
      headerValue: '피자',
      expandedValue: '2023 01 01',
      isExpanded: false,
    ),
    Item(
      headerValue: '김치찌게',
      expandedValue: '2023 01 01',
      isExpanded: false,
    ),
    Item(
      headerValue: '해물파전',
      expandedValue: '2023 01 03',
      isExpanded: false,
    ),
  ];
  bool _showAddButton = true;

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
            title: Text('나만의 레시피'),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: _buildPanel(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Do something when the FAB is pressed
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _items[index].isExpanded = !isExpanded;
        });
      },
      children: _items.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  String headerValue;
  String expandedValue;
  bool isExpanded;
}
