import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lauchapp_controller.dart';

class LauchappView extends GetView<LauchappController> {
  const LauchappView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LauchappView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LauchappView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
