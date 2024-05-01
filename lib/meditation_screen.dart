import 'package:flutter/material.dart';
import 'timer_screen.dart'; // Import the TimerScreen
import 'breathing_exercises.dart'; // Import the BreathingExercisesScreen

class MeditationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900]!, // Set background color to pastel grey
      appBar: AppBar(
        backgroundColor: Colors.grey[900]!, // Set app bar background color to pastel grey
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Meditation', // Set app bar title
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Daily Meditation', // Display meditation message
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              _buildButton('Guided Breathing Exercises', () {
                // Navigate to BreathingExercisesScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BreathingExercisesScreen()),
                );
              }),
              SizedBox(height: 20.0),
              _buildButton('Start Timer', () {
                // Navigate to TimerScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerScreen()),
                );
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
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Set text color to white
          backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color
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
