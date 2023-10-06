import 'package:customer/middleware/blocs/foodcubit/food_cubit.dart';
import 'package:customer/middleware/blocs/payment/payment_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/sharedprefrence.utils.dart';
import 'package:customer/presentation/screen.setup.dart';
import 'package:customer/presentation/screens/food/cart/cart.dart';
import 'package:customer/presentation/widgets/buttons/commonbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesUtils.getString(key: SharedPrefrencesKeys.accessToken)
        .then((value) {
      context.read<PaymentCubit>().initiatePayment(
          context, context.read<FoodCubit>().state.cartOrder!, value!);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text(
            'Payment gateway',
            style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
          )),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state.paymentStatus == PaymentStatus.initializing) {
            return const Center(
                child: Column(
              children: [
                CircularProgressIndicator(),
                Text('Initializing Razorpay'),
              ],
            ));
          }
          if (state.paymentStatus == PaymentStatus.processing) {
            return const Center(
                child: Column(
              children: [
                CircularProgressIndicator(),
                Text('Processing payment'),
              ],
            ));
          }
          if (state.paymentStatus == PaymentStatus.success) {
            return Center(
                child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Text('Success!!!'),
                        CommonButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScreenSetup()));
                            },
                            lable: 'Home')
                      ],
                    )));
          }
          if (state.paymentStatus == PaymentStatus.rejected) {
            return Center(
                child: Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        const Text('Payment was unsuccessful. try again!!'),
                        CommonButton(onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScreenSetup()));
                        }, lable: 'Home')
                      ],
                    )));
          } else {
            return const Center(
              child: Text('something is not right'),
            );
          }
        },
      ),
    );
  }
}
