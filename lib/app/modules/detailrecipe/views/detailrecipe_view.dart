
import 'package:eatwise/app/modules/detailrecipe/controllers/detailrecipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class RecipeInfo {
  final String name;
  final String description;
  final String price;
  final String cookingTime;
  final int likes;
  final String author;
  final List<String> categories;
  final List<Ingredient> ingredients;
  final List<String> cookingSteps;
  final List<String> images;

  RecipeInfo({
    required this.name,
    required this.description,
    required this.price,
    required this.cookingTime,
    required this.likes,
    required this.author,
    required this.categories,
    required this.ingredients,
    required this.cookingSteps,
    required this.images,
  });
}

class Ingredient {
  final String name;
  final String price;

  Ingredient({required this.name, required this.price});
}

class DetailrecipeView extends GetView<DetailrecipeController> {
  const DetailrecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailRecipePage();
  }
}

class DetailRecipePage extends StatefulWidget {
  const DetailRecipePage({Key? key}) : super(key: key);

  @override
  _DetailRecipePageState createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isImageVisible = true;
  bool _isLiked = false;
  final TextEditingController _commentController = TextEditingController();

  // Recipe Data
  final RecipeInfo _recipeData = RecipeInfo(
    name: 'Sate Kambing Pak Slamet',
    description: 'Satee Kambing Pak Slamet offers tender, juicy goat skewers, grilled to perfection, served with a rich and flavorful peanut sauce. A must-try for meat lovers!',
    price: 'IDR 25,000',
    cookingTime: '1 Hours, 5 Second',
    likes: 20,
    author: 'Anita Dwi Lestari',
    categories: ['#Rice'],
    ingredients: [
      Ingredient(name: 'Goat meat', price: 'IDR 120,000 per kg'),
      Ingredient(name: 'Skewers', price: 'IDR 5,000 per 10 sticks'),
      Ingredient(name: 'Soy sauce', price: 'IDR 15,000 per bottle (250 ml)'),
      Ingredient(name: 'Garlic', price: 'IDR 10,000 per 200g'),
      Ingredient(name: 'Shallots', price: 'IDR 12,000 per 250g'),
      Ingredient(name: 'Turmeric', price: 'IDR 8,000 per 100g'),
      Ingredient(name: 'Coriander', price: 'IDR 10,000 per 50g'),
      Ingredient(name: 'Lemongrass', price: 'IDR 4,000 per stick'),
      Ingredient(name: 'Kaffir lime leaves', price: 'IDR 5,000 per bunch'),
      Ingredient(name: 'Peanuts', price: 'IDR 30,000 per kg'),
      Ingredient(name: 'Chili', price: 'IDR 15,000 per 250g'),
      Ingredient(name: 'Palm sugar', price: 'IDR 10,000 per 250g'),
      Ingredient(name: 'Tamarind', price: 'IDR 6,000 per 100g'),
      Ingredient(name: 'Salt', price: 'IDR 3,000 per 100g'),
      Ingredient(name: 'Cooking oil', price: 'IDR 20,000 per liter'),
    ],
    cookingSteps: [
      'Marinate the goat meat: Combine soy sauce, minced garlic, minced shallots, turmeric powder, ground coriander, lemongrass, and kaffir lime leaves in a bowl. Add goat meat cubes and mix well. Let it marinate for 30 minutes to 1 hour.',
      'Prepare the peanut sauce: Blend roasted peanuts, soaked chilies, palm sugar, tamarind paste, and a pinch of salt in a blender or mortar and pestle. Add water to achieve a smooth, thick sauce.',
      'Skewer the goat meat: Thread the marinated goat meat onto the skewers, spacing the pieces evenly. Soak wooden skewers in water for 10-15 minutes to prevent burning.',
      'Grill the sate: Preheat the grill to medium-high heat, brush with oil, and grill the skewered goat meat for 3-4 minutes per side until cooked through and slightly charred.',
      'Serve: Serve the grilled sate with the peanut sauce on the side for dipping. Optionally, garnish with lime leaves or chopped cilantro.',
    ],
    images: ['assets/images/sate.png'],
  );

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

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (_isImageVisible)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  _recipeData.images.first,
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
                        padding: const EdgeInsets.only(left: 12.0, top: 10),
                        child: Text(
                          _recipeData.name,
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
                          _recipeData.description,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color.fromARGB(255, 90, 89, 89),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/sack.png', _recipeData.price, const Color(0xffCE181B)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/clock.png', _recipeData.cookingTime, const Color(0xffCE181B)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/like.png', '${_recipeData.likes} Likes', const Color(0xffCE181B)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: _buildInfoRow('assets/images/sack.png', _recipeData.author, const Color(0xffCE181B)),
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
                    children: _recipeData.images.map((imagePath) => 
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imagePath,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ).toList(),
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
                    children: _recipeData.ingredients.map((ingredient) => 
                      IngredientItem('${ingredient.name} - ${ingredient.price}')
                    ).toList(),
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
                    children: _recipeData.cookingSteps.map((step) => 
                      Column(
                        children: [
                          _buildCookingStep(step),
                          const SizedBox(height: 10),
                        ],
                      )
                    ).toList(),
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
                    children: _recipeData.categories.map((category) => 
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffCE181B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    '36 Comments',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CommentItem(
                    username: 'anila_',
                    comment: 'setujuuuu👍',
                    likes: 1,
                  ),
                ),
                
                const SizedBox(height: 10),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey.shade400, width: 0.5),
                                ),
                                child: TextField(
                                  controller: _commentController,
                                  decoration: InputDecoration(
                                    hintText: 'Write your comment here...',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffCE181B),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                child: IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 21,
                    color: _isLiked ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
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

class CommentItem extends StatelessWidget {
  final String username;
  final String comment;
  final int likes;

  const CommentItem({
    Key? key,
    required this.username,
    required this.comment,
    this.likes = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                comment,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Reply',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up_outlined, size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        '$likes',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}