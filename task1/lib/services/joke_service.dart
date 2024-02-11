// ignore_for_file: prefer_const_declarations

import 'package:plypicker/model/joke_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiUrl = 'https://api.api-ninjas.com/v1/jokes?limit=5';
final String apiKey = '5uk0W7wL0Wgtr8fyIEn3Nw==fX37YC4v8a60LiZv';

class JokeService {
  Future<List<Joke>> fetchJokes() async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-Api-Key': apiKey,
      });

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Joke.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load jokes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch jokes: $e');
    }
  }
}
