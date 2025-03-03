import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailrecipe_controller.dart';

class DetailrecipeView extends GetView<DetailrecipeController> {
  const DetailrecipeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailrecipeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailrecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
