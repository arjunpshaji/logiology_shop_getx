import 'package:shared_preferences/shared_preferences.dart';

// Clear SharedPreference login data
void clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("isLoggedIn");
}
