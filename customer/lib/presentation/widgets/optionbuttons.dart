import 'package:customer/middleware/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../middleware/blocs/filtercubit/filter_cubit.dart';

class OptionsButton extends StatefulWidget {
  final FilterValue e;
  final FilterValue selectede;

  OptionsButton({
    super.key,
    required this.e,
    required this.selectede,
  });

  @override
  State<OptionsButton> createState() => _OptionsButtonState();
}

class _OptionsButtonState extends State<OptionsButton>
    with SingleTickerProviderStateMixin {
  AnimationController? ctr;

  @override
  void initState() {
    ctr = AnimationController(vsync: this, lowerBound: 0, upperBound: 1);
    ctr!.stop();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ctr!.forward().then((value) => ctr!.reset());
        context.read<FilterCubit>().changeFilter(widget.e, widget.e.index + 1);

        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          gradient: widget.e == widget.selectede
              ? const LinearGradient(colors: [
                  Color.fromRGBO(32, 171, 154, 1),
                  Color.fromRGBO(34, 150, 199, 1)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : const LinearGradient(colors: [
                  Color.fromRGBO(227, 227, 227, 1),
                  Color.fromRGBO(227, 227, 227, 1),
                ], begin: Alignment.bottomCenter, end: Alignment.topRight),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: 33, minWidth: 60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.e.name,
            style: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: widget.e == widget.selectede
                    ? Colors.white
                    : Colors.grey.shade700),
          ),
        ),
      ),
    ).animate(controller: ctr);
  }
}
