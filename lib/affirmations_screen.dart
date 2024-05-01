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
