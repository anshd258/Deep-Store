import 'package:customer/middleware/blocs/rental/rental_bloc.dart';
import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/twoitemtabview.dart';
import 'rentalselect.dart';
import 'rideselect.dart';

class VehicleSelect extends StatelessWidget {
  const VehicleSelect({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RentalBloc>().add(FetchRentals());

    return RefreshIndicator(
      onRefresh: () async {
        context.read<RentalBloc>().add(FetchRentals());
      },
      child: TwoItemTabView(
        child1: BlocBuilder<RentalBloc, RentalState>(
          builder: (context, state) {
            return RentalSelect(
                rentalList: state.rentalList);
          },
        ),
        child2: const RideSelect(),
        tab1: const Tab(text: 'rent a ride'),
        tab2: const Tab(
          text: 'book a ride',
        ),
      ),
    );
  }
}
