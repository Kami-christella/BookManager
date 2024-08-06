import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String SORT_KEY = 'sort_preference';
  static const String THEME_KEY = 'theme_preference';

  Future<void> setSortPreference(String sortBy) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SORT_KEY, sortBy);
  }

  Future<String> getSortPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SORT_KEY) ?? 'title';
  }

  Future<void> setThemePreference(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_KEY, isDarkMode);
  }

  Future<bool> getThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_KEY) ?? false;
  }
}

