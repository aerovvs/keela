import 'package:flutter/material.dart';
import 'journal.dart'; // Import the journal.dart file
import 'journal_entries_screen.dart'; // Import the journal entries screen
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class JournalEntryScreen extends StatefulWidget {
  final String selectedEmoji; // Selected emoji for the journal entry

  JournalEntryScreen({required this.selectedEmoji}); // Constructor to receive selected emoji

  @override
  _JournalEntryScreenState createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  late TextEditingController _textEditingController; // Controller for the text input field

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(); // Initialize the text controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Set app bar background color to dark grey
        title: Text(
          'What\'s on your mind?', // Set app bar title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true, // Center align the title
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.white), // Save icon
            onPressed: () {
              // Add functionality to save journal entry
              _saveJournalEntry();
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow icon color to white
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController, // Assign the text controller
                style: TextStyle(color: Colors.white), // Set text color to white
                maxLines: null, // Allow unlimited lines of text
                decoration: InputDecoration(
                  hintText: 'Write here...', // Placeholder text
                  hintStyle: TextStyle(color: Colors.white), // Placeholder text color
                  border: InputBorder.none, // Remove border
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveJournalEntry() {
    // Save the journal entry
    // Get the current date and time
    DateTime currentDate = DateTime.now();
    // Create a new journal entry with the current date
    JournalEntryModel entry = JournalEntryModel(
      widget.selectedEmoji, // Use selected emoji from the widget
      _textEditingController.text, // Get text from the text controller
      currentDate, // Use current date
    );
    Navigator.pushReplacement( // Replace the current screen with the journal entries screen
      context,
      MaterialPageRoute(builder: (context) => JournalEntriesScreen(entries: [entry])), // Pass the entry to the entries screen
    );
  }
}
