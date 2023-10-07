import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class OrderTabBar extends StatefulWidget {
  final TabController controller;
  final List<String> labels;

  const OrderTabBar({
    super.key,
    required this.controller,
    required this.labels,
  });

  @override
  State<OrderTabBar> createState() => _OrderTabBarState();
}

class _OrderTabBarState extends State<OrderTabBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       widget.controller.addListener(() {
      setState(() {
      });
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: 33,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: widget.labels
            .map(
              (label) => GestureDetector(
                onTap: () {
                  widget.controller.animateTo(widget.labels.indexOf(label));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    gradient:
                        widget.controller.index == widget.labels.indexOf(label)
                            ? const LinearGradient(
                                colors: [
                                    Color.fromRGBO(32, 171, 154, 1),
                                    Color.fromRGBO(34, 150, 199, 1)
                                  ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)
                            : const LinearGradient(
                                colors: [
                                    Color.fromRGBO(227, 227, 227, 1),
                                    Color.fromRGBO(227, 227, 227, 1),
                                  ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topRight),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  constraints:
                      const BoxConstraints(minHeight: 33, minWidth: 60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      label,
                      style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: widget.controller.index ==
                                  widget.labels.indexOf(label)
                              ? Colors.white
                              : Colors.grey.shade700),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
