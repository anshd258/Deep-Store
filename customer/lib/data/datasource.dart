import 'dart:convert';
import 'dart:io';
import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/middleware/helpers/sharedprefrence.utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:customer/middleware/helpers/constants.dart';

class DataSource {
  static String backend =
      'brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io';

  // static const String getMenu = 'service/get-menu/';

  static const String getFoodOrder = '/service/find-foodorder/';
  static const String getOrderByType = '/service/get-order-by-type';

  static const String getAllFoodOrder = '/service/find-all-foodorders';
  static const String getAllRideRequests = '/service/find-all-riderequests';
  static const String getAllRentalRequests = '/service/find-all-rentalrequests';

  static const String getAllFoods = '/service/get-all-foods';
  static const String getAllRentals = '/service/find-all-rentals';

  static const String createFoodOrder = '/service/create-foodorder';
  static const String createRideRequest = '/service/create-ride/';
  static const String createRentalRequest = '/service/create-rentalbooking/';

  static const String updateFoodOrder = '/service/update-foodorder/';
  static const String addFoodItem = '/service/add-fooditems/';
  static const String removeFoodItem = '/service/remove-fooditems/';
  static const String getOtp = '/user/login/';
  static const String updateRoomNumber = '/user/update-user/';
  static const String getUserDetails = '/user/get-user/';

  static const String orderPayment = '/service/order-payment/';
  static const String orderVerification = '/service/order-verify/' ;

  static Future<ApiResponse?> getData({
    QueryType queryType = QueryType.get,
    required String path,
    Map<String, dynamic>? urlParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? body = const {},
  }) async {
    Uri endpoint = Uri.https(
        'brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io',
        path,
        urlParameters);

    final String bodyAsString = json.encode(body);
    print(path);
    String? accessToken = await SharedPreferencesUtils.getString(
        key: SharedPrefrencesKeys.accessToken);
    if (accessToken == null) {
      // use refereshtoken to get new access token
    }

    late http.Response response;

    try {
      switch (queryType) {
        case QueryType.get:
          response = await http.get(endpoint,
              headers: headers ??
                  {
                    HttpHeaders.contentTypeHeader: "application/json",
                    HttpHeaders.authorizationHeader: "Bearer $accessToken"
                  });
          break;
        case QueryType.post:
          response = await http.post(
            headers: headers ??
                {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $accessToken"
                },
            endpoint,
            body: bodyAsString,
          );
          break;
      }
      if (response.statusCode == 200) {
        print(response.body);
        ApiResponse apiResponse =
            ApiResponse.fromJson(json.decode(response.body));
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      print('unable to fetch data! for $path  $e');
      return null;
    }
  }

  static Future<http.Response?> get({
    QueryType queryType = QueryType.get,
    required String path,
    Map<String, dynamic>? urlParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? body = const {},
  }) async {
    Uri endpoint = Uri.https(
        'brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io',
        path,
        urlParameters);

    final String bodyAsString = json.encode(body);
    String? accessToken = await SharedPreferencesUtils.getString(
        key: SharedPrefrencesKeys.accessToken);
    if (accessToken == null) {
      // use refereshtoken to get new access token
    }

    late http.Response response;

    try {
      switch (queryType) {
        case QueryType.get:
          response = await http.get(endpoint,
              headers: headers ??
                  {
                    HttpHeaders.contentTypeHeader: "application/json",
                    HttpHeaders.authorizationHeader: "Bearer $accessToken"
                  });
          break;
        case QueryType.post:
          response = await http.post(
            headers: headers ??
                {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $accessToken"
                },
            endpoint,
            body: bodyAsString,
          );
          break;
      }
      print(response.body);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('unable to fetch data! $e');
      }
      return null;
    }
  }
}
