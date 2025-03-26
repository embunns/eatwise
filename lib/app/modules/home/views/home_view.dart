import 'dart:ui';

import 'package:eatwise/app/modules/bottomnavigation/views/bottomnavigation_view.dart';
import 'package:eatwise/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40),
                              Row(
                                children: [
                                  Text(
                                    'Hello, Anila!',
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.waving_hand, color: Colors.amber)
                                ],
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Unleash Your Culinary \nCreativity And Start \nCooking Today!',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: GoogleFonts.poppins(),
                              decoration: InputDecoration(
                                hintText: 'Search recipe...',
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.settings_outlined, color: Colors.grey),
                            onPressed: () {
                              _showFilterPopup(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 0.8,
                        children: [
                          _buildCategoryItem('Snack', 'assets/images/snack.png'),
                          _buildCategoryItem('Drink', 'assets/images/drink.png'),
                          _buildCategoryItem('Dessert', 'assets/images/dessert.png'),
                          _buildCategoryItem('Rice', 'assets/images/rice.png'),
                          _buildCategoryItem('Sea Food', 'assets/images/seafood.png'),
                          _buildCategoryItem('Salad', 'assets/images/salad.png'),
                          _buildCategoryItem('Bread', 'assets/images/bread.png'),
                          _buildCategoryItem('Noodle', 'assets/images/noodle.png'),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommendation',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.RECIPEBASEDONRECOMMENDATION);
                            },
                            child: Text(
                              'View All',
                              style: GoogleFonts.poppins(
                                color: Color(0xffCE181B),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      
                      // Recommendation cards
                      Row(
                        children: [
                          Expanded(
                            child: _buildRecommendationCard(
                              'Sate Kambing',
                              'Anila Dwi Lestari',
                              'IDR 150.000',
                              '20',
                              'assets/images/sate.png',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _buildRecommendationCard(
                              'Sempolan Ayam',
                              'Anila Dwi Lestari',
                              'IDR 150.000',
                              '20',
                              'assets/images/sate.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavigationView(
        currentIndex: 0, 
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Get.offNamed(Routes.RECIPEBASEDONRECOMMENDATION);
              break;
            case 2:
              Get.offNamed(Routes.CHATBOT);
              break;
            case 3:
              Get.offNamed(Routes.PROFILE);
              break;
          }
        },
      ),
    );
  }
  
  Widget _buildCategoryItem(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RECIPEBASEDONCATEGORIES, arguments: title);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              height: 55,
              width: 55,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildRecommendationCard(String title, String author, String price, String likes, String imagePath) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAILRECIPE, arguments: {
          'title': title,
          'author': author,
          'price': price,
          'likes': likes,
          'imagePath': imagePath,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.red[100],
                    child: Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.red, size: 16),
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.thumb_up, color: Colors.red, size: 16),
                      SizedBox(width: 4),
                      Text(
                        likes,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
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

  void _showFilterPopup(BuildContext context) {
  String? selectedPriceRange;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Filter',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Price',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildPriceFilterChip('<15K', 
                          isSelected: selectedPriceRange == '<15K', 
                          onSelected: () {
                            setState(() {
                              selectedPriceRange = '<15K';
                            });
                          }
                        ),
                        _buildPriceFilterChip('15K - 30K', 
                          isSelected: selectedPriceRange == '15K - 30K', 
                          onSelected: () {
                            setState(() {
                              selectedPriceRange = '15K - 30K';
                            });
                          }
                        ),
                        _buildPriceFilterChip('30K - 50K', 
                          isSelected: selectedPriceRange == '30K - 50K', 
                          onSelected: () {
                            setState(() {
                              selectedPriceRange = '30K - 50K';
                            });
                          }
                        ),
                        _buildPriceFilterChip('50K - 100K', 
                          isSelected: selectedPriceRange == '50K - 100K', 
                          onSelected: () {
                            setState(() {
                              selectedPriceRange = '50K - 100K';
                            });
                          }
                        ),
                        _buildPriceFilterChip('>100K', 
                          isSelected: selectedPriceRange == '>100K', 
                          onSelected: () {
                            setState(() {
                              selectedPriceRange = '>100K';
                            });
                          }
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedPriceRange != null) {
                      Navigator.of(context).pop();
                      Get.toNamed(
                        Routes.RECIPEBASEDONBUDGET, 
                        arguments: selectedPriceRange
                      );
                    } else {
                      
                      Get.snackbar(
                        'Error', 
                        'Please select a price range',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffCE181B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildPriceFilterChip(
  String label, {
  required bool isSelected, 
  required VoidCallback onSelected,
}) {
  return ChoiceChip(
    label: Text(
      label,
      style: GoogleFonts.poppins(
        color: isSelected ? Colors.white : Colors.black,
      ),
    ),
    selected: isSelected,
    onSelected: (_) => onSelected(),
    selectedColor: Color(0xffCE181B),
    backgroundColor: Colors.grey[200],
  );
}
}
