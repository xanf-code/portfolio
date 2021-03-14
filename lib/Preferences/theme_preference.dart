import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const theme = "THEMESTATUS";

  // ignore: avoid_positional_boolean_parameters
  Future setDarkTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(theme, value);
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(theme) ?? false;
  }
}
