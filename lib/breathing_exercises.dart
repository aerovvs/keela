import 'package:flutter/material.dart';
import 'four_seven_eight.dart'; // Importing the 4-7-8 breathing exercise screen
import 'box_breathing.dart'; // Importing the box breathing exercise screen
import 'package:google_fonts/google_fonts.dart'; // Importing Google Fonts package

class BreathingExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900]!, // Set background color to pastel grey
      appBar: AppBar(
        backgroundColor: Colors.grey[900]!, // Set app bar background color to pastel grey
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Breathing Exercises', // Set app bar title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            color: Colors.white, // Set title text color to black
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose an Exercise', // Display instruction to choose an exercise
                style: TextStyle(
                  color: Colors.white, // Set text color to black
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              _buildButton('4-7-8 Technique', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourSevenEightScreen()), // Navigate to 4-7-8 breathing exercise screen
                );
              }),
              SizedBox(height: 20.0),
              _buildButton('Box Breathing', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoxBreathingScreen()), // Navigate to box breathing exercise screen
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build custom button
  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Set text color to white
          backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color to pink with opacity
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Apply rounded border to button
        ),
        child: Text(
          text, // Button text
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
