import 'package:flutter/material.dart';
import 'package:partner/UI/util/textwidget.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';


class PartnerFoodContainer extends StatelessWidget {
  const PartnerFoodContainer({super.key});

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
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: child,
                    ),
                  );
                },
                height: 130,
                width: 165,
                fit: BoxFit.fill,
              ),
              Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget("Ladakh ", "Tea stall", 16, FontWeight.w600),
                    textwidget("+91 ", "9911005213", 14, FontWeight.w400),
                    Row(
                      children: [
                        const Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.crop_square_sharp,
                              color: Colors.green,
                              size: 36,
                            ),
                            Icon(Icons.circle, color: Colors.green, size: 14),
                          ],
                        ),
                        textwidget(" ", "/ ", 25, FontWeight.w400),
                        const Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.crop_square_sharp,
                              color: Colors.red,
                              size: 36,
                            ),
                            Icon(Icons.circle, color: Colors.red, size: 14),
                          ],
                        ),
                      ],
                    ),
                    textwidget("9 ", "items listed", 14, FontWeight.w400),
                  ],
                ),
              )
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedDeclineButton(
                    color: Colors.redAccent.shade400,
                    function: () {},
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
                    lable: "Items",
                    width: 146)
              ],
            ),
          )
        ],
      ),
    );
  }
}
