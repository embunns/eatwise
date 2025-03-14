import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipebasedonbudget_controller.dart';

class RecipebasedonbudgetView extends GetView<RecipebasedonbudgetController> {
  const RecipebasedonbudgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipebasedonbudgetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecipebasedonbudgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
