import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';


class AddrecipeView extends StatefulWidget {

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddrecipeView> {
  String? _selectedCategory;
  int _selectedIndex = 2;
  final TextEditingController _dishNameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  XFile? _image;

  final ScrollController _ingredientsScrollController = ScrollController();
  final ScrollController _instructionsScrollController = ScrollController();
  //jangan lupa buat exception

  
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    _ingredientsScrollController.dispose();
    _instructionsScrollController.dispose();
    super.dispose();
  }
  //masih overflowed 74 pixel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 33,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dish name", style: _labelStyle()),
              SizedBox(height: 4),
              _buildTextField(_dishNameController, "Insert the name of the dish...", maxLines: 1),
              SizedBox(height: 12),
              
              Text("Description", style: _labelStyle()),
              SizedBox(height: 4),
              _buildTextField(_descriptionController, "Insert the description of the dish...", maxLines: 3),
              SizedBox(height: 12),

              Text("Ingredients", style: _labelStyle()),
              SizedBox(height: 4),
              _buildScrollableTextField(_ingredientsController, _ingredientsScrollController, "Enter ingredients..."),
              
              SizedBox(height: 8),
              Text("Estimated time", style: _labelStyle()),
              SizedBox(height: 4),
              _buildTextField(_priceController, "Enter time estimate for food ingredients...", maxLines: 1),
              SizedBox(height: 8),
              
              Text("Category", style: _labelStyle()),
              SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffCE181B), width: 1), 
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffCE181B), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffCE181B), width: 1.5), 
                  ),
                ),
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                dropdownColor: Colors.white,
                hint: Text("Select a category", style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54)), 
                items: ["Rice Dishes", "Snacks", "Drinks", "Sweets", "Chicken & Duck"]
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category,
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black), 
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),

              SizedBox(height: 16),
              Text("Food image", style: _labelStyle()),
              SizedBox(height: 4),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload, size: 40, color: Color(0xffCE181B)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Text("Click to Upload", style: TextStyle(fontSize: 12, color: Color(0xffCE181B))),
                              SizedBox(width: 4), 
                              Text("or drag and drop", style: TextStyle(fontSize: 12, color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 4), 
                          Text("(Max. File size: 25 MB)", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      )

                      : Image.file(File(_image!.path), fit: BoxFit.cover),
                ),
              ),
              
              SizedBox(height: 16),
              Text("Instructions", style: _labelStyle()),
              SizedBox(height: 4),
              _buildScrollableTextField(_instructionsController, _instructionsScrollController, "Provide step-by-step instructions..."),
              
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffCE181B),
                    padding: EdgeInsets.symmetric(vertical: 18)),
                  onPressed: () {  },
                  child: Text(
                    "Send",
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
  return BottomNavigationBarItem(
    label: "",
    icon: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Color(0xff469110) : Colors.transparent,
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Icon(icon, color: _selectedIndex == index ? Colors.white : Colors.grey), 
    ),
  );
}
  Widget _buildTextField(TextEditingController controller,String hint, {int maxLines = 2}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: Color(0xff667085),
          fontSize: 14,
        ),
        filled: true,
        fillColor: Color(0xffFFF3F3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildScrollableTextField(TextEditingController controller, ScrollController scrollController, String hint) {
    return Container(
      constraints: BoxConstraints(maxHeight: 120, minHeight: 120), 
      decoration: BoxDecoration(
        color: Color(0xffFFF3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 50), 
          child: TextField(
            controller: controller,
            maxLines: null, 
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            decoration: _inputDecoration(hint),
            onChanged: (value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (scrollController.hasClients) {
                  scrollController.jumpTo(scrollController.position.maxScrollExtent);
                }
              });
            },
          ),
        ),
      ),
    );
  }

  TextStyle _labelStyle() {
    return GoogleFonts.poppins(fontSize: 14, color: Color(0xff667085));
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: Color(0xff667085), fontSize: 14),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
//   Future<void> _sendRecipe() async {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('You need to be logged in to add a recipe!')),
//     );
//     return;
//   }
//   try {
//     final newRecipe = {
//       'name': _dishNameController.text,
//       'ingredients': _ingredientsController.text.split(','),
//       'description' : _descriptionController.text,
//       'price': _priceController.text,
//       'category': _selectedCategory,
//       'image': '',
//       'howtocook': _instructionsController.text,
//       'userid': user.uid,
//       'createdAt': Timestamp.now(),
//     };

//     if (_image != null) {
//       final imageFile = File(_image!.path);

//       if (await imageFile.exists()) {
//         try {
//           print('Starting image conversion to base64: ${_image!.path}');
//           final bytes = await imageFile.readAsBytes();
//           newRecipe['image'] = base64Encode(bytes);
//           print('Image converted to base64 successfully');
//         } catch (conversionError) {
//           print('Error during image conversion: $conversionError');
//           throw 'Error during image conversion: $conversionError';
//         }
//       } else {
//         print('Image file not found at path: ${_image!.path}');
//         throw 'Image file not found at path: ${_image!.path}';
//       }
//     } else {
//       print('No image selected');
//     }

//     final db = FirebaseFirestore.instance;
//     await db.collection('recipes').add(newRecipe);

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         Future.delayed(Duration(seconds: 1), () {
//           Navigator.of(context).pop(true);
//           Navigator.pushNamed(context, '/myrecipe');
//         });
//         return Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 40),
//                 Icon(Icons.check_circle, color: Colors.green, size: 80),
//                 SizedBox(height: 10),
//                 Center(
//                   child: Text(
//                     'Recipe uploaded successfully!',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   } catch (e) {
//     print('Failed to upload recipe: $e');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Failed to upload recipe: $e')),
//     );
//   }
// }

}
