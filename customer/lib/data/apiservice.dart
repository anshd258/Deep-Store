import 'dart:convert';
import 'dart:io';

import 'package:customer/middleware/helpers/storage.utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/apiendpoints.dart';
import '../constants/localstorage.keys.dart';

enum QueryType { get, post }

class ApiService {
  static Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? urlParameters,
    Map<String, String>? headers,
  }) async {
    late http.Response response;

    /// step 1: get Access Token.
    String? accessToken =
        await LocalStorage.read(key: LocalStorageKeys.accessToken);

    /// step 2: call API
    try {
      response = await http.get(
          Uri.http(ApiEndpoints.baseURL, endpoint, urlParameters),
          headers: headers ??
              {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader: "Bearer $accessToken"
              });

      return json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print('unable to GET data! for endpoint: $endpoint due to $e');
      }
    }
  }

  static Future<dynamic> post({
    required String endpoint,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    late http.Response response;

    String? accessToken =
        await LocalStorage.read(key: LocalStorageKeys.accessToken);

    try {
      response = await http.post(Uri.http(ApiEndpoints.baseURL, endpoint),
          body: json.encode(body),
          headers: headers ??
              {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader: "Bearer $accessToken"
              });

      return json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print('unable to POST data! for endpoint: $endpoint due to $e');
      }
    }
  }
}
