import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/middleware/filter_cubit_cubit.dart';

import '../../factory/widgetFactory.dart';
import '../widget/ownerOngoingcard.dart';

class RidesBody extends StatefulWidget {
  const RidesBody({super.key});

  @override
  State<RidesBody> createState() => _RidesBodyState();
}

class _RidesBodyState extends State<RidesBody> {
  List values = [1, 2, 3, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCubitCubit, FilterCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.loading) {
          return CircularProgressIndicator.adaptive();
        }
        return SizedBox(
          height: 604.333,
          child: SingleChildScrollView(
            child: Column(
              children: values.map((e) {
               
                return  Widgetfactory().onTabChange(state.tabIndex);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
