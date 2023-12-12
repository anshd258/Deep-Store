part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {
  final Map<String, List<Order>>? allOrders;

  const OrdersState(this.allOrders);
}

final class OrdersInitial extends OrdersState {
  const OrdersInitial(super.allOrders);
}

final class OrdersUpdateState extends OrdersState {
  const OrdersUpdateState(super.allOrders);
}
