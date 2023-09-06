import 'dart:convert';

import 'package:http/http.dart';

import 'constants.dart';

Future<Response?> getData({
  QueryType queryType = QueryType.get,
  required String path, //convert this to enum later
  Map<String, String>? headers,
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
  print(body);
  print(headers);
  print(endpoint);

  late Response response;


  try {
    switch (queryType) {
      case QueryType.get:
        response = await get(endpoint);
        break;
      case QueryType.post:
        response = await post(endpoint, body: body, headers: headers);
        break;
    }

    if (response.statusCode == 200) {
      print(response.statusCode);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      return null;
    }
  } catch (e) {
    return null;
  }
}
