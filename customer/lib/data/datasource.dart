import 'dart:convert';
import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/data/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:customer/middleware/helpers/constants.dart';

class DataSource {
  static String backend = 'https://brisphere-django-backend.agreeablebush-b77b4bbe.southeastasia.azurecontainerapps.io';

  static const String getMenu = 'service/get-menu/';
  static const String createOrder = 'service/create-order/';
  static const String updateOrder = 'service/update-order/';
  static const String addItems = 'service/add-items/';
  static const String findOrders = 'service/find-orders/';
  static const String findAllOrders = 'service/find-all-orders/';
  static const String updateItem = 'service/update-item/';
  static const String removeItem = 'service/remove-item/';
  static const String getOtp = '/user/get-otp/';
  static const String getUser = '/user/get-user/';
  static const String createUser = '/user/create-user/';
  static const String checkIn = '/user/checkin/';
  static const String checkOut = '/user/checkout';

  static Future<ApiResponse?> getData({
    QueryType queryType = QueryType.get,
    required String path,
    String? url,
    String? username,
    String? password,
    Map<String, dynamic>? urlParameters,
    Map<String, dynamic>? body = const {},
  }) async {

    Uri endpoint = Uri.https(backend, path, urlParameters);
    final String bodyAsString = json.encode(body);

    late http.Response response;

    try {
      switch (queryType) {
        case QueryType.get:
          response = await http.get(endpoint);
          break;
        case QueryType.post:
          response = await http.post(endpoint, body: bodyAsString);
          break;
      }

      if (response.statusCode == 200) {
        ApiResponse apiResponse = ApiResponse.fromJson(
            json.decode(const Utf8Decoder().convert(response.bodyBytes)));


        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('unable to fetch data!');
      }
      return null;
    }
  }
}
