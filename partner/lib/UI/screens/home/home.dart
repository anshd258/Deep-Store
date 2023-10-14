import 'package:flutter/material.dart';
import 'package:partner/UI/body/Accepted.body.dart';
import 'package:partner/UI/widget/FilterContainer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // RidesCard(),
              FilterWidget(type: "Accepted"),
              SizedBox(
                  height: constraints.maxHeight - 88, child: const RidesBody())
            ],
          ),
        );
      },
    );
  }
}
