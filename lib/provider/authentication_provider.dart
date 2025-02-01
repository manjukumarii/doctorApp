import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  void toogleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
