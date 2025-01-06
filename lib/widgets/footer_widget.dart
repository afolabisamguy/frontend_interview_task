import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16.0 : 24.0,
        vertical: isSmallScreen ? 12.0 : 16.0,
      ),
      color: const Color(0xFF1E1C2A),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextContent(isSmallScreen),
            _buildActionButtons(isSmallScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent(bool isSmallScreen) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pick your option.',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: isSmallScreen ? 12.0 : 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'See who has a similar mind.',
            style: GoogleFonts.inter(
              color: const Color(0xFFE5E5E5),
              fontSize: isSmallScreen ? 10.0 : 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isSmallScreen) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/MicIcon.png',
          width: 45,
          height: 45,
        ),
        SizedBox(width: isSmallScreen ? 12.0 : 16.0),
        Image.asset(
          'assets/images/SendIcon.png',
          width: 45,
          height: 45,
        ),
      ],
    );
  }
}
