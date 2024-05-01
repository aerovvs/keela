import 'package:flutter/material.dart';
import 'journal_entry_screen.dart'; // Import the journal entry screen
import 'journal_entries_screen.dart'; // Import the journal entries screen
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late String _selectedEmoji; // Store the selected emoji
  bool _isButtonVisible = false; // Control the visibility of the "Next" button

  @override
  void initState() {
    super.initState();
    _selectedEmoji = ''; // Initialize the selected emoji as empty
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Set app bar background color to dark grey
        title: Text(
          'How are you feeling?', // Set app bar title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true, // Center align the title
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow icon color to white
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEmojiButton('😞'), // Emoji button for feeling sad
                _buildEmojiButton('😐'), // Emoji button for feeling neutral
                _buildEmojiButton('😊'), // Emoji button for feeling happy
              ],
            ),
            SizedBox(height: 20.0),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500), // Animation duration
              opacity: _isButtonVisible ? 1.0 : 0.0, // Set opacity based on button visibility
              child: ElevatedButton(
                onPressed: _selectedEmoji.isNotEmpty ? _openJournalEntry : null, // Enable button if an emoji is selected
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Set text color to white
                  backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Set button background color
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Set border radius
                  ),
                ),
                child: Text(
                  'Next', // Button text
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiButton(String emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedEmoji = emoji; // Update selected emoji
          _isButtonVisible = true; // Show the "Next" button
        });
      },
      child: Container(
        padding: EdgeInsets.all(20.0), // Set padding for the container
        decoration: BoxDecoration(
          border: Border.all(color: _selectedEmoji == emoji ? Colors.blue : Colors.transparent), // Highlight the selected emoji
          borderRadius: BorderRadius.circular(10.0), // Set border radius for the container
        ),
        child: Text(
          emoji, // Display the emoji
          style: TextStyle(fontSize: 30.0), // Set font size for the emoji
        ),
      ),
    );
  }

  void _openJournalEntry() {
    Navigator.push( // Navigate to the journal entry screen with the selected emoji
      context,
      MaterialPageRoute(builder: (context) => JournalEntryScreen(selectedEmoji: _selectedEmoji)),
    );
  }
}
