import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipebasedoncategories_controller.dart';

class RecipebasedoncategoriesView
    extends GetView<RecipebasedoncategoriesController> {
  const RecipebasedoncategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipebasedoncategoriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecipebasedoncategoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
