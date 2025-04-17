import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Clear SharedPreference login data
void clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("isLoggedIn");
}

// Date formatter
// Example: Jan 01, 2025
String? convertToMonthDayYear({required String? dateTimeString}) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    try {
      DateTime date = DateTime.parse(dateTimeString);
      return DateFormat("MMM d, yyyy").format(date);
    } catch (e) {
      return null;
    }
  }