import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/products/products_bloc.dart';
import '../../widgets/twoitemtabview.dart';
import 'rentalselect.dart';
import 'rideselect.dart';

class VehicleSelect extends StatelessWidget {
  const VehicleSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductsBloc>().add(UpdateRideListEvent());
        context.read<ProductsBloc>().add(UpdateRentalListEvent());
      },
      child: const TwoItemTabView(
        child1: RideSelect(),
        child2: RentalSelect(),
        tab1: Tab(text: 'rent a ride'),
        tab2: Tab(
          text: 'book a ride',
        ),
      ),
    );
  }
}
