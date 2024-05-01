import 'package:flutter/material.dart';
import 'journal.dart'; // Import the journal.dart file
import 'homepage.dart'; // Import the homepage.dart file
import 'journal_entry_detail_screen.dart'; // Import the detail screen
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class JournalEntriesScreen extends StatelessWidget {
  final List<JournalEntryModel> entries; // List of journal entries

  JournalEntriesScreen({required this.entries}); // Constructor to receive list of entries

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Set app bar background color to dark grey
        title: Text(
          'Journal Entries', // Set app bar title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow icon color to white
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white), // Home icon
            onPressed: () {
              // Navigate back to the home screen without any back history
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder( // Display list of journal entries
        itemCount: entries.length, // Number of entries
        itemBuilder: (context, index) {
          return GestureDetector( // Wrap each ListTile with GestureDetector to make it tappable
            onTap: () {
              // Navigate to detail screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JournalEntryDetailScreen(entry: entries[index]),
                ),
              );
            },
            child: ListTile( // List item representing each journal entry
              title: Text(
                '${entries[index].emoji}: ${entries[index].text}', // Display emoji and text
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // Styling for text
              ),
            ),
          );
        },
      ),
    );
  }
}
