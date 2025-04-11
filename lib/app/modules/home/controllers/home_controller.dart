import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final RxString username = ''.obs;
  var email = ''.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    final argumentEmail = Get.arguments;
    if (argumentEmail != null) {
      email.value = argumentEmail;
      fetchUserData(email.value);
    } else {
      Get.snackbar("Error", "Email tidak ditemukan");
    }

  }


  void fetchUserData(String email) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/user?email=$email'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        username.value = data['user']['username'] ?? 'User';
      } else {
        Get.snackbar("Error", "Gagal mengambil data user");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Terjadi kesalahan");
    }

  }
}
