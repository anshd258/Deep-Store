import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var errorIcon = Center(
  child:
      Icon(Icons.error_outline_outlined, color: Colors.red.shade400, size: 100),
);

const progressIndicator = Center(
  child: CircularProgressIndicator.adaptive(),
);

Widget noIncomingRequest = Center(
  child: Text(
    "No Incoming Requests 😥",
    style: GoogleFonts.lato(color: Colors.grey.shade800, fontSize: 20),
  ),
);
Widget noAcceptedRequest = Center(
  child: Text(
    "No Accepted Requests 😥",
    style: GoogleFonts.lato(color: Colors.grey.shade800, fontSize: 20),
  ),
);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorSnackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
