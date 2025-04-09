import 'package:get/get.dart';

class OtpcodeController extends GetxController {
  RxBool isLoading = false.obs;

  Future<bool> verifyOtp(String otpCode) async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      return otpCode == "1234"; // true jika OTP valid
    } catch (e) {
      Get.snackbar('Error', 'OTP Verification Failed');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
