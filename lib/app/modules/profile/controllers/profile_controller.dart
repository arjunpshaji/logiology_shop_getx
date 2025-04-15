import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  void updateProfile(String newUsername, String newPassword) async {
    username.value = newUsername;
    password.value = newPassword;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', newUsername);
    await prefs.setString('password', newPassword);
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imagePath.value = picked.path;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImage', picked.path);
    }
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? 'admin';
    password.value = prefs.getString('password') ?? 'Pass@123';
    imagePath.value = prefs.getString('profileImage') ?? '';
  }
}
