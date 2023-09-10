import 'dart:convert';
import 'package:customer/data/models/apiresponse.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:customer/middleware/helpers/constants.dart';

class DataSource {
  static String backend =
      'brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io';

  // static const String getMenu = 'service/get-menu/';

  static const String getFoodOrder = '/service/find-foodorder';

  static const String getAllFoodOrder = '/service/find-all-foodorders';
  static const String getAllRideRequests = '/service/find-all-riderequests';
  static const String getAllRentalRequests = '/service/find-all-rentalrequests';

  static const String getAllFoods = '/service/get-all-foods';
  static const String getAllRentals = '/service/find-all-rentals';

  static const String createFoodOrder = '/service/create-foodorder';
  static const String createRideRequest = '/service/create-riderequest';
  static const String createRentalRequest = '/service/create-rentalrequest';

  static const String updateFoodOrder = '/service/update-foodorder';
  static const String addFoodItem = '/service/add-fooditems';
  static const String getOtp = '/user/get-otp';

  /// create user
  /// get user
  /// checkIn (room number and hotel selection)
  /// checkOut

  static Future<ApiResponse?> getData(
      {QueryType queryType = QueryType.get,
      required String path,
      String? url,
      String? username,
      String? password,
      Map<String, dynamic>? urlParameters,
      Map<String, dynamic>? body = const {},
      Map<String, String>? headers}) async {
    Uri endpoint = Uri.https(
        'brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io',
        path,
        urlParameters);

    final String bodyAsString = json.encode(body);

    late http.Response response;

    try {
      switch (queryType) {
        case QueryType.get:
          response = await http.get(endpoint, headers: headers);
          break;
        case QueryType.post:
          response = await http.post(
            endpoint,
            body: bodyAsString,
          );
          break;
      }

      if (response.statusCode == 200) {
        print('yayyyyyyyyyyyyyyyyyyyyyyy');
        print(json.decode(response.body));
        ApiResponse apiResponse =
            ApiResponse.fromJson(json.decode(response.body));
        print(apiResponse.foodItems);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('unable to fetch data! $e');
      }
      return null;
    }
  }
}
