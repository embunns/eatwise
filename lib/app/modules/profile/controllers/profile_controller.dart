import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:eatwise/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final usernameController = TextEditingController(text: 'anila');
  final nameController = TextEditingController(text: 'Anila Dwi Lestari');
  final phoneController = TextEditingController(text: '081226044730');
  final emailController = TextEditingController(text: 'aniladwilestarii@gmail.com');
  final passwordController = TextEditingController(text: '••••••');
  final confirmPasswordController = TextEditingController(text: '••••••');

  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void updateProfile() {
    if (validateProfile()) {
      Get.snackbar(
        'Success', 
        'Profile Updated', 
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Optionally navigate or refresh
      Get.toNamed(Routes.PROFILE);
    }
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  bool validateProfile() {
    if (nameController.text.isEmpty) {
      Get.snackbar(
        'Error', 
        'Name cannot be empty',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar(
        'Error', 
        'Phone number cannot be empty',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (emailController.text.isEmpty || !GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Error', 
        'Please enter a valid email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    usernameController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}