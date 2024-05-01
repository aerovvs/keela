import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Set background color to pastel grey
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Set app bar background color to pastel grey
        elevation: 0,
        title: Text(
          'Sleep', // Set app bar title
          style: GoogleFonts.caveat( // Apply Google Fonts Caveat style
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Sleep Sounds', // Display sleep sounds message
                style: GoogleFonts.caveat( // Apply Google Fonts Caveat style
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              _buildButton('Rain', () {
                // Implement onPressed action for the Rain button
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, // Set onPressed action for the button
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Set text color to white
          backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color to pastel pink
          padding: EdgeInsets.symmetric(vertical: 16.0), // Set padding
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Set border radius
        ),
        child: Text(
          text, // Button text
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Set text style
        ),
      ),
    );
  }
}
