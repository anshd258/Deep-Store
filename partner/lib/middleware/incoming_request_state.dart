part of 'incoming_request_cubit.dart';

@immutable
abstract class IncomingRequestState {}

class IncomingRequestInitial extends IncomingRequestState {
  IncomingRequestInitial();
}

class IncomingRequestLoading extends IncomingRequestState {
  IncomingRequestLoading();
}

class IncomingRequestcomplete extends IncomingRequestState {
  FoodRequest foodRequest;

  IncomingRequestcomplete({required this.foodRequest});
}

class IncomingRequestError extends IncomingRequestState {
  String message;
  IncomingRequestError(this.message);
}
