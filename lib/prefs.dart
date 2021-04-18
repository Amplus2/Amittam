import 'package:amittam/constants.dart';
import 'package:amittam/encryptionlib.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static Future<void> initialize() async =>
      _prefs = Prefs(await SharedPreferences.getInstance());

  // getter & setter
  bool get darkMode => getBool('darkmode', true);
  set darkMode(bool b) => _sharedPreferences.setBool('darkmode', b);

  bool get firstLogin => _sharedPreferences.getString('masterpw') == null;

  MaterialColor get accentColor => accentColors[getInt('accentcolor', 9)];
  set accentColor(MaterialColor mc) =>
      _sharedPreferences.setInt('accentcolor', accentColors.indexOf(mc));

  CustomEncrypted get masterPW =>
      CustomEncrypted.fromJson(getString('masterpw', ''));
  set masterPW(CustomEncrypted ae) =>
      _sharedPreferences.setString('masterpw', ae.toString());

  List<CustomEncrypted> get passwords => getStringList('passwords', [])
      .map((s) => CustomEncrypted.fromJson(s))
      .toList();
  set passwords(List<CustomEncrypted> pws) => _sharedPreferences.setStringList(
      'passwords', pws.map((pw) => pw.toJson()).toList());

  ThemeData get themeData {
    var appBarTheme = AppBarTheme(centerTitle: true);
    var fabTheme = FloatingActionButtonThemeData(
        backgroundColor: prefs.accentColor, foregroundColor: Colors.white);
    var inputDecorationTheme = InputDecorationTheme(alignLabelWithHint: true);

    return darkMode
        ? ThemeData.dark().copyWith(
            accentColor: accentColor,
            primaryColor: accentColor,
            colorScheme:
                ThemeData.dark().colorScheme.copyWith(primary: accentColor),
            appBarTheme: appBarTheme,
            floatingActionButtonTheme: fabTheme,
            inputDecorationTheme: inputDecorationTheme,
          )
        : ThemeData.light().copyWith(
            accentColor: accentColor,
            primaryColor: accentColor,
            colorScheme:
                ThemeData.light().colorScheme.copyWith(primary: accentColor),
            appBarTheme: appBarTheme,
            floatingActionButtonTheme: fabTheme,
            inputDecorationTheme: inputDecorationTheme,
          );
  }

  // helper methods
  bool getBool(String key, bool defVal) =>
      _sharedPreferences.getBool(key) ?? defVal;

  int getInt(String key, int defVal) =>
      _sharedPreferences.getInt(key) ?? defVal;

  String getString(String key, String defVal) =>
      _sharedPreferences.getString(key) ?? defVal;

  List<String> getStringList(String key, List<String> defVal) =>
      _sharedPreferences.getStringList(key) ?? defVal;
}

late Prefs _prefs;
Prefs get prefs => _prefs;
