import 'package:common/common.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import '../../data/models/rental.dart';
import 'commonbutton.dart';

class RentalItemCard extends StatefulWidget {
  const RentalItemCard({
    super.key,
    required this.rental,
  });

  final Rental rental;
  @override
  State<RentalItemCard> createState() => _RentalItemCardState();
}

class _RentalItemCardState extends State<RentalItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: SquicircleContainer(
              height: double.infinity,
              child: Image.network(
                widget.rental.images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.rental.name,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.rental.type == VehicleType.TWO_WHEELER
                            ? [
                                Expanded(
                                    child: IconText(
                                        icon: NavBarIcons.burger,
                                        text:
                                            '${widget.rental.engineCapacity}cc')),
                                Expanded(
                                  child: IconText(
                                      icon: NavBarIcons.burger,
                                      text: '${widget.rental.mileage} kmpl'),
                                ),
                              ]
                            : [
                                Expanded(
                                    child: IconText(
                                        icon: NavBarIcons.burger,
                                        text:
                                            widget.rental.fuelType.toString())),
                                Expanded(
                                  child: IconText(
                                      icon: NavBarIcons.burger,
                                      text:
                                          '${widget.rental.seatingCapacity} Seater'),
                                ),
                              ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Counter(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Rs. ${widget.rental.price.toStringAsFixed(2)} per day',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(85, 85, 85, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 13, right: 8),
                          child: CommonButton(
                            onPressed: () {
                              showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: SquicircleContainer(
                                          height: 300,
                                          margin: EdgeInsets.all(10),
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: PopUpMessage()),
                                    );
                                  });
                            },
                            borderradius: 4,
                            height: 48,
                            width: 328,
                            lable: 'Request Ride',
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
          const Text('Rental Request Sent'),
          const SizedBox(
            height: 10,
          ),
          const Text('check home section for updates'),
          const SizedBox(
            height: 10,
          ),
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
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
