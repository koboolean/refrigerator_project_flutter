import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refrigerator_project_flutter/constants/color.dart';
import 'package:refrigerator_project_flutter/screens/homePage.dart';
import 'package:refrigerator_project_flutter/screens/loginPage.dart';
import 'package:refrigerator_project_flutter/services/preferencesTestService.dart';
import 'package:refrigerator_project_flutter/services/providerTestService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/authService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ProviderTestService()),
      ],
      child: const MyApp(),
    ),
  );
}

loadVersion() async{
  double version = await TestPreferencesService().getTestPreferences();
  print("테스트 = " + version.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final user = context.read<AuthService>().currentUser();
    final ThemeData theme = ThemeData();

    // Pref Set
    TestPreferencesService().setTestPreferences();
    loadVersion();

    // Pref Remove
    TestPreferencesService().delTestPreferences();
    loadVersion();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: THEME_COLOR,
        appBarTheme: AppBarTheme(
            color: THEME_COLOR
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: THEME_COLOR
        ),
        colorScheme: theme.colorScheme.copyWith(secondary: THEME_COLOR)
      ),
      debugShowCheckedModeBanner: false,
      home: user == null ? LoginPage() : HomePage(),
    );
  }
}

