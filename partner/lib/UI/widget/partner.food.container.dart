import 'package:flutter/material.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/util/textwidget.dart';
import 'package:partner/UI/widget/Aleartdialog/partner.rental.remove.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';

class PartnerFoodContainer extends StatelessWidget {
  final String buttonTitle;
  final String title1;
  final String title2;
  final String title3;
  final Services? tab;
  final bool? veg;
  const PartnerFoodContainer(
      {super.key,
      required this.buttonTitle,
      required this.title1,
      required this.title3,
      required this.title2,
      this.tab,
      this.veg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                blurStyle: BlurStyle.outer)
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: AspectRatio(
        aspectRatio: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: child,
                          ),
                        );
                      },
                      width: 165,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 7),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: textwidget("", title1, 16, FontWeight.w600),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: textwidget("", title2, 12, FontWeight.w400,
                                color: Colors.grey.shade600),
                          ),
                          if (tab != null &&
                              tab == Services.FOOD &&
                              veg != null) ...[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.crop_square_sharp,
                                  color: veg! ? Colors.green : Colors.red,
                                  size: 20,
                                ),
                                Icon(Icons.circle,
                                    color: veg! ? Colors.green : Colors.red,
                                    size: 10),
                              ],
                            ),
                          ] else ...[
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  const Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.crop_square_sharp,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                      Icon(Icons.circle,
                                          color: Colors.green, size: 10),
                                    ],
                                  ),
                                  textwidget(" ", "/ ", 25, FontWeight.w400),
                                  const Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.crop_square_sharp,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                      Center(
                                        child: Icon(Icons.circle,
                                            color: Colors.red, size: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                          Expanded(
                              flex: 1,
                              child:
                                  textwidget("", title3, 14, FontWeight.w400)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedDeclineButton(
                      color: Colors.redAccent.shade400,
                      function: () {
                        rentalRemovalDialog(context, "Ladakh Tea stall");
                      },
                      height: 34,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      borderradius: 5,
                      lable: "Remove",
                      width: 146),
                  GradientCommonButton(
                      function: () {
                        Navigator.of(context).pushNamed(
                          "/partner/food/list",
                        );
                      },
                      height: 34,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      borderradius: 5,
                      lable: buttonTitle,
                      width: 146)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
