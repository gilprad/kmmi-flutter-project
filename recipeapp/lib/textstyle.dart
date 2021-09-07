import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight weight;
  final Color color;
  // final TextAlign align;
  CustomTextStyle({
    required this.data,
    this.color = Colors.black,
    required this.size,
    required this.weight,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      '$data',
      style: GoogleFonts.montserrat(
          fontSize: size, fontWeight: weight, color: color),
    );
  }
}
