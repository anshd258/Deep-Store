import 'package:customer/UI/screens/home/home.dart';
import 'package:flutter/material.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: const TabBar(tabs: [
          Tab(
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  color: Color.fromRGBO(34, 34, 34, 0.6),
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Color.fromRGBO(34, 34, 34, 0.6)),
                )
              ],
            ),
          ),
          Tab(
            child: Column(
              children: [
                Icon(
                  Icons.local_pizza,
                  color: Color.fromRGBO(34, 34, 34, 0.6),
                ),
                Text(
                  'Food',
                  style: TextStyle(color: Color.fromRGBO(34, 34, 34, 0.6)),
                )
              ],
            ),
          ),
          Tab(
            child: Column(
              children: [
                Icon(
                  Icons.car_crash,
                  color: Color.fromRGBO(34, 34, 34, 0.6),
                ),
                Text(
                  'Rides',
                  style: TextStyle(color: Color.fromRGBO(34, 34, 34, 0.6)),
                )
              ],
            ),
          ),
          Tab(
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromRGBO(34, 34, 34, 0.6),
                ),
                Text(
                  'Account',
                  style: TextStyle(color: Color.fromRGBO(34, 34, 34, 0.6)),
                )
              ],
            ),
          ),
        ]),
        body: const TabBarView(
          children: [
            Home(),
            Home(),
            Home(),
            Home(),
          ],
        ),
      ),
    );
  }
}
