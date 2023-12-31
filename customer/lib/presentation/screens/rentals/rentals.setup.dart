import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/rental/rental_cubit.dart';
import '../../widgets/twoitemtabview.dart';
import 'rentalselect.dart';

class RentalSetup extends StatelessWidget {
  const RentalSetup({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RentalCubit>().fetchAllRentals();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: TwoItemTabView(
          child1: BlocBuilder<RentalCubit, RentalState>(
            builder: (context, state) {
              return state.rentalList != null
                  ? RentalSelect(rentalList: state.rentalList)
                  : Center(child: CircularProgressIndicator());
            },
          ),
          child2: BlocBuilder<RentalCubit, RentalState>(
            builder: (context, state) {
              return state.rentalList != null
                  ? RentalSelect(rentalList: state.rentalList)
                  : Center(child: CircularProgressIndicator());
            },
          ),
          tab1: const Tab(text: 'Vehicles'),
          tab2: const Tab(
            text: 'Essentials',
          ),
        ),
      ),
    );
  }
}
