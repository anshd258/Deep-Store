part of 'data_bloc.dart';

@immutable
sealed class DataEvent {}

class UpdateDataEvent extends DataEvent {}
