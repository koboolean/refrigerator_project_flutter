import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

/// 홈페이지
class MyFridge extends StatefulWidget {
  const MyFridge({Key? key}) : super(key: key);

  @override
  State<MyFridge> createState() => _MyFridgeState();
}

class _MyFridgeState extends State<MyFridge> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    final ValueNotifier<String> version =
    ValueNotifier<String>("1.0"); // ValueNotifier 변수 선언

    return Consumer(
      builder: (context, bucketService, child) {
        return Scaffold(
          body: Column(
          ),
        );
      },
    );
  }
}
