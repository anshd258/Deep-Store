part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {
  final PaymentStatus paymentStatus;

  PaymentState({required this.paymentStatus});
}

final class PaymentInitial extends PaymentState {
  PaymentInitial({required super.paymentStatus});
}
final class UpdatePaymentState extends PaymentState {
  UpdatePaymentState({required super.paymentStatus});
}


enum PaymentStatus {
  unInitialized,
  initializing,
  processing,
  success,
  rejected
}