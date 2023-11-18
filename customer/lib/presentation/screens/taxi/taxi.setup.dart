import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/rental/rental_cubit.dart';
import '../../widgets/twoitemtabview.dart';
import 'rideselect.dart';

class TaxiSetup extends StatelessWidget {
  const TaxiSetup({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RentalCubit>().fetchAllRentals();

    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: TwoItemTabView(
          child1: RideSelect(),
          child2: RideSelect(),
          tab1: Tab(text: 'Intercity'),
          tab2: Tab(
            text: 'Outstation',
          ),
        ),
      ),
    );
  }
}
