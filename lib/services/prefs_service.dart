import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _key = 'key';

  static save(String count) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"count": count}));
  }

  static Future<String> read() async {
    var prefs = await SharedPreferences.getInstance();
    var count = prefs.getString(_key);
    if (count != null) {
      var mapPrefs = jsonDecode(count);
      return mapPrefs['count'];
    }
    return "";
  }
}
