import 'package:customer/middleware/blocs/order/order_bloc.dart';
import 'package:customer/middleware/blocs/products/products_bloc.dart';
import 'package:customer/presentation/widgets/fooditemcard.dart';
import 'package:customer/data/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                ElevatedButton(
                  onPressed: () {
                    context.read<OrderBloc>().add(CreateRideRequest(pickUpLocation: pickupController.text, dropOffLocation: dropoffController.text, pickUpCoordinates: '123.123', dropOffCoordinates: '123.123'));
                  },
                  child: const Text('Request Ride'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
