import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipebasedonrecommendation_controller.dart';

class RecipebasedonrecommendationView
    extends GetView<RecipebasedonrecommendationController> {
  const RecipebasedonrecommendationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipebasedonrecommendationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecipebasedonrecommendationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
