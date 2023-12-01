import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionSwitch extends StatefulWidget {
  final Function fun1;
  final Function fun2;
  final String? image1;
  final String switchTitle1;
  final String switchTitle2;
  final String? image2;
  const SelectionSwitch(
      {super.key,
      required this.fun1,
      required this.fun2,
      this.image1,
      required this.switchTitle1,
      required this.switchTitle2,
      this.image2});

  @override
  State<SelectionSwitch> createState() => _SelectionSwitchState();
}

class _SelectionSwitchState extends State<SelectionSwitch> {
  bool veg = true;
  bool nonVeg = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Switch.adaptive(
              value: veg,
              activeTrackColor: Colors.blue,
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.white;
              }),
              inactiveThumbImage: widget.image1 != null
                  ? AssetImage(
                      widget.image1!,
                    )
                  : null,
              activeThumbImage: widget.image1 != null
                  ? AssetImage(
                      widget.image1!,
                    )
                  : null,
              onChanged: (val) {
                setState(() {
                  veg = val;
                  widget.fun1();
                });
              },
            ),
            Text(
              widget.switchTitle1,
              style:
                  GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Row(
          children: [
            Switch.adaptive(
                value: nonVeg,
                activeTrackColor: Colors.blue,
                thumbColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return Colors.white;
                }),
                inactiveThumbImage: widget.image2 != null
                    ? AssetImage(
                        widget.image2!,
                      )
                    : null,
                activeThumbImage: widget.image2 != null
                    ? AssetImage(
                        widget.image2!,
                      )
                    : null,
                onChanged: (val) {
                  setState(() {
                    nonVeg = val;
                    widget.fun2();
                  });
                }),
            Text(
              widget.switchTitle2,
              style:
                  GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
