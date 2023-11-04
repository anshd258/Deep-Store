import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/body/Accepted.body.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/FilterContainer.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/filter_cubit_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropDownValue = "All";

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
                              height: 40,
                              child: BlocConsumer<AcceptedRequestsCubit,
                                  AcceptedRequestsState>(
                                // buildWhen: (previous, current) {
                                //   if (previous is AcceptedRequestsLoading &&
                                //       current is AcceptedRequestsLoaded) {
                                //     return true;
                                //   } else {
                                //     return false;
                                //   }
                                // },
                                listener: (context, state) {
                                  if (state is AcceptedRequestsError) {
                                    // if (state.message == "token_not_valid") {
                                    //   Future.delayed(
                                    //     Duration(milliseconds: 500),
                                    //     () => Navigator.pushNamedAndRemoveUntil(
                                    //         context, "/", (route) => false),
                                    //   );
                                    // }
                                  }

                                  dropDownValue = state.currentDropDownValue;
                                },
                                builder: (context, state) {
                                  if (state is AcceptedRequestsLoaded) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromRGBO(
                                                    194, 194, 194, 1))),
                                        child: DropdownButton<String>(
                                          value: dropDownValue,
                                          icon: const Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.black54),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.transparent,
                                          ),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              dropDownValue = value!;
                                              context
                                                  .read<AcceptedRequestsCubit>()
                                                  .dropDownValueChange(value);
                                            });
                                          },
                                          items: state.dropDownValues!.map((e) {
                                            print(e);
                                            return DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(e.toString()),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return progressIndicator;
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

  // void setMaker(AcceptedRequestsState state) {
  //   List<String> debu = state.foodRequest!.orders!.map<String>((e) {
  //     return e.user!.room!;
  //   }).toList();
  //   distinct = debu.toSet().toList();
  //   dropDownValue = distinct.first;
  //   print(distinct);
  // }
}
