import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/middleware/AcceptedRequestCubit/filter_cubit_cubit.dart';
import 'package:partner/middleware/HistoryCubit/history_filter_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_filter_cubit.dart';

class OptionsButton extends StatefulWidget {
  final value e;
  String type;
  OptionsButton({super.key, required this.e, required this.type});

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
    return Builder(
      builder: (context) {
        late var state;
        
        if (widget.type == "Accepted") {
          state = context.watch<FilterCubitCubit>().state;
        } else if (widget.type == "history") {
          state = context.watch<HistoryFilterCubit>().state;
        } else if (widget.type == "partner") {
          state = context.watch<PartnerFilterCubit>().state;
        }

       
        return GestureDetector(
          onTap: () {
            ctr!.forward().then((value) => ctr!.reset());
            if (state is FilterCubitState) {
              context
                  .read<FilterCubitCubit>()
                  .ChangeFilter(widget.e, widget.e.index + 1);
            } else if (state is HistoryFilterState) {
              context
                  .read<HistoryFilterCubit>()
                  .ChangeFilter(widget.e, widget.e.index + 1);
            }else if(state is PartnerFilterState){
               context
                  .read<PartnerFilterCubit>()
                  .ChangeFilter(widget.e, widget.e.index + 1);
            }

            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              color: Colors.grey,
              gradient: widget.e == state.SelectedValue
                  ? const LinearGradient(colors: [
                      Color.fromRGBO(32, 171, 154, 1),
                      Color.fromRGBO(34, 150, 199, 1)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                  : const LinearGradient(colors: [
                      Colors.grey,
                      Colors.grey,
                    ], begin: Alignment.bottomCenter, end: Alignment.topRight),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            constraints: const BoxConstraints(minHeight: 33, minWidth: 60),
            child: Text(
              widget.e.name,
              style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: widget.e == state.SelectedValue
                      ? Colors.white
                      : Colors.grey.shade700),
            ),
          ),
        )
            .animate(controller: ctr)
            .elevation(
                borderRadius: BorderRadius.circular(30), begin: 0, end: 5)
            .scaleXY(
                begin: 1, end: 1.1, duration: const Duration(microseconds: 10));
      },
    );
  }
}
