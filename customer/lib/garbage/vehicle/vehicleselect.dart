// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../middleware/blocs/rental/rental_cubit.dart';
// import '../../presentation/widgets/twoitemtabview.dart';
// import '../../presentation/screens/rentals/rentalselect.dart';
// import '../../presentation/screens/taxi/rideselect.dart';

// class VehicleSelect extends StatelessWidget {
//   const VehicleSelect({super.key});

//   @override
//   Widget build(BuildContext context) {
//     context.read<RentalCubit>().fetchAllRentals();

//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 10.0),
//         child: TwoItemTabView(
//           child1: BlocBuilder<RentalCubit, RentalState>(
//             builder: (context, state) {
//               return state.rentalList != null
//                   ? RentalSelect(rentalList: state.rentalList)
//                   : Center(child: CircularProgressIndicator());
//             },
//           ),
//           child2: const RideSelect(),
//           tab1: const Tab(text: 'Rent a ride'),
//           tab2: const Tab(
//             text: 'Book a ride',
//           ),
//         ),
//       ),
//     );
//   }
// }
