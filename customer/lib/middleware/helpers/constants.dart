enum RequestStatus { hold, processing, confirmed, ready, delivered, completed, failed }

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


  int mapRequestStatusToInt(RequestStatus status) {
    switch (status) {
      case RequestStatus.hold:
        return 0;
      case RequestStatus.processing:
        return 1;
      case RequestStatus.confirmed:
        return 2;
      case RequestStatus.ready:
        return 3;
      case RequestStatus.delivered:
        return 4;
      case RequestStatus.completed:
        return 5;
      case RequestStatus.failed:
        return 6;
      default:
        throw ArgumentError('Invalid RequestStatus value: $status');
    }
  }

   RequestStatus mapIntToRequestStatus(int status) {
    switch (status) {
      case 0:
        return RequestStatus.hold;
      case 1:
        return RequestStatus.processing;
      case 2:
        return RequestStatus.confirmed;
      case 3:
        return RequestStatus.ready;
      case 4:
        return RequestStatus.delivered;
      case 5:
        return RequestStatus.completed;
      case 6:
        return RequestStatus.failed;
      default:
        throw ArgumentError('Invalid RequestStatus integer: $status');
    }
  }