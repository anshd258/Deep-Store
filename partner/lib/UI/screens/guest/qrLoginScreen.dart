import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrLoginScreen extends StatelessWidget {
  const QrLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromRGBO(86, 86, 86, 1),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Scan QR for guest login",
            style: GoogleFonts.lato(
                color: const Color.fromRGBO(86, 86, 86, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: PrettyQrView.data(
            data: 'lorem ipsum dolor sit amet',
            errorCorrectLevel: 2,
            decoration: PrettyQrDecoration(
              shape: PrettyQrSmoothSymbol(
                  roundFactor: 0.8, color: Colors.grey.shade800),
              image: const PrettyQrDecorationImage(
                padding: EdgeInsets.all(30),
                image: AssetImage(
                  'assets/Logo.jpg',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
