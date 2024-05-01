import 'package:flutter/material.dart';
import 'journal.dart'; // Import the journal.dart file
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class JournalEntryDetailScreen extends StatelessWidget {
  final JournalEntryModel entry; // Journal entry to display details of

  JournalEntryDetailScreen({required this.entry}); // Constructor to receive entry

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Set app bar background color to dark grey
        title: Text(
          'Journal Entry Details', // Set app bar title
          style: GoogleFonts.caveat( // Use Google Fonts Caveat for styling
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow icon color to white
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateFormat('MMMM dd, yyyy').format(entry.date)}', // Format the date using DateFormat
              style: TextStyle(fontSize: 18, color: Colors.white), // Styling for date
            ),
            SizedBox(height: 8), // Spacer
            Text(
              '${entry.emoji}', // Display emoji
              style: TextStyle(fontSize: 18, color: Colors.white), // Styling for emoji
            ),
            SizedBox(height: 8), // Spacer
            Text(
              '${entry.text}', // Display text content
              style: TextStyle(fontSize: 18, color: Colors.white), // Styling for text content
            ),
          ],
        ),
      ),
    );
  }
}
