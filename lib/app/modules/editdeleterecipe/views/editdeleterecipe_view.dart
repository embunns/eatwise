import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/editdeleterecipe_controller.dart';

class EditdeleterecipeView extends GetView<EditdeleterecipeController> {  
  const EditdeleterecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditdeleterecipePage();
  }
}

class EditdeleterecipePage extends StatefulWidget {
  const EditdeleterecipePage({Key? key}) : super(key: key);

  @override
  _EditdeleterecipePageState createState() => _EditdeleterecipePageState();
}

class _EditdeleterecipePageState extends State<EditdeleterecipePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isImageVisible = true;
  bool _isLiked = false;

  // List of ingredients
  final List<String> _ingredients = [
    'Goat meat - IDR 120,000 per kg',
    'Skewers - IDR 5,000 per 10 sticks',
    'Soy sauce - IDR 15,000 per bottle (250 ml)',
    'Garlic - IDR 10,000 per 200g',
    'Shallots - IDR 12,000 per 250g',
    'Turmeric - IDR 8,000 per 100g',
    'Coriander - IDR 10,000 per 50g',
    'Lemongrass - IDR 4,000 per stick',
    'Kaffir lime leaves - IDR 5,000 per bunch',
    'Peanuts - IDR 30,000 per kg',
    'Chili - IDR 15,000 per 250g',
    'Palm sugar - IDR 10,000 per 250g',
    'Tamarind - IDR 6,000 per 100g',
    'Salt - IDR 3,000 per 100g',
    'Cooking oil - IDR 20,000 per liter',
  ];

  // List of cooking steps
  final List<String> _cookingSteps = [
    'Marinate the goat meat: Combine soy sauce, minced garlic, minced shallots, turmeric powder, ground coriander, lemongrass, and kaffir lime leaves in a bowl. Add goat meat cubes and mix well. Let it marinate for 30 minutes to 1 hour.',
    'Prepare the peanut sauce: Blend roasted peanuts, soaked chilies, palm sugar, tamarind paste, and a pinch of salt in a blender or mortar and pestle. Add water to achieve a smooth, thick sauce.',
    'Skewer the goat meat: Thread the marinated goat meat onto the skewers, spacing the pieces evenly. Soak wooden skewers in water for 10-15 minutes to prevent burning.',
    'Grill the sate: Preheat the grill to medium-high heat, brush with oil, and grill the skewered goat meat for 3-4 minutes per side until cooked through and slightly charred.',
    'Serve: Serve the grilled sate with the peanut sauce on the side for dipping. Optionally, garnish with lime leaves or chopped cilantro.',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 200) {
      if (_isImageVisible) {
        setState(() {
          _isImageVisible = false;
        });
      }
    } else {
      if (!_isImageVisible) {
        setState(() {
          _isImageVisible = true;
        });
      }
    }
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Conditionally render the image based on _isImageVisible
            if (_isImageVisible)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/sate.png',
                  height: 250,
                  fit: BoxFit.cover,
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
                    borderRadius: BorderRadius.circular(13),
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
                            color: Color.fromARGB(255, 90, 89, 89),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/sack.png', 'IDR 25,000', const Color(0xffCE181B)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/clock.png', '1 Hours, 5 Second', const Color(0xffCE181B)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/like.png', '20 Likes', const Color(0xffCE181B)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/sack.png', 'Anita Dwi Lestari', const Color(0xffCE181B)),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    'Foto Sate Kambing Pak Slamet',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
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
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    'Ingredient',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                    children: _ingredients.map((ingredient) => IngredientItem(ingredient)).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Text(
                    'How to Cook',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                    children: _cookingSteps.map((step) => _buildCookingStep(step)).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 10, 0),
                  child: Text(
                    'Category',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffCE181B),
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: ElevatedButton(
                        onPressed: () {}, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffCE181B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(170, 70),
                        ),
                        child: Text(
                          'Update',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () {}, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffCE181B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(170, 70),
                        ),
                        child: Text(
                          'Delete',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Iconsax.arrow_left_2, 
                    size: 22, 
                    color: Colors.black
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(
                    Icons.favorite,
                    size: 21,
                    color:Colors.red,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String imagePath, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
            Image.asset(
              imagePath,
              width: 16,
              height: 16,
            ),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCookingStep(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color.fromARGB(255, 90, 89, 89),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color.fromARGB(255, 90, 89, 89),
              ),
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
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 90, 89, 89),
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 90, 89, 89),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}