import 'package:customer/constants/colors.dart';
import 'package:customer/data/models/rental.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/rental/rental_cubit.dart';
import '../../widgets/cards/rentalitemcard.dart';

class RentalSelect extends StatefulWidget {
  const RentalSelect({super.key, this.rentalList});
  final List<Rental>? rentalList;
  @override
  State<RentalSelect> createState() => _RentalSelectState();
}

class _RentalSelectState extends State<RentalSelect> {
  late bool twoWheelers = false;
  late bool fourWheelers = false;
  @override
  Widget build(BuildContext context) {
    List<Rental> displayList = [];
    if (widget.rentalList != null) {
      if (twoWheelers) {
        displayList.addAll(widget.rentalList!
            .where((element) => element.type == VehicleType.TWO_WHEELER));
      }
      if (fourWheelers) {
        displayList.addAll(widget.rentalList!
            .where((element) => element.type == VehicleType.FOUR_WHEELER));
      }
      if (twoWheelers == false && fourWheelers == false) {
        displayList = widget.rentalList ?? [];
      }

      return Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text('Two wheelers only'),
                    const SizedBox(width: 10),
                    Switch(
                      activeColor: Colors.white,
                      activeTrackColor: CustomColors.lightGreen,
                      value: twoWheelers,
                      onChanged: (value) {
                        setState(() {
                          twoWheelers = value;
                          fourWheelers = value ? false : fourWheelers;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Four wheelers only'),
                    const SizedBox(width: 10),
                    Switch(
                      activeColor: Colors.white,
                      activeTrackColor: CustomColors.lightGreen,
                      value: fourWheelers,
                      onChanged: (value) {
                        setState(() {
                          fourWheelers = value;
                          twoWheelers = value ? false : twoWheelers;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<RentalCubit>().fetchAllRentals();
              },
              child: displayList.isEmpty
                  ? const Center(
                      child: Text('No rental available in your location!!'))
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        Rental rental = displayList[index];
                        return RentalItemCard(
                          rental: rental,
                        );
                      }),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
