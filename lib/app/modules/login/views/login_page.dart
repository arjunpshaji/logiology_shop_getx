import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/login/controllers/login_controller.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/input_text.dart';
import 'package:logiology/theme/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.find<LoginController>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.jpg"), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: appColor(context).primary?.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login", style: TextStyle(color: appColor(context).primary, fontSize: 28, fontWeight: FontWeight.w600)),
                  SizedBox(height: 32),
                  InputText(onChanged: (v) => controller.usernameInput.value = v, labelText: "Username", obscureText: false),
                  SizedBox(height: 16),
                  InputText(onChanged: (v) => controller.passwordInput.value = v, labelText: "Password", obscureText: true),
                  SizedBox(height: 32),
                  PrimaryButton(
                    buttonText: "Login",
                    onPressed: controller.login,
                    buttonColor: appColor(context).buttonColor,
                    textColor: appColor(context).primaryText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
