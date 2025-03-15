import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailrecipe_controller.dart';

class DetailrecipeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sate Kambing Pak Slamet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const SateKambingPage(),
    );
  }
}

class SateKambingPage extends StatefulWidget {
  const SateKambingPage({Key? key}) : super(key: key);

  @override
  State<SateKambingPage> createState() => _SateKambingPageState();
}

class _SateKambingPageState extends State<SateKambingPage> {
  final ScrollController _scrollController = ScrollController();
  double _headerImageOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Start hiding the image as soon as scroll begins
    if (_scrollController.offset > 10 && _headerImageOpacity != 0) {
      setState(() {
        _headerImageOpacity = 0;
      });
    } else if (_scrollController.offset <= 10 && _headerImageOpacity != 1) {
      setState(() {
        _headerImageOpacity = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _headerImageOpacity,
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                'assets/images/sate.png',
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Navigation Buttons
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.thumb_up_outlined, size: 18, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Main Content
          ListView(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 200),
            children: [
              // Product Card
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
                    const Text(
                      'Sate Kambing Pak Slamet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Satee Kambing Pak Slamet offers tender, juicy goat skewers, grilled to perfection, served with a rich and flavorful peanut sauce. A must-try for meat lovers!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(Icons.monetization_on, 'IDR 25,000', Colors.red),
                    _buildInfoRow(Icons.access_time, '1 Hours, 5 Second', Colors.red),
                    _buildInfoRow(Icons.thumb_up, '20 Likes', Colors.red),
                    _buildInfoRow(Icons.person, 'Anita Dwi Lestari', Colors.red),
                  ],
                ),
              ),
              
              // Photo Gallery Section
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'Foto Sate Kambing Pak Slamet',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              // Photo Gallery
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://via.placeholder.com/300x200/8a5a00/ffffff?text=Sate+1',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://via.placeholder.com/300x200/8a3a00/ffffff?text=Sate+2',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Ingredients Section
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'Ingredient',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              // Ingredients List
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    IngredientItem('Goat meat - IDR 120,000 per kg'),
                    IngredientItem('Skewers - IDR 5,000 per 10 sticks'),
                    IngredientItem('Soy sauce - IDR 15,000 per bottle (250 ml)'),
                    IngredientItem('Garlic - IDR 10,000 per 200g'),
                    IngredientItem('Shallots - IDR 12,000 per 250g'),
                    IngredientItem('Turmeric - IDR 8,000 per 100g'),
                    IngredientItem('Coriander - IDR 10,000 per 50g'),
                    IngredientItem('Lemongrass - IDR 4,000 per stick'),
                    IngredientItem('Kaffir lime leaves - IDR 5,000 per bunch'),
                    IngredientItem('Peanuts - IDR 30,000 per kg'),
                    IngredientItem('Chili - IDR 15,000 per 250g'),
                    IngredientItem('Palm sugar - IDR 10,000 per 250g'),
                    IngredientItem('Tamarind - IDR 6,000 per 100g'),
                    IngredientItem('Salt - IDR 3,000 per 100g'),
                    IngredientItem('Cooking oil - IDR 20,000 per liter'),
                  ],
                ),
              ),
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
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  final String text;

  const IngredientItem(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}