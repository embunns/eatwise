import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

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
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25, // Increased radius (was 20)
                    child: IconButton(
                      icon:  Icon(Iconsax.like_1, size: 22, color: Colors.black), // Increased icon size
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          ListView(
            controller: _scrollController,
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
                      padding: const EdgeInsets.only(left: 12.0), // Menambahkan padding ke kanan untuk judul
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
                      padding: const EdgeInsets.only(left: 12.0), // Menambahkan padding ke kanan untuk deskripsi
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
                      padding: const EdgeInsets.only(left: 12.0), // Menambahkan padding untuk baris info
                      child: _buildInfoRow(Icons.monetization_on, 'IDR 25,000', Color(0xffCE181B)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.access_time, '1 Hours, 5 Second', Color(0xffCE181B)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.thumb_up, '20 Likes', Color(0xffCE181B)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: _buildInfoRow(Icons.person, 'Anita Dwi Lestari', Color(0xffCE181B)),
                    ),

                  ],
                ),
              ),
              
              // Photo Gallery Section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'Foto Sate Kambing Pak Slamet',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
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
                        child: Image.asset(
                          'assets/images/sate.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/sate.png',
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
                    fontSize: 20,
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

                const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  'How to Cook',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    // Parse and display cooking steps
                    _buildCookingStep(
                        'Marinate the goat meat: Combine soy sauce, minced garlic, minced shallots, turmeric powder, ground coriander, lemongrass, and kaffir lime leaves in a bowl. Add goat meat cubes and mix well. Let it marinate for 30 minutes to 1 hour.',
                      ),
                      SizedBox(height: 10),
                      _buildCookingStep(
                        'Prepare the peanut sauce: Blend roasted peanuts, soaked chilies, palm sugar, tamarind paste, and a pinch of salt in a blender or mortar and pestle. Add water to achieve a smooth, thick sauce.',
                      ),
                      SizedBox(height: 10),
                      _buildCookingStep(
                        'Skewer the goat meat: Thread the marinated goat meat onto the skewers, spacing the pieces evenly. Soak wooden skewers in water for 10-15 minutes to prevent burning.',
                      ),
                      SizedBox(height: 10),
                      _buildCookingStep(
                        'Grill the sate: Preheat the grill to medium-high heat, brush with oil, and grill the skewered goat meat for 3-4 minutes per side until cooked through and slightly charred.',
                      ),
                      SizedBox(height: 10),
                      _buildCookingStep(
                        'Serve: Serve the grilled sate with the peanut sauce on the side for dipping. Optionally, garnish with lime leaves or chopped cilantro.',
                      ),

                  ],
                ),
              ),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xffCE181B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '#Rice',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Update functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffCE181B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(190, 70),
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
                      backgroundColor: Color(0xffCE181B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(190, 70),
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
              SizedBox(height: 30),
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

  Widget _buildCookingStep(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '• ',
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      Expanded(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    ],
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
          Text(
            '• ',
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
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