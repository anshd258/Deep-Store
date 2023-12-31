import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/widget/Buttons/optionbuttons.dart';


class FilterWidget extends StatefulWidget {
  String type;

  FilterWidget({super.key, required this.type});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      print(constrains.maxWidth);

      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Text(
                "Ongoing requests",
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 220, maxHeight: 33),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: value.values.map((e) {
                        return OptionsButton(
                          e: e,
                          type: widget.type,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
