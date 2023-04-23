
import 'package:shared_preferences/shared_preferences.dart';


class TestPreferencesService{
  void setTestPreferences() async{
    // shared_preferences 사용
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("version", 1.0);
  }

  Future<double> getTestPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble("version") ?? 0.0;
  }

  void delTestPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("version");
  }
}
