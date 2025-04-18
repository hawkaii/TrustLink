import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<SharedPreferences> get getPreference async =>
      await SharedPreferences.getInstance();

  /// add string
  Future<void> addString({required String key, required String value}) async {
    var pref = await getPreference;
    pref.setString(key, value);
  }

  /// add integer
  Future<void> addInteger({required String key, required int value}) async {
    var pref = await getPreference;
    pref.setInt(key, value);
  }

  /// add boolean
  Future<void> addBoolean({required String key, required bool value}) async {
    var pref = await getPreference;
    pref.setBool(key, value);
  }

  /// add double
  Future<void> addDouble({required String key, required double value}) async {
    var pref = await getPreference;
    pref.setDouble(key, value);
  }

  /// get String
  Future<String?> getString({required String key}) async {
    var pref = await getPreference;
    return pref.getString(key);
  }

  /// get integer
  Future<int?> getInteger({required String key}) async {
    var pref = await getPreference;
    return pref.getInt(key);
  }

  /// get boolean
  Future<bool?> getBoolean({required String key}) async {
    var pref = await getPreference;
    return pref.getBool(key);
  }

  /// get double
  Future<double?> getDouble({required String key}) async {
    var pref = await getPreference;
    return pref.getDouble(key);
  }

  Future<void> removeValue({required String key})async{
    var pref = await getPreference;
    pref.remove(key);
  }

 Future<bool> removeAll()async{
    var pref = await getPreference;
   return pref.clear();
  }
}
