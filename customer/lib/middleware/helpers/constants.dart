enum RequestStatus { failed,hold, processing, confirmed, ready, delivered, completed}

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
        return RequestStatus.failed;
      case 1:
        return RequestStatus.hold;
      case 2:
        return RequestStatus.processing;
      case 3:
        return RequestStatus.confirmed;
      case 4:
        return RequestStatus.ready;
      case 5:
        return RequestStatus.delivered;
      case 6:
        return RequestStatus.completed;
      default:
        throw ArgumentError('Invalid RequestStatus integer: $status');
    }
  }