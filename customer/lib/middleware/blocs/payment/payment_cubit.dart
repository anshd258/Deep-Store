
import 'package:bloc/bloc.dart';
import 'package:customer/data/apiservice.dart';
import 'package:customer/data/models/payment.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../constants.dart';
import '../../../data/models/foodorder.dart';
import '../../helpers/constants.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit()
      : super(const PaymentInitial(paymentStatus: PaymentStatus.unInitialized));

  void clear() {
    emit(const PaymentInitial(paymentStatus: PaymentStatus.unInitialized));
  }

  Future<void> initiatePayment(
      BuildContext context, FoodOrder order, String accessToken) async {
    OrderPaymentData? orderPaymentData = await createOrder(order.id);
    if (orderPaymentData != null) {
      String itemNames = order.items
          .map((item) => item.itemName.toString())
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
  Map<String,dynamic>? verifyresponse = await ApiService.post(
              endpoint: Constants.orderVerification,
              body: {
                'order_id': response.orderId,
                'payment_id': response.paymentId,
                'signature': response.signature
              });
          if (verifyresponse != null) {
            if (verifyresponse['status'] == 'success') {
              await updateOrderStatus(order.id, OrderStatus.confirmed)
                  .then((value) {
                emit(const UpdatePaymentState(
                    paymentStatus: PaymentStatus.success));
              });
            } else {
              emit(const UpdatePaymentState(
                  paymentStatus: PaymentStatus.rejected));
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print('unable to verify payment status');
          }
        }
      }

      Future<void> handlePaymentError(PaymentFailureResponse response) async {
        await updateOrderStatus(order.id, OrderStatus.hold).then((value) {
          emit(const UpdatePaymentState(
              paymentStatus: PaymentStatus.unInitialized));
        });
      }

      void handleExternalWallet(ExternalWalletResponse response) {}

      updateOrderStatus(order.id, OrderStatus.processing).then((value) {
        emit(const UpdatePaymentState(paymentStatus: PaymentStatus.processing));
        Razorpay razorpay = Razorpay();
        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
        razorpay.open(options);
      });
    }
  }

  Future<bool> updateOrderStatus(String orderId, OrderStatus status) async {
    Map<String, dynamic> body = {
      "order": {"id": orderId, "status": status.index}
    };
    Map<String, dynamic>? response = await ApiService.post(
        endpoint: Constants.updateFoodOrder,
        body: body);
    if (response != null) {
      if (response['id'] == orderId) {
        return true;
      }
    }
    return false;
  }
}

Future<OrderPaymentData?> createOrder(String orderId) async {
  Map<String, dynamic>? response = await ApiService.post(
 endpoint: Constants.orderPayment,
      body: {'order_id': orderId});
  if (response != null) {
    return OrderPaymentData.fromJson(response);
  }
  return null;
}
