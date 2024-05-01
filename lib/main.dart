import 'package:flutter/material.dart';
import 'homepage.dart'; // Importing the homepage file

void main() {
  runApp(MeditationApp());
}

class MeditationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define color scheme for the app
    final ColorScheme colorScheme = ColorScheme.light(
      primary: Colors.grey[900]!, // Setting primary color to pastel grey
      secondary: Colors.pinkAccent, // Setting secondary color to pastel pink
    );

    final Color pinkColor = Colors.pink; // Defining pink color variable

    return MaterialApp(
      title: 'Keela', // Setting app title
      theme: ThemeData(
        colorScheme: colorScheme, // Applying defined color scheme
        scaffoldBackgroundColor: Colors.grey[900]!, // Setting scaffold background color to pastel grey
        appBarTheme: AppBarTheme(
          color: Colors.grey[900], // Setting app bar color to pastel grey
          iconTheme: IconThemeData(color: Colors.black), // Setting app bar icon color to black
          titleTextStyle: TextStyle(
            color: pinkColor, // Setting app bar title text color to pink
            fontSize: 20.0, // Setting app bar title font size
            fontWeight: FontWeight.bold, // Setting app bar title font weight to bold
          ),
        ),
      ),
      debugShowCheckedModeBanner: false, // Disabling debug banner
      home: HomeScreen(), // Setting the home screen as the default screen
    );
  }
}