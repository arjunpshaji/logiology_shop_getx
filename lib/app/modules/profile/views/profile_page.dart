import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/profile/controllers/profile_controller.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/common_appbar.dart';
import 'package:logiology/theme/widgets/input_text.dart';

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
        return Column(
          children: [
            GestureDetector(
              onTap: controller.pickImage,
              child:
                  controller.imagePath.isEmpty
                      ? Icon(Icons.person, size: 100, color: appColor(context).primaryText)
                      : Image.file(File(controller.imagePath.value), height: 100),
            ),
            InputText(onChanged: (x) {}, labelText: "Username", controller: usernameCtrl),
            InputText(onChanged: (x) {}, labelText: "Password", controller: passwordCtrl, obscureText: true),
            ElevatedButton(onPressed: () => controller.updateProfile(usernameCtrl.text, passwordCtrl.text), child: Text("Save")),
          ],
        );
      }),
    );
  }
}
