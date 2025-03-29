import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_validation_poc/src/pages/validation_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: ValidationPage(),
    );
  }
}
