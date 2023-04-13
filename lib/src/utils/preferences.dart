import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late SharedPreferences preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void saveCurrentTheme(String theme) {
    preferences.setString('theme', theme);
  }

  String? getCurrentTheme() {
    return preferences.getString('theme');
  }

  void saveCurrentLanguaje(String languaje) {
    preferences.setString('languaje', languaje);
  }

  String? getCurrentLanguaje() {
    return preferences.getString('languaje');
  }
}

final preferences = Preferences();
