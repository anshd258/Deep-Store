import 'package:customer/middleware/blocs/products/products_bloc.dart';
import 'package:customer/presentation/widgets/itemcard.dart';
import 'package:customer/data/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideSelect extends StatelessWidget {
  const RideSelect({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Builder(builder: (context) {
          List<Ride>? rideList = context.read<ProductsBloc>().state.rideList;
          return rideList != null
              ? ListView.builder(
                  itemCount: rideList.length,
                  itemBuilder: (context, index) {
                    /// display the data here
                    Ride ride = rideList[index];
                    return ServiceCard(
                      name: ride.name,
                      description: ride.description,
                      price: ride.price,
                      images: ride.images,
  
                      onClick: () {
                        print('you clicked a button');
                      },
                    );
                  })
              : const Center(child: CircularProgressIndicator.adaptive());
        });
      },
    );
  }
}
