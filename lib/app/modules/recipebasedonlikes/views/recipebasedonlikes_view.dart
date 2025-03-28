import 'package:eatwise/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/recipebasedonlikes_controller.dart';

class RecipebasedonlikesView extends StatelessWidget {
  final List<Map<String, String>> foodList = [
    {
      'name': 'Sate Kambing Pak Slamet',
      'image': 'assets/images/sate.png',
    },
    {
      'name': 'Sempolan Ayam Giling',
      'image': 'assets/images/sate.png',
    },
    {
      'name': 'Pempek Ala Daging Ikan',
      'image': 'assets/images/sate.png',
    },
    {
      'name': 'Rendang Ala Pemalang',
      'image': 'assets/images/sate.png',
    },
    {
      'name': 'Rendang Ala Pemalang',
      'image': 'assets/images/sate.png',
    },
    {
      'name': 'Rendang Ala Pemalang',
      'image': 'assets/images/sate.png',
    },
    {
      'name': 'Rendang Ala Pemalang',
      'image': 'assets/images/sate.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Iconsax.arrow_left_2, color: Colors.black,),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Liked Recipes',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0.1,
                  childAspectRatio: 0.7,
                ),
                itemCount: foodList.length * 2,
                itemBuilder: (context, index) {
                  final food = foodList[index % foodList.length];
                  return FoodCard(name: food['name']!, image: food['image']!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String image;

  const FoodCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAILRECIPE, arguments: {
          'name': name,
          'image': image,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anila Dwi Lestari',
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset('assets/images/sack.png', height: 14,),
                      SizedBox(width: 5),
                      Text('IDR 150.000', style: GoogleFonts.poppins(fontSize: 10)),
                      Spacer(),
                      Image.asset('assets/images/like.png', height: 17,),
                      SizedBox(width: 5),
                      Text('20 Likes', style: GoogleFonts.poppins(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
