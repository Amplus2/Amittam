import 'package:amittam/encryptionlib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static Future<void> initialize() async =>
      _prefs = Prefs(await SharedPreferences.getInstance());

  // getter & setter
  bool get darkMode => getBool('darkmode', true);
  set darkMode(bool b) => _sharedPreferences?.setBool('darkmode', b);

  AmpEncrypted get masterPW =>
      AmpEncrypted.fromJson(getString('masterpw', null));
  set masterPW(AmpEncrypted ae) =>
      _sharedPreferences?.setString('masterpw', ae.toString());

  List<AmpEncrypted> get passwords => getStringList('passwords', [])
      .map((s) => AmpEncrypted.fromJson(s))
      .toList();
  set passwords(List<AmpEncrypted> pws) => _sharedPreferences?.setStringList(
      'passwords', pws.map((pw) => pw.toJson()).toList());

  // helper methods
  bool getBool(String key, bool defVal) =>
      _sharedPreferences?.getBool(key) ?? defVal;

  String getString(String key, String defVal) =>
      _sharedPreferences?.getBool(key) ?? defVal;

  List<String> getStringList(String key, List<String> defVal) =>
      _sharedPreferences?.getStringList(key) ?? defVal;
}

Prefs _prefs;
Prefs get prefs => _prefs;
