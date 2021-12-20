import 'package:shared_preferences/shared_preferences.dart';

class MyShared {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData(String key) {
    return sharedPreferences.get(key);
  }
  static Future<bool> saveData(String key,dynamic value)async{
    if(value is bool) return await sharedPreferences.setBool(key, value);
    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is double)  return await sharedPreferences.setDouble(key, value);
 return await sharedPreferences.setInt(key, value);
  }
  static Future<bool> clearData(String key)async{

    return await sharedPreferences.remove(key);
  }
}
