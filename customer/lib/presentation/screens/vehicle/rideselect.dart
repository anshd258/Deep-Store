import 'package:customer/data/models/ride.dart';
import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/commonbutton.dart';
import '../../widgets/rentalitemcard.dart';
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
                    context.read<RideBloc>().add(CreateRideRequest(
                      Ride(rating: 5,status: RequestStatus.pending,
                      pickUpLocation: pickupController.text,
                      dropOffLocation: dropoffController.text,
                      pickUpCoordinates: pickupCoordinates,
                      dropOffCoordinates: dropOffCoordinates
                      ),
                    ));
                    showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: IntrinsicHeight(
                              child: SquicircleContainer(
                                  margin: EdgeInsets.all(10),
                                  width: double.infinity,
                                  color: Colors.amber,
                                  child: PopUpMessage()),
                            ),
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
