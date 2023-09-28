import 'package:common/common.dart';
import 'package:customer/middleware/blocs/rentalcubit/rental_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/rental.dart';
import '../buttons/commonbutton.dart';

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
  int vehicleCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: SquicircleContainer(
                height: constraints.maxHeight - 10,
                child: Image.network(
                  "https://dummyimage.com/300",
                  // widget.rental.image != null
                  //     ? widget.rental.image!
                  //     : "https://dummyimage.com/300",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
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
                                      text: widget.rental.fuelType.toString())),
                              Expanded(
                                child: IconText(
                                    icon: NavBarIcons.burger,
                                    text:
                                        '${widget.rental.seatingCapacity} Seater'),
                              ),
                            ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (vehicleCount > 1) {
                                setState(() {
                                  vehicleCount = vehicleCount - 1;
                                });
                              }
                            },
                            icon: const Icon(Icons.remove_circle),
                            color: const Color.fromRGBO(65, 65, 65, 0.7)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(vehicleCount.toString()),
                        const SizedBox(
                          width: 10.0,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              vehicleCount = vehicleCount + 1;
                            });
                          },
                          icon: const Icon(Icons.add_circle),
                          color: const Color.fromRGBO(73, 204, 115, 1),
                        ),
                      ],
                    ),
                    Text(
                      'Rs. ${widget.rental.price.toStringAsFixed(2)} per day',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(85, 85, 85, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CommonButton(
                      onPressed: () async {
                        
                        context
                            .read<RentalCubit>()
                            .createRentalRequest(widget.rental.id.toString())
                            .then((value) {
                          if (value) {
                            showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: SquicircleContainer(
                                        height: 230,
                                        margin: const EdgeInsets.all(30),
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: PopUpMessage(
                                            text: value
                                                ? 'Rental Request Sent'
                                                : 'sorry! can\'t book')),
                                  );
                                });
                          }
                        });
                      },
                      borderradius: 4,
                      height: 48,
                      width: 328,
                      lable: 'Request Ride',
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
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

class PopUpMessage extends StatelessWidget {
  const PopUpMessage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Image(image: AssetImage('assets/check.png'), height: 60),
              Text(text),
              const SizedBox(
                height: 10,
              ),
              const Text('check home section for updates'),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          CommonButton(
            onPressed: () {
              Navigator.pop(context);
            },
            borderradius: 4,
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