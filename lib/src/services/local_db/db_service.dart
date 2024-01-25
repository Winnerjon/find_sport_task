import 'package:find_sport_task/src/services/enum/db_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbService {
  static late final SharedPreferences _instance;

  static Future<void> initSharedPref() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// String

  Future<bool> setLocalString(DbEnum key, String data) async {
    return await _instance.setString(key.name, data);
  }

  dynamic getLocalString(DbEnum key) {
    return _instance.getString(key.name);
  }

  /// bool

  Future<bool> setLocalBool(DbEnum key, bool data) async {
    return await _instance.setBool(key.name, data);
  }

  dynamic getLocalBool(DbEnum key) {
    return _instance.getBool(key.name);
  }

  ///custom

  Future<bool> removeLocal(DbEnum key) async {
    return await _instance.remove(key.name);
  }

  Future<bool> clearLocalData() async {
    return await _instance.clear();
  }
}