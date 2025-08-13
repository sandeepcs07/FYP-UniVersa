import 'package:shared_preferences/shared_preferences.dart';

class SharedprefService {
  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool contains(String key) {
    return _prefs.containsKey(key);
  }

  void remove(String key) {
    _prefs.remove(key);
  }

  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  String readString(String key) {
    return _prefs.getString(key).toString();
  }
}
