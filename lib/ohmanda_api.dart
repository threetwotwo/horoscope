import 'package:horoscope/sign.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OhmandaApi {
  final baseUrl = 'ohmanda.com';

  Future<String?> getDailyHoroscope(Sign sign) async {
    try {
      final uri = Uri.http(baseUrl, '/api/horoscope/${signString(sign)}');
      final response = await http.get(uri);
      final json = jsonDecode(response.body) as Map;

      return json['horoscope'];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
