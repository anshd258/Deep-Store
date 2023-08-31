import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';

class FoodRequest extends StatelessWidget {
  FoodRequest({super.key});
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(
            'Food Requests',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Color(0xFF565656),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.28,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: val.map((e) => OwnerRequestcard()).toList(),
          ),
        ),
      ),
    );
  }
}
