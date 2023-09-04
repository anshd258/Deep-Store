import 'package:customer/middleware/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/filtercubit/filter_cubit.dart';
import '../../widgets/optionbuttons.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Text(
              "Ongoing requests",
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    return Container(
                      constraints:
                          const BoxConstraints(maxWidth: 220, maxHeight: 33),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: FilterValue.values.map((e) {
                          return OptionsButton(
                            e: e,
                            selectede: state.SelectedValue,
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
