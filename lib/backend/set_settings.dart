import 'package:shared_preferences/shared_preferences.dart';

class SetSettings {
  Future<void> setSettings(key, value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool(key, value);
  }
}
