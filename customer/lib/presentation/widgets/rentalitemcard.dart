import 'package:common/common.dart';
import 'package:customer/middleware/blocs/rental/rental_bloc.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  int vehicleCount = 1;
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
                widget.rental.image != null
                    ? widget.rental.image!.first
                    : "https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2l0eSUyMGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
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
                              context.read<RentalBloc>().add(
                                  CreateRentalRequest(
                                      rental: widget.rental,
                                      vehicleCount: vehicleCount));
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

class PopUpMessage extends StatelessWidget {
  const PopUpMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Image(image: AssetImage('assets/check.png'), height: 60),
              Text('Rental Request Sent'),
              SizedBox(
                height: 10,
              ),
              Text('check home section for updates'),
              SizedBox(
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
