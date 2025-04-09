import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  final token = box.read('token');

  runApp(
    GetMaterialApp(
      initialRoute: token != null ? Routes.HOME : Routes.ONBOARDING1,
      getPages: AppPages.routes,
    ),
  );
}


