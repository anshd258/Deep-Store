import 'package:flutter/material.dart';
import 'package:partner/UI/util/textwidget.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';

Future<dynamic> rentalRemovalDialog(BuildContext context, String name) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: SizedBox(
        height: 140,
        child: Column(
          children: [
            textwidget(
                "Remove “$name” from the list ?", "", 16, FontWeight.w600),
            textwidget(
                "",
                "Removing it will also remove it from the users app.",
                14,
                FontWeight.w400),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedDeclineButton(
                        color: Colors.redAccent.shade400,
                        function: () {
                          Navigator.pop(context);
                        },
                        height: 40,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        borderradius: 8,
                        lable: "Remove",
                        width: 110),
                    GradientCommonButton(
                        function: () {
                          Navigator.pop(context);
                        },
                        height: 40,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        borderradius: 8,
                        lable: "Edit",
                        width: 110)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
