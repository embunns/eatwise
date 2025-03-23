import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with background image
            Stack(
              children: [
                // Background image using Image.asset
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200, // Adjust height as needed
                  child: Image.asset(
                    'assets/images/home_background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Content on top of background
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with greeting and message
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Unleash Your Culinary Creativity And Start Cooking Today!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          // Fast food images on the right side
                          Image.asset(
                            'assets/images/fast_food.png',
                            width: 100,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      
                      // Search bar
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
                            Icon(Icons.settings_outlined, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Remaining content with white background
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food category section - Grid layout (non-scrollable)
                    Container(
                      child: GridView.count(
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
                    ),
                    SizedBox(height: 20),
                    
                    // Recommendation section
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
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: GoogleFonts.poppins(
                              color: Colors.red,
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
                            'Sate Kambing Pak Slamet',
                            'Anila Dwi Lestari',
                            'IDR 150.000',
                            '20',
                            'assets/images/satay.png',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildRecommendationCard(
                            'Sempolan Ayam',
                            'Anila Dwi Lestari',
                            'IDR 150.000',
                            '20',
                            'assets/images/sempolan.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCategoryItem(String title, String imagePath) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
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
    );
  }
  
  Widget _buildRecommendationCard(String title, String author, String price, String likes, String imagePath) {
    return Container(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
    );
  }
}