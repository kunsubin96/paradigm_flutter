import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper{
    static void putInt(String key, int value) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setInt(key, value);
    }
    static void putDouble(String key, double value) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setDouble(key, value);
    }
    static void putBool(String key, bool value) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool(key, value);
    }
    static void putString(String key, String value) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(key, value);
    }
     
    static Future<int> getInt(String key, int defaultValue) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getInt(key)??defaultValue;
    }
    static Future<double> getDouble(String key, double defaultValue) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getDouble(key)??defaultValue;
    }
    static Future<bool> getBool(String key, bool defaultValue) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getBool(key)??defaultValue;
    }
    static Future<String> getString(String key, String defaultValue) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key)??defaultValue;
    }
}