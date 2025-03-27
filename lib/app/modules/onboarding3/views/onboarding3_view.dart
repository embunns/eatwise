import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/onboarding3_controller.dart';

class Onboarding3View extends GetView<Onboarding3Controller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 120),

          Image.asset(
            'assets/images/onboarding3.png',
            height: 250,
          ),

          const SizedBox(height: 100),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  Text(
                    'It’s Time to Get Amazing Cooking!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF172635),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Start your culinary adventure with Eatwise and enjoy meals that make you feel good.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF8E8E8E),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF3F3F3F),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Get.toNamed('/loginorsignup');
                          },
                          backgroundColor: const Color(0xFFCE181B),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}