import 'package:customer/constants/textstyles.dart';
import 'package:customer/data/models/ride.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/enums.dart';
import '../../widgets/cards/rentalitemcard.dart';
import '../../widgets/buttons/commonbutton.dart';
import '../../widgets/squicircle.dart';

class RideSelect extends StatefulWidget {
  const RideSelect({super.key});

  @override
  State<RideSelect> createState() => _RideSelectState();
}

class _RideSelectState extends State<RideSelect> {
  TextEditingController dropoffController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  String pickupCoordinates = '123';
  String dropOffCoordinates = '456';
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 250,
                child: Image.asset(
                  'assets/map.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            'Enter pick-up location',
                            style: CustomTextStyles.subHeading(
                                color: const Color(0xFF555555)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: const Color(0x33565656),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: pickupController,
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      suffixIconColor:
                                          Color.fromRGBO(73, 204, 115, 1),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(
                                  color: Color(0x33565656),
                                  indent: 8,
                                  endIndent: 8,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: Icon(Icons.my_location_outlined),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Enter drop-off location',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(85, 85, 85, 1)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            height: 58,
                            child: TextField(
                              controller: dropoffController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(86, 86, 86, 0.2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CommonButton(
              onPressed: () {
                showDialog(
                    barrierColor: Colors.black26,
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SquicircleContainer(
                            height: MediaQuery.of(context).size.height / 3.5,
                            margin: const EdgeInsets.all(30),
                            width: double.infinity,
                            color: Colors.white,
                            child: PopUpMessage(
                              function: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                bool status = await context
                                    .read<RideCubit>()
                                    .createRideRequest(
                                      Ride(
                                          rating: 5,
                                          status: RequestStatus.pending,
                                          pickUpLocation: pickupController.text,
                                          dropOffLocation:
                                              dropoffController.text,
                                          pickUpCoordinates: pickupCoordinates,
                                          dropOffCoordinates:
                                              dropOffCoordinates,
                                          pickUpTime: DateTime.now()),
                                    );
                                pickupController.clear();
                                dropoffController.clear();
                                return status;
                              },
                              entity: 'Ride',
                            )),
                      );
                    });
              },
              borderradius: 4,
              height: 50,
              lable: 'Request Ride',
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            )
          ],
        ),
      ),
    );
  }
}
