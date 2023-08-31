import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/graedient.common.button.dart';
import '../../widgets/rentalitemcard.dart';
import '../../widgets/squicircle.dart';

class RideSelect extends StatelessWidget {
  const RideSelect({super.key});
  @override
  Widget build(BuildContext context) {

    TextEditingController pickupController = TextEditingController();
    TextEditingController dropoffController = TextEditingController();
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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter pickup location',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter drop-off location',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32.0),
                GradientCommonButton(
                                function: () {
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                              )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
