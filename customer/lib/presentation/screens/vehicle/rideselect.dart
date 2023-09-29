import 'package:customer/data/models/ride.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  color: Colors.blue,
                  child: Image.asset(
                    'assets/map.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: pickupController,
                  decoration: const InputDecoration(
                    labelText: 'Enter pickup location',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: dropoffController,
                  decoration: const InputDecoration(
                    labelText: 'Enter drop-off location',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32.0),
                CommonButton(
                  onPressed: () {
                    /// fire event to create ride request
                    context.read<RideCubit>().createRideRequest(
                          Ride(
                              rating: 5,
                              status: RequestStatus.pending,
                              pickUpLocation: pickupController.text,
                              dropOffLocation: dropoffController.text,
                              pickUpCoordinates: pickupCoordinates,
                              dropOffCoordinates: dropOffCoordinates),
                        );
                    showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return Center(
                            child: SquicircleContainer(
                                height: 230,
                                margin: EdgeInsets.all(30),
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
                                                pickUpLocation:
                                                    pickupController.text,
                                                dropOffLocation:
                                                    dropoffController.text,
                                                pickUpCoordinates:
                                                    pickupCoordinates,
                                                dropOffCoordinates:
                                                    dropOffCoordinates),
                                          );
                                      print(status);
                                      return status;
                                    },
                                    processingText: 'trying to book a ride',
                                    successText: 'Ride Request Sent',
                                    faliureText: 'sorry! can\'t book')),
                          );
                        });
                  },
                  borderradius: 4,
                  height: 48,
                  width: 328,
                  lable: 'Request Ride',
                  margin: const EdgeInsets.symmetric(vertical: 10),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
