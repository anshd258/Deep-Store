import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedDeclineButton extends StatefulWidget {
  String lable;
  VoidCallback function;
  double height;
  double width;
  double borderradius;
  EdgeInsets margin;
  OutlinedDeclineButton(
      {super.key,
      required this.function,
      required this.height,
      required this.margin,
      required this.borderradius,
      required this.lable,
      required this.width});

  @override
  State<OutlinedDeclineButton> createState() => _OutlinedDeclineButtonState();
}

class _OutlinedDeclineButtonState extends State<OutlinedDeclineButton>
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
            color: Colors.white,
            border: Border.all(
                width: 2,
                color: Color(0xFFC25C5C),
                strokeAlign: BorderSide.strokeAlignInside)),
        margin: widget.margin,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        constraints:
            BoxConstraints(maxWidth: widget.width, maxHeight: widget.height),
        child: Text(
          widget.lable,
          style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFFC25C5C)),
        ),
      ),
    );
  }
}