import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/newpasswordforgotpassword_controller.dart';

class NewpasswordforgotpasswordView
    extends GetView<NewpasswordforgotpasswordController> {
  const NewpasswordforgotpasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewpasswordforgotpasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewpasswordforgotpasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
