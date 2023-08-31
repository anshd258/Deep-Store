import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientCommonButton extends StatefulWidget {
  String lable;
  VoidCallback function;
  double height;
  double width;
  double borderradius;
  EdgeInsets margin;

  GradientCommonButton(
      {super.key,
      required this.function,
      required this.height,
      required this.margin,
      required this.borderradius,
      required this.lable,
      required this.width});

  @override
  State<GradientCommonButton> createState() => _GradientCommonButtonState();
}

class _GradientCommonButtonState extends State<GradientCommonButton>
    with SingleTickerProviderStateMixin {
  AnimationController? ctr;
  @override
  void initState() {
    ctr = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 500));
    ctr!.stop();

    super.initState();
  }

  @override
  void dispose() {
    ctr!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ctr!.forward().then((value) => ctr!.reset());

        setState(() {});
        widget.function();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderradius),
          ),
          color: Colors.grey,
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(32, 171, 154, 1),
            Color.fromRGBO(34, 150, 199, 1)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        margin: widget.margin,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        constraints:
            BoxConstraints(maxWidth: widget.width, maxHeight: widget.height),
        child: Text(
          widget.lable,
          style: GoogleFonts.lato(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ).animate().blur(
        duration: Duration(milliseconds: 800),
        begin: Offset(1, 1),
        end: Offset(0, 0));
  }
}
