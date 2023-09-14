part of 'accepted_requests_cubit.dart';

@immutable
abstract class AcceptedRequestsState {
  FoodRequest? foodRequest;

  AcceptedRequestsState({this.foodRequest});
}

class AcceptedRequestsInitial extends AcceptedRequestsState {}

class AcceptedRequestsLoading extends AcceptedRequestsState {}

class AcceptedRequestsLoaded extends AcceptedRequestsState {
  AcceptedRequestsLoaded({super.foodRequest});
}

class AcceptedRequestsError extends AcceptedRequestsState {
  String message;
  AcceptedRequestsError({
    required this.message,
  });
}
