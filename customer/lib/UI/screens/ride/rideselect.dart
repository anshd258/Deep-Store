import 'package:customer/UI/widgets/itemcard.dart';
import 'package:customer/middleware/blocs/data/data_bloc.dart';
import 'package:customer/data/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideSelect extends StatelessWidget {
  const RideSelect({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {},
      child: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            List<Ride>? rideList = context.read<DataBloc>().state.rideList;
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
                : const CircularProgressIndicator.adaptive();
          });
        },
      ),
    );
  }
}
