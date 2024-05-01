import 'package:flutter/material.dart';
import 'journal.dart'; // Import the journal.dart file
import 'homepage.dart'; // Import the homepage.dart file
import 'journal_entries_screen.dart'; // Import the JournalEntriesScreen
import 'journal_entry_screen.dart'; // Import the JournalEntryScreen
import 'journal_screen.dart'; // Import the JournalScreen

class InitialJournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Journal', // Set app bar title
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900]!, // Set app bar background color to dark grey
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('Make a New Entry', () {
                // Navigate to the screen with emojis and "How are you feeling today?"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JournalScreen()),
                );
              }),
              SizedBox(height: 20.0),
              _buildButton('All Saved Entries', () {
                // Navigate directly to the list of saved journal entries
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JournalEntriesScreen(entries: [])), // Pass an empty list of entries for now
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build a button
  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Set text color to white
          backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color to pink with opacity
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text, // Button text
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
