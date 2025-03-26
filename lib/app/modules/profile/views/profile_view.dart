import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eatwise/app/modules/bottomnavigation/views/bottomnavigation_view.dart';
import 'package:eatwise/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 16),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8A7B9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.network(
                          'https://via.placeholder.com/60/FF5A5F/FFFFFF?text=A',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFF8A7B9),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              _buildTextField('Full Name', controller.nameController),
              _buildTextField('Phone Number', controller.phoneController, keyboardType: TextInputType.phone),
              _buildTextField('Email', controller.emailController, keyboardType: TextInputType.emailAddress),
              
              // Password Fields with Toggle
              Obx(() => _buildPasswordField(
                'Password', 
                controller.passwordController, 
                obscureText: controller.obscurePassword.value, 
                onToggle: controller.togglePasswordVisibility
              )),
              
              Obx(() => _buildPasswordField(
                'Confirm Password', 
                controller.confirmPasswordController, 
                obscureText: controller.obscureConfirmPassword.value, 
                onToggle: controller.toggleConfirmPasswordVisibility
              )),

              const SizedBox(height: 30),

              _buildButton('Update Profile', controller.updateProfile),
              const SizedBox(height: 16),
              _buildButton('Logout', controller.logout),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomnavigationView(
        currentIndex: 3, 
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offNamed(Routes.HOME);
              break;
            case 1:
              Get.offNamed(Routes.RECIPEBASEDONRECOMMENDATION);
              break;
            case 2:
              Get.offNamed(Routes.CHATBOT);
              break;
            case 3:
              break;
          }
        },
      ),
    );
  }

  Widget _buildTextField(
    String label, 
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFF1F1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPasswordField(
    String label, 
    TextEditingController controller, {
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFF1F1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: onToggle,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffCE181B),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text, 
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}