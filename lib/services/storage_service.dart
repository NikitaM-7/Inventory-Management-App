import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userKey = 'user_data';
  static const String _loginKey = 'is_logged_in';
  static const String _productsKey = 'products_data';
  static const String _salesKey = 'sales_data';

  // ---------------- USER ----------------

  Future<void> saveUser(String userJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userJson);
  }

  Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  // ---------------- LOGIN ----------------

  Future<void> setLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, value);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }

  // ---------------- PRODUCTS ----------------

  Future<void> saveProducts(String productsJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_productsKey, productsJson);
  }

  Future<String?> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_productsKey);
  }

  // ---------------- SALES ----------------

  Future<void> saveSales(String salesJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_salesKey, salesJson);
  }

  Future<String?> getSales() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_salesKey);
  }

  // ---------------- CLEAR ----------------

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
