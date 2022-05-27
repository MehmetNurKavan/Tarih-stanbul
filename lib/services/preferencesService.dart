import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static Future<bool> changeCategoryFavorite(String categoryName) async {
    final prefs = await SharedPreferences.getInstance();

    var key = 'categoryFavorite_' + categoryName;

    var isFavorite = prefs.getBool(key);

    if (isFavorite == null) {
      isFavorite = false;
    }

    var newStatus = !isFavorite;

    await prefs.setBool(key, newStatus);

    return newStatus;
  }

  static Future<bool> getCategoryFavorite(String categoryName) async {
    final prefs = await SharedPreferences.getInstance();

    var key = 'categoryFavorite_' + categoryName;

    var isFavorite = prefs.getBool(key);

    if (isFavorite == null) {
      isFavorite = false;
      await prefs.setBool(key, isFavorite);
    }

    return isFavorite;
  }
}
