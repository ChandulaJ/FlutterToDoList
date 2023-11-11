import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Icon icon;

  VoidCallback onPressed;

  MyButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed, icon: icon, label: Text(buttonName,style: GoogleFonts.openSans(fontSize: 18.0),));
  }
}
