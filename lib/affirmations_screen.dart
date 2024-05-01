import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart'; // Importing Google Fonts package

class AffirmationsScreen extends StatefulWidget {
  @override
  _AffirmationsScreenState createState() => _AffirmationsScreenState();
}

class _AffirmationsScreenState extends State<AffirmationsScreen> {
  // List of affirmations
  final List<String> affirmations = [
    "I am enough.",
    "I am worthy of love and respect.",
    "I am capable of achieving my goals.",
    "I embrace my uniqueness.",
    "I attract positivity into my life.",
    "I forgive myself for my mistakes.",
    "My body is amazing just the way it is, and I accept myself this way.",
    "I am capable of so much.",
    "I can push through.",
    "I'm going to have a great day.",
    "I radiate love and positivity.",
    "I trust the journey of life.",
    "I am in control of my thoughts and emotions.",
    "I am deserving of success and happiness.",
    "I release all negative energy and embrace positivity.",
    "I am confident in my abilities.",
    "I am surrounded by abundance.",
    "I am grateful for the blessings in my life.",
    "I am attracting opportunities for growth and success.",
    "I am worthy of achieving my dreams.",
    "I am resilient and can overcome any challenge.",
    "I am constantly evolving and growing.",
    "I am at peace with who I am.",
    "I am surrounded by love and support.",
    "I am open to receiving love and kindness.",
    "I am creating a life filled with joy and fulfillment.",
    "I am aligned with my purpose.",
    "I am worthy of love and belonging.",
    "I am confident in my decisions.",
    "I am making a positive impact on the world.",
    "I am choosing happiness in every moment.",
    "I am free from fear and doubt.",
    "I am attracting positive people into my life.",
    "I am creating positive change in my life and the world.",
    "I am worthy of all the good things life has to offer.",
    "I am grateful for the opportunities life presents me.",
    "I am capable of achieving my goals and dreams.",
    "I am resilient and can bounce back from setbacks.",
    "I am proud of who I am becoming.",
    "I am worthy of love and acceptance.",
    "I am deserving of success and happiness.",
    "I am confident in my ability to achieve my goals.",
    "I am blessed with abundant opportunities.",
    "I am surrounded by love and support.",
    "I am grateful for the abundance in my life.",
    "I am open to receiving love and abundance.",
    "I am worthy of all the good things in life.",
    "I am worthy of love and respect.",
    "I am confident in my ability to overcome challenges.",
    "I am capable of achieving anything I set my mind to.",
    "I am surrounded by positivity and good energy.",
    "I am creating a life filled with joy and purpose.",
    "I am attracting success and prosperity into my life.",
    "I am grateful for the gift of life.",
    "I am worthy of love and happiness.",
    "I am confident in my abilities and talents.",
    "I am deserving of love and kindness.",
    "I am attracting positive energy into my life.",
    "I am worthy of success and abundance.",
    "I am surrounded by loving and supportive people.",
    "I am worthy of all the good things life has to offer.",
    "I am grateful for the opportunities that come my way.",
    "I am open to receiving love, joy, and abundance.",
    "I am confident in my ability to achieve my goals.",
    "I am resilient and can overcome any obstacle.",
    "I am proud of the person I am becoming.",
    "I am worthy of love, respect, and happiness.",
    "I am confident in my ability to create the life I desire.",
    "I am attracting positive people and opportunities into my life.",
    "I am grateful for the abundance of love and blessings in my life.",
    "I am open to receiving all the good things life has to offer.",
    "I am worthy of success, happiness, and fulfillment.",
    "I am confident in my ability to overcome challenges and achieve my goals.",
    "I am surrounded by love, abundance, and positivity.",
    "I am creating a life filled with joy, purpose, and meaning.",
    "I am attracting success, prosperity, and abundance into my life.",
    "I am grateful for the gift of life and all its blessings.",
    "I am open to receiving love, joy, and abundance in all areas of my life.",
  ];

  late String _currentAffirmation; // Current affirmation string
  late int _currentIndex; // Current index of the affirmation

  @override
  void initState() {
    super.initState();
    _loadLastIndex(); // Load last index from SharedPreferences
  }

  // Method to load last index from SharedPreferences
  void _loadLastIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? lastIndex = prefs.getInt('last_index');

    // If last index is null or not within the valid range, set it to a default value
    if (lastIndex == null || lastIndex >= affirmations.length) {
      _currentIndex = DateTime.now().day % affirmations.length;
    } else {
      _currentIndex = (lastIndex + 1) % affirmations.length;
    }

    _updateCurrentAffirmation(); // Update current affirmation based on loaded index
  }

  // Method to update current affirmation
  void _updateCurrentAffirmation() {
    setState(() {
      _currentAffirmation = affirmations[_currentIndex];
    });
  }

  // Method to rotate to the next affirmation
  void _rotateAffirmation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('last_index', _currentIndex); // Save current index to SharedPreferences

    setState(() {
      _currentIndex = (_currentIndex + 1) % affirmations.length; // Increment index
      _updateCurrentAffirmation(); // Update current affirmation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Set background color to dark grey
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Daily Affirmation', // Updated title
          style: TextStyle(
            color: Colors.white, // Set title text color to white
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _currentAffirmation, // Display current affirmation
                    style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _rotateAffirmation, // Rotate to the next affirmation on button press
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 16.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'Rotate Affirmation', // Button text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
