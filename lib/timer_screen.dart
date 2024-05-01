import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration(minutes: 1); // Set default duration to 1 minute
  late bool _isTimerRunning = false; // Initialize timer running state
  late int _remainingSeconds = _duration.inSeconds; // Initialize remaining seconds
  late Timer _timer; // Declare timer object
  String? _selectedDuration; // Declare selected duration variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Set background color to pastel grey
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Set app bar background color to pastel grey
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Timer', // Set app bar title to Timer
          style: GoogleFonts.caveat( // Apply Google Fonts Caveat style
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton( // Use IconButton for the back button
          icon: Icon(
            Icons.arrow_back, // Use the arrow icon with a line in the middle
            color: Colors.white, // Set arrow color to white
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back when arrow button is pressed
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Duration', // Display select duration message
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            _buildDurationSelector(), // Build duration selector dropdown
            SizedBox(height: 20.0),
            _buildTimer(), // Build timer display
            SizedBox(height: 20.0),
            _buildControlButtons(), // Build control buttons
          ],
        ),
      ),
    );
  }

  Widget _buildDurationSelector() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Duration>(
        value: _duration,
        onChanged: (value) {
          setState(() {
            _duration = value!;
            _remainingSeconds = _duration.inSeconds;
            _selectedDuration = _duration.toString();
          });
        },
        style: TextStyle(color: Colors.white), // Set font color to white
        icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Set arrow color to white
        items: [
          DropdownMenuItem(
            value: Duration(minutes: 1),
            child: Text(
              '1 minute', // Display duration options
              style: TextStyle(
                color: _selectedDuration == Duration(minutes: 1).toString() ? Colors.white : Colors.black, // Change text color based on selection
              ),
            ),
          ),
          DropdownMenuItem(
            value: Duration(minutes: 5),
            child: Text(
              '5 minutes', // Display duration options
              style: TextStyle(
                color: _selectedDuration == Duration(minutes: 5).toString() ? Colors.white : Colors.black, // Change text color based on selection
              ),
            ),
          ),
          DropdownMenuItem(
            value: Duration(minutes: 10),
            child: Text(
              '10 minutes', // Display duration options
              style: TextStyle(
                color: _selectedDuration == Duration(minutes: 10).toString() ? Colors.white : Colors.black, // Change text color based on selection
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Text(
      '${_remainingSeconds ~/ 60}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}', // Display remaining time in mm:ss format
      style: TextStyle(
        color: Colors.white,
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _startTimer, // Set onPressed action for the Start button
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color to pastel pink
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Set button padding
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Set button border radius
          ),
          child: Text(
            'Start', // Display Start button text
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Set text style
          ),
        ),
        SizedBox(width: 20.0),
        ElevatedButton(
          onPressed: _stopTimer, // Set onPressed action for the Stop button
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color to pastel pink
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Set button padding
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Set button border radius
          ),
          child: Text(
            'Stop', // Display Stop button text
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Set text style
          ),
        ),
      ],
    );
  }

  void _startTimer() {
    setState(() {
      _isTimerRunning = true; // Set timer running state to true
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) { // Check if time is up
        _timer.cancel(); // Cancel timer
        setState(() {
          _isTimerRunning = false; // Set timer running state to false
        });
      } else {
        setState(() {
          _remainingSeconds--; // Decrement remaining time by 1 second
        });
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isTimerRunning = false; // Set timer running state to false
      _remainingSeconds = _duration.inSeconds; // Reset remaining time to initial duration
    });
    _timer.cancel(); // Cancel timer
  }
}
