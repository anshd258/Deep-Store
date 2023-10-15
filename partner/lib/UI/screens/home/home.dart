import 'package:flutter/material.dart';
import 'package:partner/UI/body/Accepted.body.dart';
import 'package:partner/UI/widget/FilterContainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int dropDownValue = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // RidesCard(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: constraints.maxWidth - (constraints.maxWidth - 252),
                    child: FilterWidget(type: "Accepted"),
                  ),
                ],
              ),

              SizedBox(
                  height: constraints.maxHeight - 88, child: const RidesBody())
            ],
          ),
        );
      },
    );
  }
}
