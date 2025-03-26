import 'package:eatwise/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCE181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "foodie",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Please provide your information to personalize your experience and start exploring the full potential of the app",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    buildInputField("Full Name", "Enter your full name...", (value) {}),
                    buildInputField("Phone Number", "Enter your phone number...", (value) {}),
                    buildInputField("Email", "Enter your email...", (value) {}),
                    buildPasswordField("Password", "Enter your password...", (value) {}),
                    buildPasswordField("Confirm Password", "Confirm your password...", (value) {}),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.signUp();
                          Get.offNamed(Routes.OTPCODE); 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffCE181B),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.LOGIN), 
                        child: Text.rich(
                          TextSpan(
                            text: "Already Have an Account? ",
                            style: GoogleFonts.poppins(fontSize: 14),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: GoogleFonts.poppins(
                                  color: Color(0xffCE181B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 15)),
        SizedBox(height: 1),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffFFF3F3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 13),
      ],
    );
  }

  Widget buildPasswordField(String label, String hint, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 15)),
        SizedBox(height: 7),
        TextField(
          obscureText: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffFFF3F3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 14,
            ),
            suffixIcon: Icon(Icons.visibility_off),
          ),
        ),
        SizedBox(height: 13),
      ],
    );
  }
}
