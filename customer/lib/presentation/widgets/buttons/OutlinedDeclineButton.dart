import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedDeclineButton extends StatefulWidget {
  final String lable;
  final VoidCallback function;
  final double height;
  final Color color;
  final double width;
  final IconData? icon;
  final double borderradius;
  final EdgeInsets margin;
  const OutlinedDeclineButton(
      {super.key,
      this.icon,
      required this.color,
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
        duration: const Duration(milliseconds: 500));
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
                color: widget.color,
                strokeAlign: BorderSide.strokeAlignInside)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.lable,
              style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: widget.color),
            ),
            if (widget.icon != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  widget.icon!,
                  color: widget.color,
                  size: 20,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
