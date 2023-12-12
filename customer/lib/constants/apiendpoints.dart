class ApiEndpoints {
  // static String baseURL = 'nestafar-backend-3iyl4griiq-ue.a.run.app';
  // static String baseURL = '10.0.2.2:8000';  /// for AVD
  static String baseURL = '192.168.56.1:8000';  /// for real android phone testing

  static const String getFoodOrder = '/service/find-foodorder/';
  static const String getOrderByType = '/service/get-order-by-type';

  static const String getAllFoodOrder = '/service/get-user-order';
  static const String getAllRideRequests = '/service/get-user-ride';
  static const String getAllRentalRequests = '/service/find-all-rentalrequests';

  static const String getAllFoods = '/service/get-all-foods';
  static const String getAllRentals = '/service/get-all-rentals';

  static const String createFoodOrder = '/service/create-foodorder';
  static const String createRideRequest = '/service/create-ride/';
  static const String createRentalRequest = '/service/create-rentalbooking/';

  static const String updateFoodOrder = '/service/update-foodorder/';
  static const String addFoodItem = '/service/add-fooditems/';
  static const String removeFoodItem = '/service/remove-fooditems/';

  static const String getOtp = '/user/login/';

  static const String updateUserDetails = '/user/update-user/';
  static const String getUserDetails = '/user/get-user/';

  static const String orderPayment = '/service/order-payment/';
  static const String orderVerification = '/service/order-verify/';
} 


