import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({
    super.key,
    this.appBar,
    required this.screens,
    required this.items,
  });
  final PreferredSizeWidget? appBar;
  final List<Widget> screens;
  final List<BottomNavigationBarItem> items;
  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        body: widget.screens[index],
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Color.fromRGBO(229, 229, 229, 1)))),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: BottomNavigationBar(
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  currentIndex: index,
                  items: widget.items),
            )));
  }
}
  