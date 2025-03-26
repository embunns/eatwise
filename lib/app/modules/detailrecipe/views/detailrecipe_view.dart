import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DetailrecipeController extends GetxController {
  final RxDouble headerImageOpacity = 1.0.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.offset > 10 && headerImageOpacity.value != 0) {
      headerImageOpacity.value = 0;
    } else if (scrollController.offset <= 10 && headerImageOpacity.value != 1) {
      headerImageOpacity.value = 1;
    }
  }

  void onLikePressed() {
    // Add like functionality
    Get.snackbar('Liked', 'You liked this recipe');
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class DetailrecipeView extends GetView<DetailrecipeController> {
  const DetailrecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sate Kambing Pak Slamet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: SateKambingPage(),
    );
  }
}

class SateKambingPage extends GetView<DetailrecipeController> {
  const SateKambingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(() => AnimatedOpacity(
              opacity: controller.headerImageOpacity.value,
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                'assets/images/sate.png',
                height: 250,
                fit: BoxFit.cover,
              ),
            )),
          ),
          
          Positioned(
            top: 60, 
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25, 
                    child: IconButton(
                      icon: const Icon(Iconsax.arrow_left_2, size: 22, color: Colors.black),
                      onPressed: () => Get.back(), // Using GetX navigation
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25, 
                    child: IconButton(
                      icon: const Icon(Iconsax.like_1, size: 22, color: Colors.black),
                      onPressed: controller.onLikePressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.only(top: 200),
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Sate Kambing Pak Slamet',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Satee Kambing Pak Slamet offers tender, juicy goat skewers, grilled to perfection, served with a rich and flavorful peanut sauce. A must-try for meat lovers!',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.monetization_on, 'IDR 25,000', const Color(0xffCE181B)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.access_time, '1 Hours, 5 Second', const Color(0xffCE181B)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.thumb_up, '20 Likes', const Color(0xffCE181B)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.person, 'Anita Dwi Lestari', const Color(0xffCE181B)),
                    ),
                  ],
                ),
              ),
              
              // Rest of the ListView children remain the same
              // (Photo Gallery, Ingredients, Cooking Steps, etc.)
              
              // Example of last section to keep the structure
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Update functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffCE181B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(190, 70),
                    ),
                    child: Text(
                      'Update',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Delete functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffCE181B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(190, 70),
                    ),
                    child: Text(
                      'Delete',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 10,
            child: Icon(
              icon,
              size: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}