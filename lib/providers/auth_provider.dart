import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String? _email;

  String? get email => _email;

  void login(String email) {
    _email = email;
    notifyListeners();
  }

  void logout() {
    _email = null;
    notifyListeners();
  }
}