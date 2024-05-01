import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart'; // Importing Google Fonts package

class FourSevenEightScreen extends StatefulWidget {
  @override
  _FourSevenEightScreenState createState() => _FourSevenEightScreenState();
}

class _FourSevenEightScreenState extends State<FourSevenEightScreen> {
  bool _showInstructions = true; // Flag to control displaying instructions
  bool _showTimer = false; // Flag to control displaying timer
  int _step = 1; // Current step of the breathing technique
  int _remainingSeconds = 4; // Remaining seconds for each step
  late Timer _timer; // Timer for counting down the seconds

  @override
  void initState() {
    super.initState();
    // Start timer after showing instructions
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when disposing the screen
    super.dispose();
  }

  // Method to start the timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds == 0) {
          if (_step == 1) {
            _step++;
            _remainingSeconds = 7;
          } else if (_step == 2) {
            _step++;
            _remainingSeconds = 8;
          } else {
            _step = 1;
            _remainingSeconds = 4;
          }
        } else {
          _remainingSeconds--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900]!, // Set background color to dark grey
      appBar: AppBar(
        backgroundColor: Colors.grey[900]!, // Set app bar background color to dark grey
        elevation: 0,
        centerTitle: true,
        title: Text(
          '4-7-8 Technique', // Set app bar title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            color: Colors.white, // Set title text color to white
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton( // Add back button to navigate back
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: _showInstructions // Display instructions or timer based on flag
            ? _buildInstructions()
            : _showTimer
            ? _buildTimer()
            : SizedBox.shrink(),
      ),
    );
  }

  // Widget to build the instructions screen
  Widget _buildInstructions() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Instructions for 4-7-8 Technique:', // Display instructions
            style: TextStyle(
              color: Colors.white, // Set text color to white
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          // Display each step of instructions
          Text(
            '1. Sit or lie down in a comfortable position.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '2. Place the tip of your tongue against the ridge of tissue just behind your upper front teeth, and keep it there throughout the exercise.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '3. Exhale completely through your mouth, making a whoosh sound.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '4. Close your mouth and inhale quietly through your nose to a mental count of four.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '5. Hold your breath for a count of seven.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '6. Exhale completely through your mouth, making a whoosh sound to a count of eight.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          ElevatedButton( // Button to start the timer
            onPressed: () {
              setState(() {
                _showInstructions = false;
                _showTimer = true;
              });
            },
            style: ButtonStyle( // Style the button
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent.withOpacity(0.7)), // Set button background color to pink with opacity
            ),
            child: Text(
              'Start Timer', // Button text
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the timer screen
  Widget _buildTimer() {
    String buttonText = _step == 1 ? 'Inhale (4 seconds)' : _step == 2 ? 'Hold (7 seconds)' : 'Exhale (8 seconds)';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Step $_step', // Display current step
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          buttonText, // Display current step instruction
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          '$_remainingSeconds', // Display remaining seconds
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
