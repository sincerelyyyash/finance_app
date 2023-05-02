import 'package:shared_preferences/shared_preferences.dart';


class LoginController {
  static const String _isLoggedInKey = 'isLoggedIn';

  Future<bool> login(String username, String password) async {
    // Check if the username and password are valid
    bool isValid = await _checkCredentials(username, password);
    if (isValid) {
      // Save the login status to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, true);
    }
    return isValid;
  }

  Future<void> logout() async {
    // Clear the login status from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, false);
  }

  Future<bool> isLoggedIn() async {
    // Get the login status from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<bool> _checkCredentials(String username, String password) async {
    // Implement your own validation logic here
    return true;
  }
}