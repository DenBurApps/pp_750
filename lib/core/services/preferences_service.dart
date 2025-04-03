import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences {
  AppPreferences._();
  static final AppPreferences I = AppPreferences._();

  late SharedPreferences prefs;

  Future<AppPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  String get lastUrl => prefs.getString('lastUrl') ?? '';
  set lastUrl(String value) => prefs.setString('lastUrl', value);
}