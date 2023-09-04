import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatefulWidget {
  String lable;
  VoidCallback onPressed;
  double height;
  double width;
  double borderradius;
  EdgeInsets margin;


  CommonButton(
      {super.key,
      required this.onPressed,
       this.height = 48,
       this.margin =const EdgeInsets.symmetric(vertical: 18),
       this.borderradius = 4,
      required this.lable,
       this.width = 300});

  @override
  State<CommonButton> createState() => _GradientCommonButtonState();
}

class _GradientCommonButtonState extends State<CommonButton>
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
        widget.onPressed();
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
