import 'package:eatwise/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/emailforgotpassword_controller.dart';

class EmailforgotpasswordView extends StatefulWidget {
  @override
  _EmailforgotpasswordViewState createState() => _EmailforgotpasswordViewState();
}

class _EmailforgotpasswordViewState extends State<EmailforgotpasswordView> {
  bool isPasswordVisible = true;
  bool isRememberMeChecked = false;
  final controller = EmailforgotpasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffCE181B), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.75, 0.25],
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'assets/images/eatwiselogo.png',
                  height: 60,
                ),
                const SizedBox(height: 35),
                Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Please enter your email and check \nyour email for code verification',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      buildInputField(
                        "Email",
                        "Enter your email...",
                        (value) => controller.email.value = value,
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.OTPFORGOTPASSWORD);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffCE181B),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Send",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 170),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, Function(String) onChanged, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 15)),
        const SizedBox(height: 7),
        TextField(
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFFF3F3),
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
        const SizedBox(height: 18),
      ],
    );
  }
}
