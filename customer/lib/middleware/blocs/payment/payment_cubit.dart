import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../data/datasource.dart';
import '../../../data/models/foodorder.dart';
import '../../helpers/constants.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit()
      : super(PaymentInitial(paymentStatus: PaymentStatus.unInitialized));

  Future<void> initiatePayment(
      BuildContext context, FoodOrder order, String accessToken) async {

        /// send order id.
        /// 
        /// I will receive order id.
        /// payment-status passs order id. receive payment status. 





    String itemNames = order.items
        .map((item) => item.food.name.toString())
        .toList()
        .join(", ");

    Map<String, dynamic> options = {
      'key': 'rzp_test_KOQ959haeWLbDP',
      'amount': order.totalPrice * 100,
      'name': 'Nestafar Private Limited',
      'order_id': 'order_EMBFqjDHEEn80l',
      'description': itemNames,
      'timeout': 120,
      'prefill': {'Authorization': accessToken}
    };

    //////
    ///
    emit(UpdatePaymentState(paymentStatus: PaymentStatus.initializing));

    Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
      print('payment was successful');

      await updateOrderStatus(order.id, RequestStatus.confirmed).then((value) {
        emit(UpdatePaymentState(paymentStatus: PaymentStatus.success));
      });
    }

    Future<void> handlePaymentError(PaymentFailureResponse response) async {
      print('payment failed');

      await updateOrderStatus(order.id, RequestStatus.failed).then((value) {

      emit(UpdatePaymentState(paymentStatus: PaymentStatus.rejected));
      });
    }

    void handleExternalWallet(ExternalWalletResponse response) {}


    updateOrderStatus(order.id, RequestStatus.processing).then((value) {
      Razorpay razorpay = Razorpay(); 
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
      razorpay.open(options);
    });
  }

  Future<bool> updateOrderStatus(String orderId, RequestStatus status) async {
    print('trying to update order status');
    Map<String, dynamic> body = {
      "order": {"id": orderId, "status": status.index}
    };
    Response? response = await DataSource.get(
        path: DataSource.updateFoodOrder,
        queryType: QueryType.post,
        body: body);
    if (response != null) {
      if (json.decode(response.body)['id'] == orderId) {
        return true;
      }
    }
    return false;
  }
}
