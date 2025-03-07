import 'package:get/get.dart';

class OtpcodeController extends GetxController {
  //TEMP CODE SEDERHANANYA
  void verifyOtp(String otpCode) {
    const correctOtp = "1234"; 

    if (otpCode == correctOtp) {
      Get.snackbar("Success", "Verification successful!",
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed("/reset-password"); 
    } else {
      Get.snackbar("Error", "Invalid OTP code. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
