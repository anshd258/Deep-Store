import 'package:flutter/material.dart';
import 'package:partner/UI/screens/widget/ownerOngoingcard.dart';

class ScreenSetup extends StatelessWidget {
  ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;
  List values = [1, 2, 3, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: values.map((e) => ownerOngoingcards()).toList(),
          ),
        ),
      ),
    );
  }
}
