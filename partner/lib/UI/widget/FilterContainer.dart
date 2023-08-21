import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/widget/optionbuttons.dart';


import 'package:partner/middleware/filter_cubit_cubit.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget>
     {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Text(
              "Ongoing requests",
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                BlocBuilder<FilterCubitCubit, FilterCubitState>(
                  builder: (context, state) {
                    return Container(
                      constraints: BoxConstraints(maxWidth: 220, maxHeight: 33),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: value.values.map((e) {
                          return  OptionsButton(
                              
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
