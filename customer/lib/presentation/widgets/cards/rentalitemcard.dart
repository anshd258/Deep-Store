import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/nav_bar_icons_icons.dart';
import '../../../data/models/rental.dart';
import '../../../middleware/blocs/rental/rental_cubit.dart';
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
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: 10)),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SquicircleContainer(
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl: widget.rental.image ??
                            "https://dummyimage.com/300"),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        widget.rental.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color.fromRGBO(85, 85, 85, 1),
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.rental.type == VehicleType.TWO_WHEELER
                            ? [
                                Expanded(
                                    child: IconText(
                                        icon: NavBarIcons.engine,
                                        text:
                                            '${widget.rental.engineCapacity} cc')),
                                Expanded(
                                  child: IconText(
                                      icon: NavBarIcons.mileage,
                                      text: '${widget.rental.mileage} kmpl'),
                                ),
                              ]
                            : [
                                Expanded(
                                    child: IconText(
                                        icon: NavBarIcons.mileage,
                                        text:
                                            widget.rental.fuelType.toString())),
                                Expanded(
                                  child: IconText(
                                      icon: NavBarIcons.account,
                                      text:
                                          '${widget.rental.seatingCapacity} Seater'),
                                ),
                              ],
                      ),
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
                            icon: const Icon(Icons.remove_circle_outline),
                            color: const Color.fromRGBO(65, 65, 65, 0.7)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          vehicleCount.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              vehicleCount = vehicleCount + 1;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          color: const Color.fromRGBO(73, 204, 115, 1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        children: [
                          Text(
                            'Rs. ${widget.rental.price.toStringAsFixed(2)} ',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(85, 85, 85, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'per day',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(85, 85, 85, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonButton(
                      onPressed: () async {
                        showDialog(
                            barrierColor: Colors.black26,
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Center(
                                child: SquicircleContainer(
                                    cornerRadius: 12,
                                    height: MediaQuery.of(context).size.height /
                                        3.5,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 150, horizontal: 40),
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: PopUpMessage(
                                      function: () async {
                                        return await context
                                            .read<RentalCubit>()
                                            .createRentalRequest(
                                                widget.rental.id.toString(),
                                                vehicleCount);
                                      },
                                      entity: 'Rental',
                                    )),
                              );
                            });
                      },
                      borderradius: 4,
                      height: 42,
                      width: 328,
                      fontSize: 15,
                      lable: 'Request Ride',
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class PopUpMessage extends StatefulWidget {
  const PopUpMessage({
    super.key,
    this.function,
    required this.entity,
  });
  final String entity;

  ///  Ride or rental
  final Future<bool> Function()? function;
  @override
  State<PopUpMessage> createState() => _PopUpMessageState();
}

class _PopUpMessageState extends State<PopUpMessage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.function != null) {
        bool response = await widget.function!();
        setState(() {
          done = response;
        });
      }
    });
  }

  bool? done;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            const SizedBox(
                width: 100,
                height: 100,
                child:
                    Image(image: AssetImage('assets/check.png'), height: 60)),

            ////// text 1
            if (done == null)
              Column(
                children: [
                  Text(
                    'trying to book a ${widget.entity}',
                    style: GoogleFonts.lato(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'please wait',
                    style: GoogleFonts.lato(fontSize: 18),
                  )
                ],
              ),
            if (done == true)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.entity} Request ',
                        style: GoogleFonts.lato(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Sent',
                        style: GoogleFonts.lato(
                            color: const Color.fromRGBO(59, 164, 101, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'check home section for updates',
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ],
              ),
            if (done == false)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'sorry! ',
                        style: GoogleFonts.lato(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'can\'t book',
                        style: GoogleFonts.lato(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'check home section for updates',
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ],
              ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
        CommonButton(
          onPressed: () {
            if (done != null) Navigator.pop(context);
          },
          borderradius: 4,
          lable: 'Okay',
          margin: const EdgeInsets.all(12),
          child: done != null ? null : const CircularProgressIndicator(),
        ),
      ],
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
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(65, 65, 65, 0.7)),
        )
      ],
    );
  }
}
