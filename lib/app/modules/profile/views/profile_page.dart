import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/profile/controllers/profile_controller.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';
import 'package:logiology/theme/widgets/input_text.dart';
import 'package:logiology/theme/widgets/primary_button.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).background,
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: CommonAppbar(title: "Profile page", arrowColor: appColor(context).primary)),
      body: Obx(() {
        usernameCtrl.text = controller.username.value;
        passwordCtrl.text = controller.password.value;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: controller.pickImage,
                child:
                    controller.imagePath.isEmpty
                        ? Icon(Icons.person, size: 100, color: appColor(context).primaryText)
                        : Image.file(File(controller.imagePath.value), height: 100),
              ),
              SizedBox(height: 32),
              InputText(onChanged: (x) {}, labelText: "Username", controller: usernameCtrl),
              SizedBox(height: 16),
              InputText(onChanged: (x) {}, labelText: "Password", controller: passwordCtrl, obscureText: true),
              SizedBox(height: 24),
              PrimaryButton(
                buttonText: "Save",
                onPressed: () => controller.updateProfile(usernameCtrl.text, passwordCtrl.text),
                buttonColor: appColor(context).buttonColor,
              ),
              SizedBox(height: 16),
              PrimaryButton(
                buttonText: "Logout",
                onPressed: () => Get.toNamed("/"),
                buttonColor: appColor(context).errorText,
              ),
            ],
          ),
        );
      }),
    );
  }
}
