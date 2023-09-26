import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  // Function to store a string in SharedPreferences
  static Future<void> storeString(
      {required String key, required String value}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  // Function to get the stored string from SharedPreferences
  static Future<String?> getString({required String key}) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  // Function to delete the stored string from SharedPreferences
  static Future<void> deleteString({required String key}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }

  static Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
