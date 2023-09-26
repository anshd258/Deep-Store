import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/rentalcubit/rental_cubit.dart';
import '../../widgets/twoitemtabview.dart';
import 'rentalselect.dart';
import 'rideselect.dart';

class VehicleSelect extends StatelessWidget {
  const VehicleSelect({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RentalCubit>().fetchAllRentals();

    return RefreshIndicator(
      onRefresh: () async {
        context.read<RentalCubit>().fetchAllRentals();
      },
      child: TwoItemTabView(
        child1: BlocBuilder<RentalCubit, RentalState>(
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
