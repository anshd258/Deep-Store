import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:customer/data/models/payment.model.dart';
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
      : super(const PaymentInitial(paymentStatus: PaymentStatus.unInitialized));

  Future<void> initiatePayment(
      BuildContext context, FoodOrder order, String accessToken) async {
    print('initiatePayment function called');
    OrderPaymentData? orderPaymentData = await createOrder(order.id);
    if (orderPaymentData != null) {
      String itemNames = order.items
          .map((item) => item.food.name.toString())
          .toList()
          .join(", ");

      Map<String, dynamic> options = {
        'key': 'rzp_test_KOQ959haeWLbDP',
        'name': 'Nestafar Private Limited',
        'order_id': orderPaymentData.id,
        'description': itemNames,
        'timeout': 120,
        'prefill': {}
      };

      //////
      ///
      emit(const UpdatePaymentState(paymentStatus: PaymentStatus.initializing));

      Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
        try {
          print('starting payment verification');
          Response? verifyresponse = await DataSource.get(
              path: DataSource.orderVerification,
              queryType: QueryType.post,
              body: {
                'order_id': response.orderId,
                'payment_id': response.paymentId,
                'signature': response.signature
              });
          if (verifyresponse != null) {
            if (json.decode(verifyresponse.body)['status'] == 'success') {
              print('payment verified!!');
              await updateOrderStatus(order.id, RequestStatus.confirmed)
                  .then((value) {
                emit(const UpdatePaymentState(
                    paymentStatus: PaymentStatus.success));
              });
            } else {
              print('payment not verified');
              emit(const UpdatePaymentState(
                  paymentStatus: PaymentStatus.rejected));
            }
          }
        } catch (e) {
          print('unable to verify payment success status $e');
        }
      }

      Future<void> handlePaymentError(PaymentFailureResponse response) async {
        print('payment failed');
        await updateOrderStatus(order.id, RequestStatus.hold).then((value) {
          emit(const UpdatePaymentState(
              paymentStatus: PaymentStatus.unInitialized));
        });
      }

      void handleExternalWallet(ExternalWalletResponse response) {}

      updateOrderStatus(order.id, RequestStatus.processing).then((value) {
        emit(const UpdatePaymentState(paymentStatus: PaymentStatus.processing));
        Razorpay razorpay = Razorpay();
        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
        razorpay.open(options);
      });
    }
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

Future<OrderPaymentData?> createOrder(String orderId) async {
  Response? response = await DataSource.get(
      queryType: QueryType.post,
      path: DataSource.orderPayment,
      body: {'order_id': orderId});
  if (response != null) {
    return OrderPaymentData.fromJson(json.decode(response.body));
  }
}