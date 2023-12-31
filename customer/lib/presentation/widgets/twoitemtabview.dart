import 'package:flutter/material.dart';

class TwoItemTabView extends StatelessWidget {
  const TwoItemTabView(
      {super.key,
      required this.child1,
      required this.child2,
      required this.tab1,
      required this.tab2});
  final Widget child1;
  final Widget child2;
  final Tab tab1;
  final Tab tab2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      surfaceVariant: Colors.transparent,
                    ),
              ),
              child: TabBar(
                  labelColor: const Color.fromRGBO(44, 44, 44, 1),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const UnderlineTabIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue, width: 4)),
                  tabs: [tab1, tab2]),
            ),
          ),
          body: TabBarView(
            children: [child1, child2],
          ),
        ));
  }
}
