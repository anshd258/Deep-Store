import 'package:customer/data/models/user.dart';

class UserRepository {
  User? user;
  int? roomNumber;
  int? providerId;

  UserRepository({this.user, this.roomNumber, this.providerId});

  void set({
    User? user,
    int? roomNumber,
    int? providerId,
  }) {
    this.user = user;
    this.roomNumber = roomNumber;
    this.providerId = providerId;
  }
}
