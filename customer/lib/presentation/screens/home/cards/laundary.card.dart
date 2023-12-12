import 'package:customer/constants/colors.dart';
import 'package:customer/constants/textstyles.dart';
import 'package:flutter/material.dart';

class LaundryRequestCard extends StatelessWidget {
  const LaundryRequestCard(
      {super.key,
      required this.title,
      this.titleTrail,
      this.subTitle,
      required this.trailing,
      this.icon});
  final String title;
  final String? titleTrail;
  final String? subTitle;
  final String trailing;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              title: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(
                      icon,
                      size: 40,
                      color: CustomColors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: CustomTextStyles.body(color: Colors.black),
                            ),
                            Text(
                              titleTrail ?? '',
                              style: CustomTextStyles.subBody(),
                            ),
                          ],
                        ),
                        Text(
                          subTitle ?? '',
                          style: CustomTextStyles.subBody(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        trailing,
                        style: CustomTextStyles.body(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                    Center(child: Text('add laundary details'),)
                    ],
                  ),
                ),
              ]),
        ));
  }
}
