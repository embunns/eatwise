import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomnavigationView extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomnavigationView({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: Color(0xffCE181B),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 12,
            ),
            iconSize: 28,
            selectedFontSize: 8, 
            unselectedFontSize: 8,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.explore_outlined),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.explore, color: Color(0xffCE181B)),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.restaurant_menu_outlined),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.restaurant_menu, color: Color(0xffCE181B)),
                ),
                label: 'Recipe',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.chat_bubble_outline),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.chat_bubble, color: Color(0xffCE181B)),
                ),
                label: 'Chatbot',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.person_outline),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 8),
                  child: Icon(Icons.person, color: Color(0xffCE181B)),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}