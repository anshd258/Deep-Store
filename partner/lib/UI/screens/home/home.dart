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
  String dropDownValue = "";
  List<String> distinct = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
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
                              width: 60,
                              height: 50,
                              child: BlocConsumer<AcceptedRequestsCubit,
                                  AcceptedRequestsState>(
                                listenWhen: (previous, current) {
                                  if (previous is AcceptedRequestsLoading &&
                                      current is AcceptedRequestsLoaded) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                },
                                listener: (context, state) {
                                  List<String> debu = state.foodRequest!.orders!
                                      .map<String>((e) {
                                    return e.user!.room!;
                                  }).toList();
                                  distinct = debu.toSet().toList();
                                  dropDownValue = distinct.first;
                                  print(distinct);
                                },
                                builder: (context, state) {
                                  if (state is AcceptedRequestsLoaded) {
                                    return DropdownButton<String>(
                                      value: dropDownValue,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.black54,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropDownValue = value!;
                                        });
                                      },
                                      items: distinct.map((e) {
                                        print(e);
                                        return DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e.toString()),
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
                    height: constraints.maxHeight - 88,
                    child: const RidesBody())
              ],
            ),
          );
        },
      ),
    );
  }
}
