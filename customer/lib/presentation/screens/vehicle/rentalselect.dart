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
        List<Rental>? rentalList = context.read<RentalBloc>().state.rentalList;
        return Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LabeledToggleButton(
                    label: 'Two wheelers only',
                    initialValue: true,
                    onChanged: (value) {},
                  ),
                  LabeledToggleButton(
                    label: 'Four wheelers only',
                    initialValue: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
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
                          onClick: () {},
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

class LabeledToggleButton extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  LabeledToggleButton({
    required this.label,
    required this.initialValue,
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
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        SizedBox(width: 10),
        Switch(
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
