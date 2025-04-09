import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:eatwise/app/routes/app_pages.dart'; // Adjust this import path if needed

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    final username = usernameController.text.trim();
    final fullName = fullNameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (username.isEmpty ||
        fullName.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/signup'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'fullname': fullName,
          'phone_number': phone,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Account created!");
        Get.offNamed(Routes.OTPCODE);
      } else {
        try {
          final error = jsonDecode(response.body);
          Get.snackbar("Signup Failed", error['message'] ?? "Unknown error");
        } catch (e) {
          Get.snackbar("Signup Failed", "Raw: ${response.body}");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Exception: $e");
    }

  }

  @override
  void onClose() {
    usernameController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }


}
