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
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Color.fromRGBO(229, 229, 229, 1), width: 1))),
            child: BottomNavigationBar(
                elevation: 0,
                iconSize: 18,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                selectedLabelStyle: GoogleFonts.lato(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromRGBO(49, 207, 221, 1),
                          Color.fromRGBO(49, 221, 204, 1),
                          // Color.fromRGBO(34, 150, 199, 1)
                        ],
                      ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 300.0, 300.0)),
                    height: 1.5,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: GoogleFonts.lato(
                    color: const Color.fromRGBO(34, 34, 34, 0.6),
                    fontWeight: FontWeight.w600),
                type: BottomNavigationBarType.fixed,
                currentIndex: index,
                selectedItemColor: Color.fromRGBO(49, 207, 221, 1),
                unselectedItemColor: const Color.fromRGBO(34, 34, 34, 0.6),
                items: widget.items)));
  }
}
