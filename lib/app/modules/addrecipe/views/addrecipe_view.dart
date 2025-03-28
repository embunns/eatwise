import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddrecipeView extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddrecipeView> {
  String? _selectedCategory;
  
  final TextEditingController _dishNameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  
  XFile? _image;

  final ScrollController _ingredientsScrollController = ScrollController();
  final ScrollController _instructionsScrollController = ScrollController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void _showSuccessPopup() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/hambuger.png', 
                width: 140,
                height: 140,
              ),
              SizedBox(height: 15),
              Text(
                'Recipe Successfully Created!',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Your recipe has been created.\nCheck your recipe now!',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed('/recipe'); 
    });
  }
  @override
  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 2}) {
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
    Future<void> _pickImageFromCamera() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
      });
    }
  // Build scrollable text field
  Widget _buildScrollableTextField(
    TextEditingController controller, 
    ScrollController scrollController, 
    String hint
  ) {
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

  // Build method
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
          onPressed: () => Get.back(), 
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

              SizedBox(height: 8),
              Text("Cost estimation", style: _labelStyle()),
              SizedBox(height: 4),
              _buildTextField(_costController, "Insert a cost estimation...", maxLines: 1),
              SizedBox(height: 8),
              
              SizedBox(height: 8),
              Text("Cooking time", style: _labelStyle()),
              SizedBox(height: 4),
              _buildTextField(_timeController, "Insert a cooking time...", maxLines: 1),
              SizedBox(height: 8),
              
              Text("Ingredients", style: _labelStyle()),
              SizedBox(height: 4),
              _buildScrollableTextField(_ingredientsController, _ingredientsScrollController, "Enter ingredients..."),
              
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
                          Image.asset('assets/images/upload_image.png', height: 40),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Text("Click to Upload", style: GoogleFonts.poppins(fontSize: 12, color: Color(0xffCE181B), fontWeight: FontWeight.w600)),
                              SizedBox(width: 4), 
                              Text("or drag and drop", style: GoogleFonts.poppins(fontSize: 12, color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 4), 
                          Text("(Max. File size: 25 MB)", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                        ],
                      )
                      : Image.file(File(_image!.path), fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: _pickImageFromCamera, // Changed method name
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/upload_camera.png', height: 43),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, 
                              children: [
                                Text("Open Camera", style: GoogleFonts.poppins(fontSize: 12, color: Color(0xffCE181B), fontWeight: FontWeight.w600)),
                          
                              ],
                            ),
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
                    padding: EdgeInsets.symmetric(vertical: 18)
                  ),
                  onPressed: _showSuccessPopup,
                  child: Text(
                    "Send",
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      fontWeight: FontWeight.w600, 
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
