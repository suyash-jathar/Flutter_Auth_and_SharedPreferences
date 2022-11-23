import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSaver {
  static String nameKey = "NAMEKEY";
  static String emailKey = "EMAILKEY";
  static String imgKey = "IMGKEY";
  static String logKey = "LOGINKEY";

  static Future<bool> saveName(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(nameKey, username);
  }

  static Future<bool> saveEmail(String useremail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(emailKey, useremail);
  }

  static Future<bool> saveImg(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(imgKey, url);
  }

  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(nameKey);
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }

  static Future<String?> getImg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(imgKey);
  }

  static Future<bool> saveLoginData(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(logKey, isUserLoggedIn);
  }

  static Future<bool?> getLogData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(logKey);
  }
  // static Future<String?> afLoginname() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.getString('alname');
  // }
  // static Future<String?> afLoginemail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.getString('alemail');
  // }
  // static Future<String?> afLoginimg() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.getString('alimgUrl');
  // }
}
