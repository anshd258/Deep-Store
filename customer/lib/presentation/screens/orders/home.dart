import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/filtercubit/filter_cubit.dart';
import '../../../middleware/helpers/widgetFactory.dart';
import 'FilterContainer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    /// call the function to fetch order data
    
    List values = [1, 2, 3, 4, 5, 6, 7];
    return Column(
      children: [
        FilterWidget(),
        Expanded(
          child: BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: values.map((e) {
                  return Widgetfactory().onTabChange(state.tabIndex);
                }).toList(),
              ),
            ),
          );
              },
            ),
        )
      ],
    );
  }
}