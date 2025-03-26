import 'package:eatwise/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewpasswordforgotpasswordController extends GetxController {
  RxString newPassword = ''.obs;
  RxString confirmPassword = ''.obs;
  
  // Loading state for UI
  RxBool isLoading = false.obs;
  
  // Password visibility state
  RxBool isPasswordVisible = true.obs;

  // Validate passwords before submission
  bool validatePasswords() {
    // Check if passwords are empty
    if (newPassword.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar(
        'Error', 
        'Please enter both passwords',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Check if passwords match
    if (newPassword.value != confirmPassword.value) {
      Get.snackbar(
        'Error', 
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Check password length
    if (newPassword.value.length < 6) {
      Get.snackbar(
        'Error', 
        'Password must be at least 6 characters',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  // Method to reset password
  void resetPassword() async {
    // Ensure passwords are valid first
    if (!validatePasswords()) return;

    try {
      // Set loading state
      isLoading.value = true;

      // Simulated network call for password reset
      // Replace with actual API call in your implementation
      await Future.delayed(Duration(seconds: 2));

      // Show success dialog
      Get.defaultDialog(
        title: 'Password Reset',
        middleText: 'Your password has been successfully reset',
        confirmTextColor: Colors.white,
        buttonColor: Color(0xffCE181B),
        textConfirm: 'Login',
        onConfirm: () {
          // Navigate to login page
          Get.offNamed(Routes.LOGIN);
        }
      );
    } catch (e) {
      // Handle any errors during password reset
      Get.snackbar(
        'Error', 
        'Failed to reset password. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    // Clean up resources when controller is removed
    newPassword.close();
    confirmPassword.close();
    isLoading.close();
    super.onClose();
  }
}