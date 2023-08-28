import 'package:flutter/material.dart';


class ScreenSetup extends StatelessWidget {
  ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // RidesCard(),
         
          ],
        ),
      ),
    );
  }
}
