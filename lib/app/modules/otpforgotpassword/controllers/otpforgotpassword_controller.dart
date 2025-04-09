import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../routes/app_pages.dart';

class OtpforgotpasswordController extends GetxController {
  late String email;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments; // Ambil email dari argument
    print('Email untuk verifikasi OTP: $email'); // Debug log
  }
  void verifyOtp(String otpCode) {
    const correctOtp = "1234";

    if (otpCode == correctOtp) {
      Get.snackbar("Success", "Verification successful!",
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(Routes.NEWPASSWORDFORGOTPASSWORD, arguments: email);
    } else {
      Get.snackbar("Error", "Invalid OTP code. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  // void verifyOtp(String otpCode) async {
  //   const correctOtp = "1234";    final response = await http.post(
  //     Uri.parse('http://10.0.2.2:8000/api/verify-otp'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'email': email, 'otp': otpCode}),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     Get.snackbar("Success", "Verification successful!",
  //         snackPosition: SnackPosition.BOTTOM);
  //     Get.toNamed("/reset-password", arguments: email); // Lanjut ke halaman reset password
  //   } else {
  //     Get.snackbar("Error", "Invalid OTP code. Please try again.",
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }
}
