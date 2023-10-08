import 'package:customer/middleware/blocs/payment/payment_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/sharedprefrence.utils.dart';
import 'package:customer/presentation/screen.setup.dart';
import 'package:customer/presentation/screens/food/cart/cart.dart';
import 'package:customer/presentation/widgets/buttons/commonbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../middleware/blocs/food/food_cubit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          switch (state.paymentStatus) {
            case PaymentStatus.initializing:
              return Center(
                  child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Initializing Payment',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(44, 44, 44, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please do not press back',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(85, 85, 85, 1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    
                    ],
                  ),
                ),
              ));
            case PaymentStatus.processing:
              return Center(
                  child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Awaiting Payment',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(44, 44, 44, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Complete Payment on gateway',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(85, 85, 85, 1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          },
                          lable: 'Cancel')
                    ],
                  ),
                ),
              ));
            case PaymentStatus.success:
              return Center(
                  child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage('assets/check.png', ), height: 60,),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Payment ',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(44, 44, 44, 1)),
                          ),
                          Text(
                            'Done',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(73, 204, 115, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Check home section for updates ',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(85, 85, 85, 1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ScreenSetup()), (route) => false,);
                          },
                          lable: 'Home')
                    ],
                  ),
                ),
              ));
            case PaymentStatus.rejected:
              return Center(
                  child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage('assets/check.png'), height: 60, color: Colors.red,),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Payment ',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(44, 44, 44, 1)),
                          ),
                          Text(
                            'Unsuccessful',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color:  Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Something went wrong.',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(85, 85, 85, 1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          lable: 'Proceed to Cart')
                    ],
                  ),
                ),
              ));
            case PaymentStatus.unInitialized:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Center(
                child: Text(
                  'something is not right',
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                ),
              );
          }

          // if (state.paymentStatus == PaymentStatus.initializing) {
          //   return Center(
          //       child: Column(
          //     children: [
          //       const CircularProgressIndicator(),
          //       Text(
          //         'Initiating Payment Gateway',
          //         style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
          //       ),
          //     ],
          //   ));
          // }
          // if (state.paymentStatus == PaymentStatus.processing) {
          //   return Center(
          //       child: Column(
          //     children: [
          //       const CircularProgressIndicator(),
          //       Text(
          //         'Awaiting payment',
          //         style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
          //       ),
          //     ],
          //   ));
          // }
          // if (state.paymentStatus == PaymentStatus.success) {
          //   return Center(
          //       child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         'Success!!!',
          //         style: GoogleFonts.lato(fontSize: 18, color: Colors.green),
          //       ),
          //       CommonButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const ScreenSetup()));
          //           },
          //           lable: 'Home')
          //     ],
          //   ));
          // }
          // if (state.paymentStatus == PaymentStatus.rejected) {
          //   return Center(
          //       child: Column(
          //     children: [
          //       Text(
          //         'Payment was unsuccessful. try again!!',
          //         style: GoogleFonts.lato(fontSize: 18, color: Colors.red),
          //       ),
          //       CommonButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const ScreenSetup()));
          //           },
          //           lable: 'Home')
          //     ],
          //   ));
          // }
          // if (state.paymentStatus == PaymentStatus.unInitialized) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else {
          //   return Center(
          //     child: Text(
          //       'something is not right',
          //       style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
          //     ),
          //   );
          // }
        },
      ),
    );
  }
}
