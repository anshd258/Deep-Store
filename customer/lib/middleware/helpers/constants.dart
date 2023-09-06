enum RequestStatus{cart, pending,ongoing, success, failed}
enum QueryType{get,post}

enum FilterValue { FOOD, RIDES, RENTALS }
enum VehicleType {TWO_WHEELER, FOUR_WHEELER}
enum Component {
  ownerOngoingcards,
  ownerOngoingcardsIMAGE,
  ownerOngoingcardsDESC
}
const baseUrl =
    "brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io";


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

