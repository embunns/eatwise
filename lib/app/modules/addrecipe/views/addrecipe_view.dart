import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addrecipe_controller.dart';

class AddrecipeView extends GetView<AddrecipeController> {
  const AddrecipeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddrecipeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddrecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
