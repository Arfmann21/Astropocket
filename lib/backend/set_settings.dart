import 'package:shared_preferences/shared_preferences.dart';

class SetSettings {
  Future<void> setSettings(key, value, type) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    switch (type) {
      case bool:
        pref.setBool(key, value);
        break;
        case String:
        pref.setString(key, value);
    }
  }
}
