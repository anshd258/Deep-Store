import 'package:customer/constants/colors.dart';
import 'package:customer/constants/textstyles.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nav_bar_icons_icons.dart';

class TaxiRequestCard extends StatelessWidget {
  const TaxiRequestCard({
    super.key,
    required this.title,
    this.titleTrail,
    this.subTitle,
    required this.trailing,
  });
  final String title;
  final String? titleTrail;
  final String? subTitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              leading: const Icon(
                NavBarIcons.ride,
                size: 35,
                color: CustomColors.green,
              ),
              childrenPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    title,
                                    style: CustomTextStyles.body(
                                        color: Colors.black),
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          trailing,
                          style: CustomTextStyles.body(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ////////////////////////////////////////////
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text('add rental details'),
                      )
                    ],
                  ),
                ),
              ]),
        ));
  }
}
