import 'package:customer/middleware/helpers/storage.utils.dart';
import 'package:customer/presentation/widgets/buttons/commonbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../middleware/blocs/food/food_cubit.dart';
import '../../../../middleware/blocs/payment/payment_cubit.dart';
import '../../../../middleware/helpers/constants.dart';
import 'cardbody.dart';
import 'payment.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const CartBody(),
      bottomNavigationBar: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: BlocBuilder<FoodCubit, FoodState>(
                      builder: (context, state) {
                        return Text(
                          'Rs.${state.cartOrder!.totalPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black87,
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CommonButton(
                        onPressed: () async {
                          // initiate payment
                          LocalStorage.read(key: LocalStorageKeys.accessToken)
                              .then((value) {
                            context.read<PaymentCubit>().initiatePayment(
                                context,
                                context.read<FoodCubit>().state.cartOrder!,
                                value!);
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
                        },
                        lable: 'Proceed to Pay'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
