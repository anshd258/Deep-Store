import 'package:customer/data/models/rental.dart';
import 'package:customer/presentation/widgets/rentalitemcard.dart';
import 'package:flutter/material.dart';

class RentalSelect extends StatefulWidget {
  const RentalSelect({super.key, this.rentalList});
  final List<Rental>? rentalList;
  @override
  State<RentalSelect> createState() => _RentalSelectState();
}

class _RentalSelectState extends State<RentalSelect> {
  bool twoWheelers = true;
  bool fourWheelers = false;
  List<Rental>? displayList;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
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
          child: widget.rentalList != null
              ? ListView.builder(
                  itemCount: widget.rentalList!.length,
                  itemBuilder: (context, index) {
                    Rental rental = widget.rentalList![index];
                    return RentalItemCard(
                      rental: rental,
                    );
                  })
              : const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ],
    );
  }
}

class LabeledToggleButton extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const LabeledToggleButton({
    super.key,
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
