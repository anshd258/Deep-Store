import 'dart:convert';

import 'package:http/http.dart';
import 'package:partner/helpers/constants.dart';

Future getData({
  QueryType queryType = QueryType.get,
  required String path, //convert this to enum later
  Map<String, String>? headers = const {
    'Content-Type': 'application/json',
  },
  Map<String, dynamic>? urlParameters,
  Map<String, dynamic>? body = const {},
  Map<String, String>? multiPartBody = const {},
}) async {
  Uri endpoint = Uri.https(
    baseUrl,
    path,
    urlParameters,
  );
  final String bodyAsString = json.encode(body);

  late Response response;
  // print(body);
  // print(headers);

  try {
    switch (queryType) {
      case QueryType.get:
        response = await get(endpoint, headers: headers);
        break;
      case QueryType.post:
        response = await post(endpoint, body: bodyAsString, headers: headers);
        break;
    }

    if (response.statusCode == 200) {
      // print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      Map body = json.decode(response.body);
      throw (Exception(body['status']));
    }
  } on Exception {
    rethrow;
  }
}
