import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/profile/controllers/profile_controller.dart';
import 'package:logiology/support/helper.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';
import 'package:logiology/theme/widgets/input_text.dart';
import 'package:logiology/theme/widgets/primary_button.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColor(context).background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonAppbar(title: "Profile page", arrowColor: appColor(context).primary, isNeedBackArrow: true),
      ),
      body: Obx(() {
        usernameCtrl.text = controller.username.value;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: controller.pickImage,
                child: Image.file(
                  File(controller.imagePath.value),
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.person, size: 100, color: appColor(context).primaryText);
                  },
                ),
              ),
              SizedBox(height: 32),
              InputText(onChanged: (x) {}, labelText: "Username", controller: usernameCtrl),
              SizedBox(height: 16),
              InputText(onChanged: (x) {}, labelText: "Password", controller: passwordCtrl, obscureText: true),
              SizedBox(height: 16),
              InputText(onChanged: (x) {}, labelText: "Confirm password", controller: confirmPasswordCtrl, obscureText: true),
              SizedBox(height: 32),
              PrimaryButton(
                buttonText: "Save",
                onPressed: () {
                  controller.updateProfile(usernameCtrl.text, passwordCtrl.text, confirmPasswordCtrl.text);
                },
                buttonColor: appColor(context).buttonColor,
              ),
              SizedBox(height: 16),
              PrimaryButton(
                buttonText: "Logout",
                onPressed: () {
                  Get.toNamed("/");
                  clearData();
                },
                buttonColor: appColor(context).errorText,
              ),
            ],
          ),
        );
      }),
    );
  }
}
