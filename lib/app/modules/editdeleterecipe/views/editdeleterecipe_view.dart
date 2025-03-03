import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editdeleterecipe_controller.dart';

class EditdeleterecipeView extends GetView<EditdeleterecipeController> {
  const EditdeleterecipeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditdeleterecipeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditdeleterecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
