import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//enum HomeBio { name, _id }

class UserData with ChangeNotifier {
  String _id = '';
  String _fullName = '';
  bool _isSignedIn = false;

  bool _isPrefName = true;

  bool get isSignedIn {
    return _isSignedIn;
  }

  String get getFullName {
    return _fullName;
  }

  String get getId {
    return _id;
  }

  bool get getPrefStatus {
    return _isPrefName;
  }

  void setHomeBioPref(bool value) {
    _isPrefName = value;
  }

  Future<void> setNameAndId() async {
    var prefs = await SharedPreferences.getInstance();
    _id = prefs.getString('ID') ?? '';
    _fullName = prefs.getString('name') ?? '';
    _isSignedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }

  Future<void> signUp(String id, String fullName) async {
    var prefs = await SharedPreferences.getInstance();
    _id = id;
    _fullName = fullName;
    _isSignedIn = true;

    prefs.setString('ID', id);
    prefs.setString('name', fullName);
    prefs.setBool('isLoggedIn', true);
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('isLoggedIn')) {
      return false;
    }
    _isSignedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
    return _isSignedIn;
  }
}
