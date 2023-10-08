import 'package:customer/data/models/rental.dart';
import 'package:customer/middleware/helpers/constants.dart';
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
                      activeTrackColor: const Color.fromRGBO(168, 217, 119, 1),
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
                      activeTrackColor: const Color.fromRGBO(168, 217, 119, 1),
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
              child: ListView.builder(
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

class LabeledToggleButton extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  const LabeledToggleButton({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  _LabeledToggleButtonState createState() => _LabeledToggleButtonState();
}

class _LabeledToggleButtonState extends State<LabeledToggleButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        const SizedBox(width: 10),
        Switch(
          activeColor: Colors.white,
          activeTrackColor: const Color.fromRGBO(168, 217, 119, 1),
          value: _value,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ],
    );
  }
}
