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
