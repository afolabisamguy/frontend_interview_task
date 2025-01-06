import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/questions_answer_box.dart';
import '../widgets/footer_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 700;

    return Scaffold(
      body: Column(
        children: [
          _buildTopSection(context, isSmallScreen),
          _buildBottomSection(isSmallScreen),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopSection(BuildContext context, bool isSmallScreen) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              child: _buildTopContent(isSmallScreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContent(bool isSmallScreen) {
    return Column(
      children: [
        SizedBox(height: isSmallScreen ? 8 : 16),
        _buildTitle(),
        const SizedBox(height: 8),
        _buildStats(),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Stroll Bonfire',
          style: GoogleFonts.inter(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0XFFCCC8FF),
          ),
        ),
        SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'assets/images/Vector3.png',
            width: 20,
            height: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Vector.png',
          width: 20,
          height: 20,
          color: Colors.white,
        ),
        const SizedBox(width: 4),
        Text(
          '22h 00m',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(width: 16),
        Image.asset(
          'assets/images/Vector2.png',
          width: 20,
          height: 20,
          color: Colors.white,
        ),
        const SizedBox(width: 4),
        Text(
          '103',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBottomSection(bool isSmallScreen) {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.black,
        width: double.infinity,
        child: Column(
          children: [
            _buildProfileSection(isSmallScreen),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: QuestionsAndAnswerBox(),
              ),
            ),
            FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(bool isSmallScreen) {
    return Transform.translate(
      offset: Offset(0, isSmallScreen ? -25 : -30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfilePicture(isSmallScreen),
            const SizedBox(width: 16),
            _buildProfileInfo(isSmallScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture(bool isSmallScreen) {
    return Container(
      width: isSmallScreen ? 60 : 70,
      height: isSmallScreen ? 60 : 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/profilePicture.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileInfo(bool isSmallScreen) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Angelina, 28',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              height: 2,
            ),
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Text(
            'What is your favorite time\nof the day?',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Text(
            '"Mine is definitely the peace in the morning."',
            style: GoogleFonts.inter(
              color: Color(0xFF9BA1A7),
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0XFF0F1115),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Card.png'),
            color: Color(0xFFB5B2FF),
            size: 35,
          ),
          label: 'Fire',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/bonfire.png'),
            color: Color(0xFFB5B2FF),
            size: 35,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Chat.png'),
            color: Color(0xFFB5B2FF),
            size: 35,
          ),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/User.png'),
            color: Color(0xFFB5B2FF),
            size: 35,
          ),
          label: 'Notifications',
        ),
      ],
    );
  }
}
