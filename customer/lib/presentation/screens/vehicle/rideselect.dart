import 'package:customer/data/models/ride.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/cards/rentalitemcard.dart';
import '../../widgets/buttons/commonbutton.dart';
import '../../widgets/squicircle.dart';

class RideSelect extends StatelessWidget {
  const RideSelect({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController pickupController = TextEditingController();
    TextEditingController dropoffController = TextEditingController();
    String pickupCoordinates = '123';
    String dropOffCoordinates = '456';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                color: Colors.blue,
                child: Image.asset(
                  'assets/map.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enter pick-up location',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(85, 85, 85, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: pickupController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    suffixIconColor: const Color.fromRGBO(73, 204, 115, 1),
                    suffixIcon: const Icon(Icons.my_location),
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
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enter drop-off location',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(85, 85, 85, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: dropoffController,
                  keyboardType: TextInputType.streetAddress,
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
            ],
          ),
          const SizedBox(height: 32.0),
          CommonButton(
            onPressed: () {
              /// fire event to create ride request

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
                                              dropOffCoordinates),
                                    );
                                return status;
                              },
                              processingText: 'trying to book a ride',
                              successText: 'Ride Request Sent',
                              faliureText: 'sorry! can\'t book')),
                    );
                  });
              pickupController.clear();
              dropoffController.clear();
              
            },
            borderradius: 4,
            height: 48,
            width: 328,
            lable: 'Request Ride',
            margin: const EdgeInsets.symmetric(vertical: 10),
          )
        ],
      ),
    );
  }
}
