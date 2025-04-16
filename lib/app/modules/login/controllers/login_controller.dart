import 'package:get/get.dart';
import 'package:logiology/app/routes/app_routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var usernameInput = ''.obs;
  var passwordInput = ''.obs;
  bool isLoggedIn = false;

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username') ?? 'admin';
    final savedPassword = prefs.getString('password') ?? 'Pass@123';
    await prefs.setBool('isLoggedIn', true);

    if (usernameInput.value == savedUsername && passwordInput.value == savedPassword) {
      Get.offNamed(AppRoutes.home);
    } else {
      Get.snackbar("Login Failed", "Invalid credentials");
    }
  }
}

