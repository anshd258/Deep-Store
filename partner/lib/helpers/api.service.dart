import 'dart:convert';

import 'package:http/http.dart';
import 'package:partner/helpers/constants.dart';

Future getData({
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

  late Response response;
  print(endpoint);

  try {
    switch (queryType) {
      case QueryType.get:
        response = await get(endpoint);
        break;
      case QueryType.post:
        response = await post(endpoint, body: bodyAsString, headers: headers);
        break;
    }

    if (response.statusCode == 200) {
      print(response.statusCode);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      Map body = json.decode(response.body);
      throw (Exception(body['status']));
    }
  } on Exception catch (e) {
    rethrow;
  }
}
