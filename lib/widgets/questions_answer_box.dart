import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsAndAnswerBox extends StatefulWidget {
  @override
  State<QuestionsAndAnswerBox> createState() => _QuestionsAndAnswerBoxState();
}

class _QuestionsAndAnswerBoxState extends State<QuestionsAndAnswerBox> {
  int selectedIndex = -1;

  final List<String> options = [
    "The peace in the early mornings",
    "The magical golden hours",
    "Wind-down time after dinners",
    "The serenity past midnight"
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Wrap(
      spacing: isSmallScreen ? 8.0 : 12.0,
      runSpacing: isSmallScreen ? 8.0 : 12.0,
      children: List.generate(options.length, (index) {
        final bool isSelected = selectedIndex == index;
        return _buildOptionItem(index, isSelected, screenWidth, isSmallScreen);
      }),
    );
  }

  Widget _buildOptionItem(
      int index, bool isSelected, double screenWidth, bool isSmallScreen) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: (screenWidth - (isSmallScreen ? 56 : 72)) / 2,
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 12.0 : 14.0,
          vertical: isSmallScreen ? 14.0 : 16.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF232A2E),
          borderRadius: BorderRadius.circular(12.0),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFF8B88EF),
                  width: 2.0,
                )
              : null,
        ),
        child: _buildOptionContent(index, isSelected, isSmallScreen),
      ),
    );
  }

  Widget _buildOptionContent(int index, bool isSelected, bool isSmallScreen) {
    return Row(
      children: [
        _buildOptionLetter(index, isSelected, isSmallScreen),
        SizedBox(width: isSmallScreen ? 6.0 : 8.0),
        Expanded(
          child: Text(
            options[index],
            style: GoogleFonts.inter(
              color: Color(0XFFC4C4C4),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionLetter(int index, bool isSelected, bool isSmallScreen) {
    return Container(
      width: isSmallScreen ? 24 : 26,
      height: isSmallScreen ? 24 : 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? const Color(0xFFABA7FF) : Colors.transparent,
        border: Border.all(
          color: isSelected ? const Color(0xFFABA7FF) : Colors.white,
        ),
      ),
      child: Text(
        String.fromCharCode(65 + index),
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: isSmallScreen ? 12 : 13,
        ),
      ),
    );
  }
}
