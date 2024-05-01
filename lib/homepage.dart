import 'package:flutter/material.dart';
import 'meditation_screen.dart'; // Import the MeditationScreen
import 'affirmations_screen.dart'; // Import the AffirmationsScreen
import 'initial_journal_screen.dart'; // Import the InitialJournalScreen
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the CurvedNavigationBar package
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts package

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Index of the current screen

  final List<Widget> _screens = [
    MeditationScreen(), // Screen for meditation
    AffirmationsScreen(), // Screen for affirmations
    InitialJournalScreen(), // Screen for initial journal entry
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keela', // App title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900]!, // Set app bar background color to dark grey
      ),
      body: _screens[_currentIndex], // Display current screen
      bottomNavigationBar: CurvedNavigationBar( // Curved bottom navigation bar
        backgroundColor: Colors.grey[900]!, // Set background color to dark grey
        color: Colors.pinkAccent.withOpacity(0.7), // Set selected item color to pink with opacity
        buttonBackgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color to pink with opacity
        items: [
          Icon(Icons.spa, color: Colors.white), // Icon for meditation screen
          Icon(Icons.mood, color: Colors.white), // Icon for affirmations screen
          Icon(Icons.book, color: Colors.white), // Icon for journal screen
        ],
        onTap: (index) { // Handle navigation item taps
          setState(() {
            _currentIndex = index; // Update current index
          });
        },
      ),
    );
  }
}
