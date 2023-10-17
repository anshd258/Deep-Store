import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/body/Accepted.body.dart';
import 'package:partner/UI/widget/FilterContainer.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/filter_cubit_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> values = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int dropDownValue = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // RidesCard(),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          constraints.maxWidth - (constraints.maxWidth - 252),
                      child: FilterWidget(type: "Accepted"),
                    ),
                    BlocConsumer<FilterCubitCubit, FilterCubitState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state.tabIndex == 1) {
                          return SizedBox(
                            width: 40,
                            height: 50,
                            child: BlocBuilder<AcceptedRequestsCubit,
                                AcceptedRequestsState>(
                              builder: (context, state) {
                                if (state is AcceptedRequestsLoaded) {
                                  return DropdownButton<int>(
                                    value: dropDownValue,
                                    elevation: 16,
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.black54,
                                    ),
                                    onChanged: (int? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropDownValue = value!;
                                      });
                                    },
                                    items: values.map<DropdownMenuItem<int>>(
                                        (int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                  );
                                } else {
                                  return Center();
                                }
                              },
                            ),
                          );
                        } else {
                          return Center();
                        }
                      },
                    )
                  ]),

              SizedBox(
                  height: constraints.maxHeight - 88, child: const RidesBody())
            ],
          ),
        );
      },
    );
  }
}
