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


    return RefreshIndicator(
      onRefresh: () async {
        context.read<RentalBloc>().add(FetchRentals());
      },
      child:  TwoItemTabView(
        child1: RentalSelect(rentalList:  context.read<RentalBloc>().state.rentalList),
        child2: RideSelect(),
        tab1: Tab(text: 'rent a ride'),
        tab2: Tab(
          text: 'book a ride',
        ),
      ),
    );
  }
}
