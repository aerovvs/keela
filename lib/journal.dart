import 'dart:convert'; // Import the dart:convert library for JSON encoding and decoding
import 'package:shared_preferences/shared_preferences.dart'; // Import the shared_preferences package

class JournalEntryModel {
  final String emoji; // Emoji representing the entry
  final String text; // Text content of the entry
  final DateTime date; // Date of the entry

  JournalEntryModel(this.emoji, this.text, this.date); // Constructor with emoji, text, and date parameters

  // Factory method to create a JournalEntryModel instance from a JSON map
  factory JournalEntryModel.fromJson(Map<String, dynamic> json) {
    return JournalEntryModel(json['emoji'], json['text'], DateTime.parse(json['date'])); // Parse the date from string to DateTime
  }

  // Method to convert a JournalEntryModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {'emoji': emoji, 'text': text, 'date': date.toIso8601String()}; // Convert date to ISO 8601 string format
  }
}

class JournalService {
  // Static method to fetch all journal entries from SharedPreferences
  static Future<List<JournalEntryModel>> getAllEntries() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? savedEntries = prefs.getStringList('journal_entries'); // Retrieve saved journal entries
    if (savedEntries != null) {
      return savedEntries.map((entry) {
        Map<String, dynamic> entryMap = json.decode(entry); // Decode JSON string to a map
        return JournalEntryModel.fromJson(entryMap); // Convert map to JournalEntryModel instance
      }).toList();
    }
    return []; // Return an empty list if no entries are found
  }

  // Static method to add a new journal entry to SharedPreferences
  static Future<void> addEntry(JournalEntryModel entry) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEntries = prefs.getStringList('journal_entries') ?? []; // Retrieve existing entries or create an empty list
    savedEntries.add(json.encode(entry.toJson())); // Encode entry to JSON string and add it to the list
    prefs.setStringList('journal_entries', savedEntries); // Save updated list to SharedPreferences
  }
}
