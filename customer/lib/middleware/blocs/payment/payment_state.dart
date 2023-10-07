part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {
  final PaymentStatus paymentStatus;
  const PaymentState({required this.paymentStatus});
}

final class PaymentInitial extends PaymentState {
  const PaymentInitial({required super.paymentStatus});
}
final class UpdatePaymentState extends PaymentState {
  const UpdatePaymentState({required super.paymentStatus});
}


enum PaymentStatus {
  unInitialized,
  initializing,
  processing,
  success,
  rejected
}