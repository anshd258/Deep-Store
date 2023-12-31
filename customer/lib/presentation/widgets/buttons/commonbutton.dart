import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatefulWidget {
  final String lable;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double borderradius;
  final EdgeInsets margin;
  final Widget? child;
  final bool enabled;
  final double fontSize;

  const CommonButton(
      {super.key,
      this.child,
      required this.onPressed,
      this.height = 48,
      this.margin = const EdgeInsets.symmetric(vertical: 18),
      this.borderradius = 8,
      required this.lable,
      this.width = 300,
      this.enabled = true,
      this.fontSize = 18});

  @override
  State<CommonButton> createState() => _GradientCommonButtonState();
}

class _GradientCommonButtonState extends State<CommonButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.enabled) {
          widget.onPressed();
        }
      },
      child: Container(
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.71, -0.71),
            end: Alignment(-0.71, 0.71),
            colors: [Color(0xFF20AA9A), Color(0xFF2296C6)],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        margin: widget.margin,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        alignment: Alignment.center,
        constraints:
            BoxConstraints(maxWidth: widget.width, maxHeight: widget.height),
        child: widget.child ??
            Text(
              widget.lable,
              style: GoogleFonts.lato(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
      ),
    );
  }
}
