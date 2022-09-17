import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  String lat;
  String long;
  static const _apiKey = '8702a6098979741040d535aea5a4843c';
  NetworkingHelper({required this.lat, required this.long});

  Future<Map<String, dynamic>> getData() async {
    final queryParameters = {
      'lat': lat,
      'lon': long,
      'appid': _apiKey,
    };
    var url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    print('URL: $url');

    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> getDataForCity(String city) async {
    final queryParameters = {
      'q': city,
      'appid': _apiKey,
    };
    var url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    print('URL: $url');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
