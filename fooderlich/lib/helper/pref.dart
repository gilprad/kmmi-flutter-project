import 'package:shared_preferences/shared_preferences.dart';

class SearchDataPref {
  static SharedPreferences _preferences;

  static const _keySearch = 'search';

  static Future init() async => await SharedPreferences.getInstance();

  static Future setSearch(String search) async =>
      await _preferences.setString(_keySearch, search);

  static String getSearch() => _preferences.getString(_keySearch);
}
