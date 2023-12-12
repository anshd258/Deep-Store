import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/widget/Aleartdialog/teamdisplay.dialog.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/Constants/constants.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/UI/util/utilwidget.dart';

class FoodRequest extends StatefulWidget {
  const FoodRequest({super.key});

  @override
  State<FoodRequest> createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 2,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: Text(
            'Food Requests',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color(0xFF565656),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.28,
            ),
          ),
        ),
      ),
      body: SizedBox(
          height: double.infinity,
          child: BlocConsumer<IncomingFoodRequestCubit, IncomingRequestState>(
            listener: (context, state) {
              if (state is IncomingRequestError) {
                errorSnackBar(context, state.message);
              }
            },
            buildWhen: (previous, current) {
              if (previous is IncomingRequestcomplete &&
                  current is IncomingRequestError) {
                return false;
              } else {
                return true;
              }
            },
            builder: (context, state) {
              if (state is IncomingRequestLoading) {
                return progressIndicator;
              }
              if (state is IncomingRequestError) {
                return errorIcon;
              }
              if (state is IncomingRequestcomplete) {
                if (state.foodRequest.orders!.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return LiquidPullToRefresh(
                          onRefresh: () async {
                            context
                                .read<IncomingFoodRequestCubit>()
                                .getIncomingRequest(
                                    StatusFood.processing.code.toString(),
                                    "567");
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraints.minHeight,
                                    maxHeight: constraints.maxHeight,
                                    minWidth: constraints.minWidth,
                                    maxWidth: constraints.maxWidth),
                                child: Center(
                                  child: noAcceptedRequest,
                                )),
                          ));
                    },
                  );
                } else {
                  return LiquidPullToRefresh(
                    onRefresh: () async {
                      context
                          .read<IncomingFoodRequestCubit>()
                          .getIncomingRequest(
                              StatusFood.processing.code.toString(), "567");
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: state.foodRequest.orders!
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  IteamDisplayDialog(
                                    context: context,
                                    acceptFunction: () {},
                                    declineFunction: () {},
                                    e: e,
                                    acceptTitle: "Mark complete",
                                    declineTitle: "Cancel request",
                                  );
                                },
                                child: OwnerRequestcard(
                                    heading1: "Guest name",
                                    heading2: "Room no",
                                    heading3: "Items ordered",
                                    heading4: "Total Price",
                                    data1: e.user!.username!,
                                    data2: e.user!.room!,
                                    data3: e.items!.length.toString(),
                                    data4: e.total!,
                                    type: RequestType.food,
                                    id: e.id!.toString()),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                }
              } else {
                return const Center();
              }
            },
          )),
    );
  }
}
