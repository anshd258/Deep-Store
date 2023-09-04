enum RequestStatus{cart, pending,ongoing, success, failed}
enum QueryType{get,post}

enum FilterValue { FOOD, RIDES, RENTALS }
enum VehicleType {TWO_WHEELER, FOUR_WHEELER}
enum Component {
  ownerOngoingcards,
  ownerOngoingcardsIMAGE,
  ownerOngoingcardsDESC
}


extension VehicleTypeExtension on VehicleType {
  String toShortString() {
    return this.toString().split('.').last;
  }

  static VehicleType fromString(String? value) {
    return VehicleType.values.firstWhere(
      (type) => type.toShortString() == value,
      orElse: () => VehicleType.TWO_WHEELER,
    );
  }
}

