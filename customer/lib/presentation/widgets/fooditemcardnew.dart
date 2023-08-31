
import 'package:customer/presentation/widgets/graedient.common.button.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import '../../data/models/food.dart';
import '../screens/food/fooddetails.dart';

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
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SquicircleContainer(
              width: 160,
              height: 140,
              child: Image.network(
                widget.food.images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
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
                        const SizedBox(
                          height: 10.0,
                        ),
                         Text(
                          widget.food.description,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Rs. ${widget.food.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 13, right: 8),
                            child: GradientCommonButton(
                              function: () {
                             showDialog(
                                  barrierColor: Colors.black45,
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: SquicircleContainer(
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(10),
                                        height: 500,
                                        child: FoodDetailSelector(
                                            food: widget.food,
                                            outerContext: context),
                                      ),
                                    );
                                  });
                              },
                              borderradius: 4,
                              height: 48,
                              width: 328,
                              lable: 'More details',
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10),
                            )),
                      ],
                    ),
                  ],
                ),
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
          GradientCommonButton(
            function: () {
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
