import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logiology/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var imagePath = ''.obs;

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  // Update profile data
  void updateProfile(String newUsername, String newPassword, String confirmPassword) async {
    if (confirmPassword != newPassword) {
      Get.snackbar("Error", "Passwords does not match");
    } else {
      username.value = newUsername;
      password.value = newPassword;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', newUsername);
      await prefs.setString('password', newPassword);
      Get.snackbar("Success", "Profile details updated");
      Get.toNamed(AppRoutes.home);
    }
  }

  // Image picker function
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imagePath.value = picked.path;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImage', picked.path).then((value) {
        if (value) {
          Get.snackbar("Success", "Profile image updated");
        }
      });
    }
  }

  // Load Profile data
  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? 'admin';
    password.value = prefs.getString('password') ?? 'Pass@123';
    imagePath.value = prefs.getString('profileImage') ?? '';
  }
}
