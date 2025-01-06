import 'package:flutter/material.dart';

class StrollBonfireScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top portion with background image (unchanged)
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        const Text(
                          'Stroll Bonfire',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.timer, color: Colors.white, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '22h 00m',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.person, color: Colors.white, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '103',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom portion with black background
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile picture
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/profilePicture.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Text content column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                // Name and age
                                Text(
                                  'Angelina, 28',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12),

                                // Question
                                Text(
                                  'What is your favorite time\nof the day?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 12),

                                // Answer
                                Text(
                                  '"Mine is definitely the peace in the morning."',
                                  style: TextStyle(
                                    color: Color(
                                        0xFF9BA1A7), // Slightly bluish grey
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Questions and Answers Box Integration
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: QuestionsAndAnswerBox(),
                    ),
                  ),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Fire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

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
    return Wrap(
      spacing: 16.0, // Horizontal spacing between items
      runSpacing: 12.0, // Vertical spacing between rows
      children: List.generate(options.length, (index) {
        final bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            width: (MediaQuery.of(context).size.width - 72) / 2, // Two per row
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF3C3A56)
                  : const Color(0xFF1E1C2A),
              borderRadius: BorderRadius.circular(12.0),
              border: isSelected
                  ? Border.all(
                      color: const Color(0xFFABA7FF),
                      width: 2.0,
                    )
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected ? const Color(0xFFABA7FF) : Colors.white,
                    ),
                  ),
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: TextStyle(
                      color:
                          isSelected ? const Color(0xFFABA7FF) : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    options[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      color: const Color(0xFF1E1C2A), // Black background
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Pick your option.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'See who has a similar mind.',
                style: TextStyle(
                  color: Color(0xFF9BA1A7), // Grey text color
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          // Microphone button
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF3C3A56), // Circle color
                ),
                child: const Icon(
                  Icons.mic,
                  color: Color(0xFFABA7FF), // Purple mic icon
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 16.0),
              // Arrow button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFABA7FF), // Purple circle color
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white, // White arrow icon
                  size: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
