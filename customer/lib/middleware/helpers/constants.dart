enum RequestStatus{cart, pending,ongoing, success, failed}
enum QueryType{get,post}

enum value { FOOD, RIDES, RENTALS }
enum VehicleType {TWO_WHEELER, FOUR_WHEELER}

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

