import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:eatwise/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final box = GetStorage();
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;

  String? userEmail;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    userEmail = box.read('email');
    print('EMAIL DARI BOX: $userEmail');

    if (userEmail != null) {
      fetchUserProfile(userEmail!);
    } else {
      Get.snackbar('Error', 'Email not found in session');
    }
  }

  void fetchUserProfile(String email) async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/user?email=$email'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final data = responseBody['user'];

        if (data != null) {
          usernameController.text = data['username'] ?? '';
          nameController.text = data['name'] ?? '';
          phoneController.text = data['phone'] ?? '';
          emailController.text = data['email'] ?? '';
          passwordController.text = '';
          confirmPasswordController.text = '';
        } else {
          Get.snackbar('Error', 'No user data received');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch profile data');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong while fetching profile');
    } finally {
      isLoading.value = false;
    }
  }


  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void updateUserProfile() async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/user/update'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': emailController.text,
          'username': usernameController.text,
          'fullname': nameController.text,
          'phone_number': phoneController.text,
          'password': passwordController.text,
        }),
      );


      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Profile updated successfully');
      } else {
        print(response.body);
        Get.snackbar('Error', 'Failed to update profile');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }



  void logout() {
    box.remove('token');
    box.remove('email');
    Get.offAllNamed(Routes.LOGIN);
  }

  bool validateProfile() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty', backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Phone number cannot be empty', backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (emailController.text.isEmpty || !GetUtils.isEmail(emailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email', backgroundColor: Colors.red, colorText: Colors.white);
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
