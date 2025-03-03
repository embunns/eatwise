import 'package:get/get.dart';

class EmailforgotpasswordController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void emailforgotpassword() {
    print("Email: ${email.value}, Password: ${password.value}");
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
