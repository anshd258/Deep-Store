import 'package:customer/UI/widgets/itemcard.dart';
import 'package:customer/middleware/blocs/data/data_bloc.dart';
import 'package:customer/data/models/rental.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentalSelect extends StatelessWidget {
  const RentalSelect({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {},
      child: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            List<Rental>? rentalList =
                context.read<DataBloc>().state.rentalList;
            return rentalList != null
                ? ListView.builder(
                    itemCount: rentalList.length,
                    itemBuilder: (context, index) {
                      /// display the data here
                      Rental rental = rentalList[index];
                      return ServiceCard(
                        name: rental.name,
                        description: rental.description,
                        price: rental.price,
                        images: rental.images,

                        onClick: () {
                          print('you clicked a button');
                        },
                      );
                    })
                : const Text('no rentals available.');
          });
        },
      ),
    );
  }
}
