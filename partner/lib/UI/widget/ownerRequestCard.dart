import 'package:flutter/material.dart';
import 'package:partner/UI/widget/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/graedient.common.button.dart';
import 'package:partner/UI/widget/ridesCard.dart';

class OwnerRequestcard extends StatefulWidget {
  const OwnerRequestcard({super.key});

  @override
  State<OwnerRequestcard> createState() => _OwnerRequestcardState();
}

class _OwnerRequestcardState extends State<OwnerRequestcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RidesDetailsContainer(
                heading: 'Guest name',
                data: 'Alice lee',
                fontSize: 16,
              ),
              RidesDetailsContainer(
                heading: 'Room no',
                data: '403',
                fontSize: 16,
              ),
              GradientCommonButton(
                  function: () {},
                  height: 42,
                  margin: EdgeInsets.all(2),
                  borderradius: 4,
                  lable: "Accept",
                  width: 158)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RidesDetailsContainer(
                heading: 'Order name',
                data: 'Ice-cream (x 2)',
                fontSize: 16,
              ),
              RidesDetailsContainer(
                heading: 'Total Price',
                data: '170',
                fontSize: 16,
              ),
              OutlinedDeclineButton(
                  function: () {},
                  color:  Color(0xFFC25C5C),
                  height: 42,
                  margin: EdgeInsets.all(2),
                  borderradius: 4,
                  lable: "Decline",
                  width: 158)
            ],
          )
        ],
      ),
    );
  }
}
