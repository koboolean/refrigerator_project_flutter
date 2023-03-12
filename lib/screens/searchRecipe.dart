import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/services/auth_service.dart';

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
