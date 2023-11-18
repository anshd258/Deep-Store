import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer/presentation/widgets/buttons/commonbutton.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../../../data/models/food.dart';
import '../../screens/food/fooddetails.dart';

class FoodItemCard extends StatefulWidget {
  const FoodItemCard({
    super.key,
    required this.food,
  });

  final Food food;
  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: 10)),
      child: Container(
        height: 160,
        margin: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SquicircleContainer(
                height: double.infinity,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl:
                        widget.food.images ?? "https://dummyimage.com/300"),
                // child: Image.network(
                //   widget.food.images ?? "https://dummyimage.com/300",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(85, 85, 85, 1),
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.food.description,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(85, 85, 85, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rs. ${widget.food.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(85, 85, 85, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CommonButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          builder: (context) {
                            return FoodDetailSelector(
                                food: widget.food, outerContext: context);
                          });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => FoodDetailSelector(
                      //             food: widget.food, outerContext: context)));
                    },
                    lable: 'More details',
                    margin: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: const Color.fromRGBO(73, 204, 115, 1),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 11.2,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(65, 65, 65, 0.7)),
        )
      ],
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.remove_circle, color: Color.fromRGBO(65, 65, 65, 0.7)),
        SizedBox(
          width: 10.0,
        ),
        Text('1'),
        SizedBox(
          width: 10.0,
        ),
        Icon(
          Icons.add_circle,
          color: Color.fromRGBO(73, 204, 115, 1),
        ),
      ],
    );
  }
}

class PopUpMessage extends StatelessWidget {
  const PopUpMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Image(image: AssetImage('assets/check.png'), height: 60),
          const Text('food Request Sent'),
          const Text('check home section for updates'),
          CommonButton(
            onPressed: () {
              Navigator.pop(context);
            },
            borderradius: 4,
            height: 48,
            width: 328,
            lable: 'Okay',
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
