import 'dart:convert';
import 'package:customer/data/models/apiresponse.dart';
import 'package:http/http.dart' as http;
import 'package:customer/middleware/helpers/constants.dart';

class DataSource {
  static late String backend;

  static void init({required String backendUrl}) {
    backend = backendUrl;
  }

  static Future<ApiResponse?> getData({
    QueryType queryType = QueryType.get,
    required String path, //convert this to enum later
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
      print('shit!');
      return null;
    }
  }
}
