import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView(
      {super.key,
      this.appBar,
      required this.screens,
      required this.items,
      this.backgroundColor});
  final PreferredSizeWidget? appBar;
  final List<Widget> screens;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: widget.appBar,
        body: widget.screens[index],
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 28,
            selectedFontSize: 15,
            unselectedFontSize: 15,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            selectedLabelStyle: GoogleFonts.lato(
                color: const Color.fromRGBO(34, 34, 34, 0.6),
                height: 1.5,
                fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.lato(
                color: const Color.fromRGBO(34, 34, 34, 0.6),
                height: 1.5,
                fontWeight: FontWeight.w600),
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            selectedItemColor: Colors.blue,
            unselectedItemColor: const Color.fromRGBO(34, 34, 34, 0.6),
            items: widget.items));
  }
}
