import 'package:customer/middleware/blocs/rental/rental_bloc.dart';
import 'package:customer/data/models/rental.dart';
import 'package:customer/presentation/widgets/rentalitemcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RentalSelect extends StatelessWidget {
  const RentalSelect({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<RentalBloc>().add(FetchRentals());

    return BlocBuilder<RentalBloc, RentalState>(
      builder: (context, state) {
                List<Rental>? rentalList =
                    context.read<RentalBloc>().state.rentalList;
        return Column(
          children: [
            Expanded(
              child: rentalList != null
                  ? ListView.builder(
                      itemCount: rentalList.length,
                      itemBuilder: (context, index) {
                        Rental rental = rentalList[index];
                        return RentalItemCard(
                          name: rental.name,
                          price: rental.price,
                          images: rental.images,
                          onClick: () {
                          },
                        );
                      })
                  : const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ],
        );
      },
    );
  }
}
