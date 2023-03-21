import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

/// 홈페이지
class SearchMaterial extends StatefulWidget {
  const SearchMaterial({Key? key}) : super(key: key);

  @override
  State<SearchMaterial> createState() => _SearchMaterialState();
}

class _SearchMaterialState extends State<SearchMaterial> with TickerProviderStateMixin {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    TabController? _tabController;

    @override
    void initState() {
      _tabController = TabController(length: 2, vsync: this);
      super.initState();
    } // ValueNotifier 변수 선언

    return Scaffold(
      appBar: AppBar(
        title: Text("냉장고 관리"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
