part of 'food_history_cubit.dart';

@immutable
abstract class FoodHistoryState {
  FoodRequest? foodRequest;
  FoodHistoryState({this.foodRequest});
}

class FoodHistoryInitial extends FoodHistoryState {}

class FoodHistoryLoading extends FoodHistoryState {}

class FoodHistoryLoaded extends FoodHistoryState {
  FoodHistoryLoaded({super.foodRequest});
}

class FoodHistoryError extends FoodHistoryState {
  String message;
  FoodHistoryError({required this.message});
}
