import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/body/history.body.dart';
import 'package:partner/UI/widget/FilterContainer.dart';

import 'package:partner/middleware/HistoryCubit/food_history_cubit.dart';
import 'package:partner/middleware/HistoryCubit/rental_history_cubit.dart';
import 'package:partner/middleware/HistoryCubit/ride_history_cubit.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FoodHistoryCubit>().getHistory();
      context.read<RentalHistoryCubit>().getHistory();
      context.read<RideHistoryCubit>().getHistory();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
          child: Text(
            'History',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color(0xFF565656),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.28,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // RidesCard(),
          FilterWidget(type: "history"),
          const HistoryBody()
        ],
      ),
    );
  }
}
