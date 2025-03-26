import 'package:get/get.dart';

class OtpcodeController extends GetxController {
  RxBool isLoading = false.obs;

  void verifyOtp(String otpCode) async {
    try {
      isLoading.value = true;
      // Your OTP verification logic here
      await Future.delayed(Duration(seconds: 2)); // Simulated network call
      
      // If verification is successful
      showAccountCreatedPopup(); // Call the popup method
      
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'OTP Verification Failed');
    }
  }

  void showAccountCreatedPopup() {
    // Similar popup logic as in the view
  }

  @override
  void onClose() {
    // Cleanup logic
    super.onClose();
  }
}