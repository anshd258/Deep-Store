enum RequestStatus { cart, pending, ongoing, success, failed }

enum QueryType { get, post }

enum FilterValue { FOOD, RIDES, RENTALS }

enum VehicleType { TWO_WHEELER, FOUR_WHEELER }

class SharedPrefrencesKeys {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String room = 'room';
  static const String propertyId  = 'propertyId';
  static const String userPhoneNumber = 'phoneNumber';
  static const String location  = 'location';

}

enum Component {
  ownerOngoingcards,
  ownerOngoingcardsIMAGE,
  ownerOngoingcardsDESC
}

const baseUrl =
    "brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io";


