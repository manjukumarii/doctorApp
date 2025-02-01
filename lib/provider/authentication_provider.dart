import 'package:doctor_app/home_page.dart';
import 'package:doctor_app/sign_in_page.dart';
import 'package:doctor_app/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  void toogleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<void> checkFirstTime(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSignedIn = prefs.getBool('isSignedIn') ?? false;

    if (isSignedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

      if (isFirstTime) {
        prefs.setBool('isFirstTime', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      }
    }
  }

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', true);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('password', passwordController.text);
    notifyListeners();
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    await prefs.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    notifyListeners();
  }
}
